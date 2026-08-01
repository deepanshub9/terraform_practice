resource "azurerm_virtual_network" "main" {

  name = var.vnet_name

  location = var.location

  resource_group_name = var.resource_group_name

  address_space = var.address_space

}
resource "azurerm_subnet" "subnets" {

  for_each = var.subnets

  name = each.key

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = each.value.address_prefixes

}
