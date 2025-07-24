
# filepath: modules/ndr-azure-vm/version.tf

# This file defines the required Terraform version and provider versions for the NDR Azure VM module.
# It ensures compatibility with the AzureRM provider and sets the minimum Terraform version.




terraform {
  required_version = ">= 1.6.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
