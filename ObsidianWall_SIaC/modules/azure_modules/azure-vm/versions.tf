
#filepath: modules/azure-vm/versions.tf

# This file is used to define the required Terraform version and provider versions for the Azure VM module.



terraform {
  required_version = ">= 1.6.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
