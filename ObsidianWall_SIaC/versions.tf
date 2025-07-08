
# filepath: ObsidianWall_SIaC/versions.tf


# This file defines the required Terraform version and provider versions for the ObsidianWall project.


terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
