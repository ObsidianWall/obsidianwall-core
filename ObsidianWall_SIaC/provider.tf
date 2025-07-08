
# filepath: ObsidianWall_SIaC/provider.tf

# This file contains the provider configurations for Azure and AWS.



provider "azurerm" {
  features {}
}

provider "aws" {
  region = "us-east-1"
}
