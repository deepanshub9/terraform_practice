# Terraform RG Lab - Modular Azure Infrastructure

This directory contains a modular Terraform configuration for Azure infrastructure organized by resource type. Each module is self-contained and can be reused across different environments.

## 📁 Directory Structure

```
terraform-rg-lab/
├── modules/                      # Reusable infrastructure modules
│   ├── resource_group/           # 🏢 Resource Group Module
│   │   ├── main.tf              # Resource Group resource definition
│   │   ├── variables.tf         # Input variables
│   │   └── outputs.tf           # Output values
│   │
│   ├── storage_account/          # 💾 Storage Account Module
│   │   ├── main.tf              # Storage Account and containers
│   │   ├── variables.tf         # Input variables
│   │   └── outputs.tf           # Output values
│   │
│   └── network/                  # 🌐 Network Modules
│       ├── vnet/                 # Virtual Network Module
│       │   ├── main.tf          # VNet and subnet resources
│       │   ├── variables.tf     # Input variables
│       │   └── outputs.tf       # Output values
│       │
│       ├── nsg/                  # Network Security Group Module
│       │   ├── main.tf          # NSG and security rules
│       │   ├── variables.tf     # Input variables
│       │   └── outputs.tf       # Output values
│       │
│       └── private_endpoint/     # Private Endpoint Module
│           ├── main.tf          # Private endpoint and DNS config
│           ├── variables.tf     # Input variables
│           └── outputs.tf       # Output values
│   │
│   ├── keyvault/                 # 🔐 Key Vault Module
│   │   ├── main.tf              # Key Vault and secrets management
│   │   ├── variables.tf         # Input variables
│   │   └── outputs.tf           # Output values
│   │
│   └── logicapp/                 # ⚙️ Logic App Module
│       ├── main.tf              # Logic App workflow
│       ├── variables.tf         # Input variables
│       └── outputs.tf           # Output values
│
├── main.tf                       # Root module - orchestrates all modules
├── provider.tf                   # Azure provider configuration
├── variables.tf                  # Root level variables
├── outputs.tf                    # Root level outputs
├── terraform.tfvars              # Default variable values
└── README.md                     # This file
```

## 📦 Modules Overview

### Resource Group Module (🏢)
Creates an Azure Resource Group - the foundational container for organizing Azure resources.

**Key Resources:**
- `azurerm_resource_group` - Organizes all resources in a region

### Storage Account Module (💾)
Creates an Azure Storage Account for storing blobs, files, and data with LRS replication.

**Key Resources:**
- `azurerm_storage_account` - Cloud storage for data
- `azurerm_storage_container` - Blob container for reports

### Virtual Network Module (🌐 VNET)
Establishes network infrastructure with subnets for resource isolation.

**Key Resources:**
- `azurerm_virtual_network` - Main network container
- `azurerm_subnet` - Application subnet
- `azurerm_subnet` - Private endpoint subnet

### Network Security Group Module (🌐 NSG)
Implements firewall rules controlling inbound/outbound traffic.

**Key Resources:**
- `azurerm_network_security_group` - Firewall rules container
- `azurerm_network_security_rule` - Individual security rules (Allow HTTPS)
- `azurerm_subnet_network_security_group_association` - NSG-Subnet association

### Private Endpoint Module (🌐 PRIVATE ENDPOINT)
Ensures secure private connectivity to Azure services without internet exposure.

**Key Resources:**
- `azurerm_private_endpoint` - Secure connection to storage
- `azurerm_private_dns_zone` - DNS resolution for private links
- `azurerm_private_dns_zone_virtual_network_link` - VNet-to-DNS linking

### Key Vault Module (🔐)
Manages secrets, keys, and certificates securely with access policies.

**Key Resources:**
- `azurerm_key_vault` - Secure secrets storage
- `azurerm_key_vault_access_policy` - Permission management
- `azurerm_key_vault_secret` - Stored credentials

### Logic App Module (⚙️)
Creates workflow automation for service orchestration.

**Key Resources:**
- `azurerm_logic_app_workflow` - Automated workflow container

## 🚀 Getting Started

### Prerequisites
- Terraform >= 1.5.0
- Azure Terraform Provider >= 4.0
- Azure CLI installed and authenticated
- Azure subscription with appropriate permissions

### Quick Start

