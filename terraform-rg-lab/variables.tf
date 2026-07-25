# ==============================================================================
# RG Lab - Input Variables
# ==============================================================================
# These variables define all the inputs needed for the lab environment.
# They can be overridden via terraform.tfvars, CLI flags, or environment
# variables prefixed with TF_VAR_.
# ==============================================================================

# Resource Group Variables
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region where resources will be deployed"
  type        = string
  default     = "francecentral"
}

# Virtual Network Variables
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "VNet Address Space (CIDR notation)"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the Application Subnet"
  type        = string
}

variable "subnet_prefixes" {
  description = "Application Subnet CIDR blocks"
  type        = list(string)
}

# Network Security Group Variables
variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

# Storage Account Variables
variable "storage_account_name" {
  description = "Name of the Storage Account (globally unique, lowercase, 3-24 chars)"
  type        = string
}

# Private Endpoint Variables
variable "private_endpoint_subnet_name" {
  description = "Name of the Private Endpoint Subnet"
  type        = string
}

variable "private_endpoint_subnet_prefix" {
  description = "Private Endpoint Subnet CIDR blocks"
  type        = list(string)
}

# Key Vault Variables
variable "key_vault_name" {
  description = "Name of the Key Vault (globally unique)"
  type        = string
}

# Logic App Variables
variable "logic_app_name" {
  description = "Name of the Logic App"
  type        = string
}

# Common Tags Variable
variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Dev"
    Owner       = "Deepanshu"
    ManagedBy   = "Terraform"
  }
}
