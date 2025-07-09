
# filepath: ObsidianWall_SIaC/modules/azure-keyvault/outputs.tf

# outputs.tf

output "vault_uri" {
  value = azurerm_key_vault.example.vault_uri
}

output "vault_id" {
  value = azurerm_key_vault.example.id
}
output "vault_name" {
  value = azurerm_key_vault.example.name
}