1. **Navigate to the lab directory:**
   ```bash
   cd terraform-rg-lab
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Review the plan:**
   ```bash
   terraform plan -out=plan.tfplan
   ```

4. **Deploy resources:**
   ```bash
   terraform apply plan.tfplan
   ```

5. **View outputs:**
   ```bash
   terraform output
   ```

## 📝 Configuration

### terraform.tfvars
Contains default values for all variables. Edit this file to customize:
- Resource names and locations
- Network address spaces and subnets
- Security group configurations
- Storage and Key Vault settings

Example:
```hcl
resource_group_name = "rg-lab-001"
location            = "francecentral"
vnet_name          = "vnet-lab-001"
address_space      = ["10.0.0.0/16"]
# ... more variables
```

## 🔐 Security Best Practices

✅ **Network Security**
- NSG restricts traffic to HTTPS (443) only
- Private endpoints for secure storage access
- VNet isolation for resource containment

✅ **Secret Management**
- Key Vault for credential storage
- Soft delete protection enabled
- Purge protection enabled

✅ **Access Control**
- RBAC policies for Key Vault access
- Private access by default for storage

## 📊 Module Dependencies

```
Resource Group (foundation)
  ├─ Virtual Network
  │  ├─ App Subnet
  │  └─ Private Endpoint Subnet
  │
  ├─ Network Security Group
  │  └─ (associated with App Subnet)
  │
  ├─ Storage Account
  │  └─ Private Endpoint
  │      └─ (uses Private Endpoint Subnet + DNS)
  │
  ├─ Key Vault
  │  └─ Access Policies
  │
  └─ Logic App
```

## 🔄 Modular Architecture Benefits

- **Reusability**: Each module can be used independently
- **Maintainability**: Clear separation of concerns
- **Testability**: Modules can be tested in isolation
- **Scalability**: Easy to add new resource types
- **Documentation**: Each module self-documented

## 🛠️ Common Operations

### Deploy Single Module
```bash
# Deploy only Virtual Network
terraform apply -target=module.vnet
```

### Destroy Resources
```bash
# Destroy all
terraform destroy

# Destroy specific module
terraform destroy -target=module.storage_account
```

### Update Module Parameters
```bash
# Edit terraform.tfvars, then:
terraform plan
terraform apply
```

### View Module Outputs
```bash
terraform output -json | jq '.resource_group_name'
```

## 📚 Variable Reference

| Variable | Type | Default | Purpose |
|----------|------|---------|---------|
| resource_group_name | string | - | RG name |
| location | string | francecentral | Azure region |
| vnet_name | string | - | VNet name |
| address_space | list(string) | - | VNet CIDR |
| subnet_name | string | - | App subnet name |
| subnet_prefixes | list(string) | - | App subnet CIDR |
| nsg_name | string | - | NSG name |
| storage_account_name | string | - | Storage account name |
| private_endpoint_subnet_name | string | - | PE subnet name |
| private_endpoint_subnet_prefix | list(string) | - | PE subnet CIDR |
| key_vault_name | string | - | KV name |
| logic_app_name | string | - | Logic app name |
| tags | map(string) | See default | Resource tags |

## 🔗 Module References

Each module can be referenced as:
```hcl
module.resource_group.resource_group_name
module.storage_account.storage_account_id
module.vnet.vnet_id
module.nsg.nsg_name
module.key_vault.key_vault_uri
module.logic_app.logic_app_id
```

## 📞 Troubleshooting

**Error: "Subscription not found"**
- Run `az login` to authenticate with Azure
- Verify subscription: `az account show`

**Error: "Unauthorized to perform action"**
- Check RBAC permissions in Azure Portal
- Ensure Service Principal has required roles

**State Lock Issue**
- Remove lock: `terraform force-unlock <LOCK_ID>`

## 📖 Additional Resources

- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure Best Practices](https://learn.microsoft.com/en-us/azure/architecture/framework/)
- [Terraform Modules](https://www.terraform.io/language/modules)

## 🎯 Environment-Specific Configuration

To use different configs per environment (dev, staging, prod):

```bash
# Dev environment
terraform plan -var-file="dev.tfvars"

# Production environment  
terraform plan -var-file="prod.tfvars"
```

---

**Created by:** Terraform Automation
**Last Updated:** 2026-06-01
**Managed By:** Infrastructure as Code
