output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "subnet_name" {
  value = azurerm_subnet.app_subnet.name
}

output "subnet_id" {
  value = azurerm_subnet.app_subnet.id
}
