# ==============================================================================
# Logic App Variables
# ==============================================================================

variable "logic_app_name" {
  description = "Name of the Logic App"
  type        = string
}

variable "location" {
  description = "Azure region for Logic App"
  type        = string
  default     = "francecentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to Logic App"
  type        = map(string)
  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
