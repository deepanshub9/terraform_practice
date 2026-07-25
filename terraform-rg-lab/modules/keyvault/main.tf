# ==============================================================================
# Key Vault Module
# ==============================================================================
# Purpose: Creates an Azure Key Vault for secure storage and management of
# secrets, keys, and certificates. Includes access policies for Terraform
# management and storage of database credentials.
# ==============================================================================

resource "azurerm_key_vault" "kv" {
  name                       = var.key_vault_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = true
  soft_delete_retention_days = 7

  tags = var.tags
}

# Key Vault Access Policy for Terraform
resource "azurerm_key_vault_access_policy" "terraform_user" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

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

# Key Vault Secret - SQL Admin Password
resource "azurerm_key_vault_secret" "sql_password" {
  name         = "sql-admin-password"
  value        = var.sql_password
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [azurerm_key_vault_access_policy.terraform_user]
}

# Data source to retrieve the SQL password
data "azurerm_key_vault_secret" "sql_password" {
  name         = "sql-admin-password"
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [azurerm_key_vault_secret.sql_password]
}

# Get current Azure client context
data "azurerm_client_config" "current" {}
