resource_group_name = "rg-dev-network"

location = "francecentral"

vnet_name = "vnet-dev"

address_space = [
  "10.0.0.0/16"
]

subnet_name = "subnet-app"

subnet_prefixes = [
  "10.0.1.0/24"
]
nsg_name = "nsg-app"

storage_account_name = "stdeepterraformdev001"

private_endpoint_subnet_name = "subnet-private-endpoint"

private_endpoint_subnet_prefix = [
  "10.0.2.0/24"
]

key_vault_name = "kvdeepanshudev001"
