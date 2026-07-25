# ==============================================================================
# Logic App Outputs
# ==============================================================================

output "logic_app_id" {
  value       = azurerm_logic_app_workflow.logicapp.id
  description = "The ID of the Logic App"
}

output "logic_app_name" {
  value       = azurerm_logic_app_workflow.logicapp.name
  description = "The name of the Logic App"
}

output "logic_app_endpoint" {
  value       = azurerm_logic_app_workflow.logicapp.access_endpoint
  description = "The access endpoint of the Logic App"
}
