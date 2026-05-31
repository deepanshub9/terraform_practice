data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
}
resource "azurerm_subnet" "app_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes
}
resource "azurerm_network_security_group" "app_nsg" {

  name = var.nsg_name

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

}
resource "azurerm_network_security_rule" "allow_https" {

  name = "Allow-HTTPS"

  priority = 100

  direction = "Inbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "443"

  source_address_prefix = "*"

  destination_address_prefix = "*"

  resource_group_name = azurerm_resource_group.rg.name

  network_security_group_name = azurerm_network_security_group.app_nsg.name

}
resource "azurerm_subnet_network_security_group_association" "app_assoc" {

  subnet_id = azurerm_subnet.app_subnet.id

  network_security_group_id = azurerm_network_security_group.app_nsg.id

}


resource "azurerm_storage_account" "storage" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}


resource "azurerm_subnet" "private_endpoint_subnet" {

  name = var.private_endpoint_subnet_name

  resource_group_name = azurerm_resource_group.rg.name

  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = var.private_endpoint_subnet_prefix

}


resource "azurerm_private_endpoint" "storage_pe" {

  name = "pe-storage"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  subnet_id = azurerm_subnet.private_endpoint_subnet.id

  private_service_connection {

    name = "storage-private-connection"

    private_connection_resource_id = azurerm_storage_account.storage.id

    subresource_names = ["blob"]

    is_manual_connection = false

  }

  private_dns_zone_group {

    name = "storage-zone-group"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.storage_dns.id
    ]
  }

  tags = var.tags
}

resource "azurerm_private_dns_zone" "storage_dns" {

  name = "privatelink.blob.core.windows.net"

  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags

}

resource "azurerm_private_dns_zone_virtual_network_link" "storage_dns_link" {

  name = "storage-dns-link"

  resource_group_name = azurerm_resource_group.rg.name

  private_dns_zone_name = azurerm_private_dns_zone.storage_dns.name

  virtual_network_id = azurerm_virtual_network.vnet.id

  registration_enabled = false

}
resource "azurerm_key_vault" "kv" {

  name = var.key_vault_name

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  tenant_id = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  purge_protection_enabled = true

  soft_delete_retention_days = 7

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "terraform_user" {

  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id

  object_id = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore"
  ]
}

resource "azurerm_key_vault_secret" "sql_password" {

  name = "sql-admin-password"

  value = "MySecurePassword123!"

  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_user
  ]
}
data "azurerm_key_vault_secret" "sql_password" {

  name = "sql-admin-password"

  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_secret.sql_password
  ]
}
