# ==============================================================================
# Logic App Module
# ==============================================================================
# Purpose: Creates an Azure Logic App workflow for automating integration
# and orchestration of services in the lab environment.
# ==============================================================================

resource "azurerm_logic_app_workflow" "logicapp" {
  name                = var.logic_app_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}
