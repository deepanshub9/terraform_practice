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
