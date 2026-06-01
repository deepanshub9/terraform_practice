resource "azurerm_virtual_network" "vnet" {

  name = var.vnet_name

  location = var.location

  resource_group_name = var.resource_group_name

  address_space = var.address_space

  tags = var.tags
}


resource "azurerm_subnet" "app_subnet" {

  name = var.subnet_name

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = var.subnet_prefixes

}
resource "azurerm_subnet" "private_endpoint_subnet" {

  name = var.private_endpoint_subnet_name

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = var.private_endpoint_subnet_prefixes

}

resource "azurerm_network_security_group" "app_nsg" {

  name = "${var.subnet_name}-nsg"

  location = var.location

  resource_group_name = var.resource_group_name

  tags = var.tags

}

resource "azurerm_subnet_network_security_group_association" "app_assoc" {

  subnet_id = azurerm_subnet.app_subnet.id

  network_security_group_id = azurerm_network_security_group.app_nsg.id

}

resource "azurerm_route_table" "app_rt" {

  name = var.route_table_name

  location = var.location

  resource_group_name = var.resource_group_name

  tags = var.tags
}
resource "azurerm_subnet_route_table_association" "rt_assoc" {

  subnet_id = azurerm_subnet.app_subnet.id

  route_table_id = azurerm_route_table.app_rt.id

}
