
# filepath: modules/azure-storage/versions.tf

# This file defines the required Terraform version and provider versions for the Azure Storage module.


terraform {
  required_version = ">= 1.6.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
