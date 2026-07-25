# ==============================================================================
# Key Vault Variables
# ==============================================================================

variable "key_vault_name" {
  description = "Name of the Key Vault (must be globally unique)"
  type        = string
}

variable "location" {
  description = "Azure region for Key Vault"
  type        = string
  default     = "francecentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "sql_password" {
  description = "SQL admin password to store in Key Vault"
  type        = string
  sensitive   = true
  default     = "MySecurePassword123!"
}

variable "tags" {
  description = "Tags to apply to Key Vault"
  type        = map(string)
  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
