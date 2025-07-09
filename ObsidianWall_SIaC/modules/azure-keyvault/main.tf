
# filepath: ObsidianWall_SIaC/modules/azure-keyvault/main.tf
# main.tf


resource "azurerm_key_vault" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  sku_name            = "standard"
}
