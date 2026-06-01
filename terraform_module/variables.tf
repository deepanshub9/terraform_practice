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

variable "private_endpoint_subnet_name" {
  type = string
}

variable "private_endpoint_subnet_prefixes" {
  type = list(string)
}

variable "route_table_name" {
  type = string
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
