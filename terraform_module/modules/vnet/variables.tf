variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "address_space" {
  description = "VNet CIDR"
  type        = list(string)
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_prefixes" {
  description = "Subnet CIDR"
  type        = list(string)
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group"
  type        = string
}

variable "tags" {
  description = "Common Tags"

  type = map(string)
}
