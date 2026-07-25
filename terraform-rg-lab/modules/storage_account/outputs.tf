# ==============================================================================
# Storage Account Outputs
# ==============================================================================

output "storage_account_id" {
  value       = azurerm_storage_account.storage.id
  description = "The ID of the storage account"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "The name of the storage account"
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.storage.primary_blob_endpoint
  description = "The primary blob endpoint of the storage account"
}
