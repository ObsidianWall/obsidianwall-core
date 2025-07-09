
# outputs.tf
# This file defines the outputs for the Azure Key Vault resource in the dev-us environment.



output "vault_uri" {
  value = module.keyvault.vault_uri
}


