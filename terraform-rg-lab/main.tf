# ==============================================================================
# RG Lab - Root Module Configuration
# ==============================================================================
# This is the main orchestration file that uses all modular components.
# All resources are organized by module type (Resource Group, Storage Account,
# Network, Key Vault, Logic App) for better maintainability and reusability.
# ==============================================================================

# Resource Group Module - Foundation for all resources
module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.common_tags
}

# Virtual Network Module - Network infrastructure with subnets
module "vnet" {
  source = "./modules/network/vnet"

  vnet_name                      = var.vnet_name
  address_space                  = var.address_space
  location                       = var.location
  resource_group_name            = module.resource_group.resource_group_name
  subnet_name                    = var.subnet_name
  subnet_prefixes                = var.subnet_prefixes
  private_endpoint_subnet_name   = var.private_endpoint_subnet_name
  private_endpoint_subnet_prefix = var.private_endpoint_subnet_prefix
  tags                           = local.common_tags
}

# Network Security Group Module - Firewall rules and network traffic control
module "nsg" {
  source = "./modules/network/nsg"

  nsg_name            = var.nsg_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.vnet.app_subnet_id
  tags                = local.common_tags
}

# Storage Account Module - Cloud data storage
module "storage_account" {
  source = "./modules/storage_account"

  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location
  tags                 = local.common_tags
}

# Private Endpoint Module - Secure connectivity to storage
module "private_endpoint" {
  source = "./modules/network/private_endpoint"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  vnet_id             = module.vnet.vnet_id
  subnet_id           = module.vnet.private_endpoint_subnet_id
  storage_account_id  = module.storage_account.storage_account_id
  tags                = local.common_tags
}

# Key Vault Module - Secrets and credentials management
module "key_vault" {
  source = "./modules/keyvault"

  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  tags                = local.common_tags
}

# Logic App Module - Workflow automation
module "logic_app" {
  source = "./modules/logicapp"

  logic_app_name      = var.logic_app_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  tags                = local.common_tags
}

# Common tags applied to all resources
locals {
  common_tags = merge(
    var.tags,
    {
      Environment = "Lab"
      ManagedBy   = "Terraform"
    }
  )
}
