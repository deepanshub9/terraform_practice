variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "francecentral"
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "address_space" {
  description = "VNet Address Space"
  type        = list(string)
}
variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_prefixes" {
  description = "Subnet CIDR"
  type        = list(string)
}
variable "nsg_name" {
  description = "Network Security Group Name"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Environment = "Dev"
    Owner       = "Deepanshu"
    ManagedBy   = "Terraform"
  }
}
variable "private_endpoint_subnet_name" {
  description = "Private Endpoint Subnet Name"
  type        = string
}

variable "private_endpoint_subnet_prefix" {
  description = "Private Endpoint Subnet CIDR"
  type        = list(string)
}
variable "key_vault_name" {
  description = "Key Vault Name"
  type        = string
}

