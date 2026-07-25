# ==============================================================================
# Storage Account Module
# ==============================================================================
# Purpose: Creates an Azure Storage Account for storing blobs, files, and data.
# This module also includes blob container creation and storage configuration
# with LRS replication for lab environments.
# ==============================================================================

resource "azurerm_storage_account" "storage" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

# Storage Container for reports
resource "azurerm_storage_container" "reports" {
  name                  = "reports"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}
