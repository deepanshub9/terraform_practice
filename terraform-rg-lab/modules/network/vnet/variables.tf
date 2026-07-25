# ==============================================================================
# Virtual Network Variables
# ==============================================================================

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "VNet Address Space (CIDR)"
  type        = list(string)
}

variable "location" {
  description = "Azure region for VNet"
  type        = string
  default     = "francecentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_name" {
  description = "Name of the application subnet"
  type        = string
}

variable "subnet_prefixes" {
  description = "Application subnet CIDR blocks"
  type        = list(string)
}

variable "private_endpoint_subnet_name" {
  description = "Name of the private endpoint subnet"
  type        = string
}

variable "private_endpoint_subnet_prefix" {
  description = "Private endpoint subnet CIDR blocks"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to VNet resources"
  type        = map(string)
  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
