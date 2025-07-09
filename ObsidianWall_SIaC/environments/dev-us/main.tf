
# main.tf
# This file contains the main configuration for the ObsidianWall development environment in Azure.



module "keyvault" {
  source              = "../../modules/azure-keyvault"
  name                = "obsidian-dev-kv"
  location            = "eastus"
  resource_group_name = "obsidian-rg"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
}
