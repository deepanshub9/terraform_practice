# ==============================================================================
# Virtual Network Module
# ==============================================================================
# Purpose: Creates an Azure Virtual Network (VNet) which provides network
# isolation for resources. Includes app subnet and private endpoint subnet
# for secure connectivity and resource isolation.
# ==============================================================================

# Main Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = var.tags
}

# App Subnet
resource "azurerm_subnet" "app_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes
}

# Private Endpoint Subnet
resource "azurerm_subnet" "private_endpoint_subnet" {
  name                 = var.private_endpoint_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.private_endpoint_subnet_prefix
}
