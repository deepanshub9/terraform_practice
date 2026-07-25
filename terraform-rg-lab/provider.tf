# ==============================================================================
# Azure Provider Configuration
# ==============================================================================
# Configuration for the Terraform Azure Provider with required version
# specifications. Supports Azure authentication via Azure CLI, Service
# Principal, or Managed Identity.
# ==============================================================================

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  # Authentication methods:
  # 1. Azure CLI: Use 'az login' before running terraform
  # 2. Service Principal: Set environment variables:
  #    - ARM_CLIENT_ID
  #    - ARM_CLIENT_SECRET
  #    - ARM_SUBSCRIPTION_ID
  #    - ARM_TENANT_ID
  # 3. Managed Identity: Automatic when running in Azure (DevOps, Functions)
}