# ==============================================================================
# RG Lab - Output Variables
# ==============================================================================
# These outputs expose all resource information created by the modular
# configuration for external consumption and reference.
# ==============================================================================

# Resource Group Outputs
output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "The name of the Resource Group"
}

output "resource_group_id" {
  value       = module.resource_group.resource_group_id
  description = "The ID of the Resource Group"
}

# Virtual Network Outputs
output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "The name of the Virtual Network"
}

output "vnet_id" {
  value       = module.vnet.vnet_id
  description = "The ID of the Virtual Network"
}

output "subnet_name" {
  value       = module.vnet.app_subnet_id
  description = "The ID of the Application Subnet"
}

output "subnet_id" {
  value       = module.vnet.app_subnet_id
  description = "The ID of the Application Subnet"
}

# Network Security Group Outputs
output "nsg_name" {
  value       = module.nsg.nsg_name
  description = "The name of the Network Security Group"
}

# Storage Account Outputs
output "storage_account_name" {
  value       = module.storage_account.storage_account_name
  description = "The name of the Storage Account"
}

output "storage_account_id" {
  value       = module.storage_account.storage_account_id
  description = "The ID of the Storage Account"
}

# Private Endpoint Outputs
output "private_endpoint_id" {
  value       = module.private_endpoint.private_endpoint_id
  description = "The ID of the Private Endpoint"
}

output "private_dns_zone_name" {
  value       = module.private_endpoint.private_dns_zone_name
  description = "The name of the Private DNS Zone"
}

# Key Vault Outputs
output "key_vault_name" {
  value       = module.key_vault.key_vault_name
  description = "The name of the Key Vault"
}

output "key_vault_id" {
  value       = module.key_vault.key_vault_id
  description = "The ID of the Key Vault"
}
