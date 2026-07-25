# ==============================================================================
# Private Endpoint Module
# ==============================================================================
# Purpose: Creates Private Endpoints for secure connectivity to Azure services.
# Includes private DNS zone configuration for blob storage endpoint resolution
# within the virtual network, ensuring private and secure access.
# ==============================================================================

# Private DNS Zone for Storage
resource "azurerm_private_dns_zone" "storage_dns" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name

  tags = var.tags
}

# Private DNS Zone VNet Link
resource "azurerm_private_dns_zone_virtual_network_link" "storage_dns_link" {
  name                  = "storage-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.storage_dns.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
}

# Private Endpoint for Storage Account
resource "azurerm_private_endpoint" "storage_pe" {
  name                = "pe-storage"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "storage-private-connection"
    private_connection_resource_id = var.storage_account_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "storage-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.storage_dns.id]
  }

  tags = var.tags
}
