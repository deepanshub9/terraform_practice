# ==============================================================================
# Private Endpoint Variables
# ==============================================================================

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for Private Endpoint"
  type        = string
  default     = "francecentral"
}

variable "vnet_id" {
  description = "The ID of the Virtual Network"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the Private Endpoint subnet"
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the Storage Account"
  type        = string
}

variable "tags" {
  description = "Tags to apply to Private Endpoint resources"
  type        = map(string)
  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
