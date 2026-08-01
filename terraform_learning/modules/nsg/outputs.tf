output "nsg_ids" {

  value = {

    for name, nsg in azurerm_network_security_group.nsg :

    name => nsg.id

  }

}
