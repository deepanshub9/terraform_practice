# ==============================================================================
# Resource Group Variables
# ==============================================================================

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region for the resource group"
  type        = string
  default     = "francecentral"
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
