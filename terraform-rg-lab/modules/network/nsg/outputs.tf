# ==============================================================================
# Network Security Group Outputs
# ==============================================================================

output "nsg_id" {
  value       = azurerm_network_security_group.app_nsg.id
  description = "The ID of the Network Security Group"
}

output "nsg_name" {
  value       = azurerm_network_security_group.app_nsg.name
  description = "The name of the Network Security Group"
}
