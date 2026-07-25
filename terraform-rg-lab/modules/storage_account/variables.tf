# ==============================================================================
# Storage Account Variables
# ==============================================================================

variable "storage_account_name" {
  description = "Name of the Storage Account (must be globally unique, lowercase, 3-24 chars)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the storage account"
  type        = string
  default     = "francecentral"
}

variable "tags" {
  description = "Tags to apply to the storage account"
  type        = map(string)
  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
