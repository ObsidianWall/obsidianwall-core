
# filepath: ObsidianWall_SIaC/modules/azure-keyvault/main.tf
# This module provisions a Key Vault in Azure.
# This module creates an Azure Key Vault with the specified parameters.


resource "azurerm_key_vault" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  sku_name            = "standard"
}
