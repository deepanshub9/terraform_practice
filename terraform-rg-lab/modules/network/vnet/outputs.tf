# ==============================================================================
# Virtual Network Outputs
# ==============================================================================

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the Virtual Network"
}

output "app_subnet_id" {
  value       = azurerm_subnet.app_subnet.id
  description = "The ID of the application subnet"
}

output "private_endpoint_subnet_id" {
  value       = azurerm_subnet.private_endpoint_subnet.id
  description = "The ID of the private endpoint subnet"
}
