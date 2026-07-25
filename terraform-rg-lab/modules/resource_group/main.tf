# ==============================================================================
# Resource Group Module
# ==============================================================================
# Purpose: Creates an Azure Resource Group that serves as a container for
# organizing and managing all Azure resources in this lab environment.
# ==============================================================================

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}
