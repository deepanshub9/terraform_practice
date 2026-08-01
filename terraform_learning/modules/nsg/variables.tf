variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nsgs" {
  type = map(object({
    subnet_name = string
  }))
}

variable "subnet_ids" {
  type = map(string)
}
