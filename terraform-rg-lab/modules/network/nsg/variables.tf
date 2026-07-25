# ==============================================================================
# Network Security Group Variables
# ==============================================================================

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "location" {
  description = "Azure region for NSG"
  type        = string
  default     = "francecentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with NSG"
  type        = string
}

variable "tags" {
  description = "Tags to apply to NSG"
  type        = map(string)
  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
