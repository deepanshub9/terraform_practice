module "resource_group" {

  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name

  location = var.location

}