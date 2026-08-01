module "resource_group" {

  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name

  location = var.location

}
module "network" {

  source = "./modules/network"

  vnet_name = var.vnet_name

  resource_group_name = module.resource_group.resource_group_name

  location = var.location

  address_space = var.address_space

  subnets = var.subnets

}
