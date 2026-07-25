# ==============================================================================
# Resource Group Outputs
# ==============================================================================

output "resource_group_id" {
  value       = azurerm_resource_group.rg.id
  description = "The ID of the created resource group"
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the created resource group"
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "The location of the resource group"
}
