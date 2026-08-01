resource "azurerm_network_security_group" "nsg" {

  for_each = var.nsgs

  name = each.key

  location = var.location

  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet_network_security_group_association" "association" {

  for_each = var.nsgs

  subnet_id = var.subnet_ids[each.value.subnet_name]

  network_security_group_id = azurerm_network_security_group.nsg[each.key].id

}
