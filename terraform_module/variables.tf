variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "subnet_prefixes" {
  type = list(string)
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
