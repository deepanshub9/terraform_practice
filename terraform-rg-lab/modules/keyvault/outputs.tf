# ==============================================================================
# Key Vault Outputs
# ==============================================================================

output "key_vault_id" {
  value       = azurerm_key_vault.kv.id
  description = "The ID of the Key Vault"
}

output "key_vault_name" {
  value       = azurerm_key_vault.kv.name
  description = "The name of the Key Vault"
}

output "key_vault_uri" {
  value       = azurerm_key_vault.kv.vault_uri
  description = "The URI of the Key Vault"
}
