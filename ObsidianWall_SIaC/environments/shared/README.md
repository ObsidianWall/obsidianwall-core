
#### file: 📁`obsidianwall-core/ObsidianWall_SIaC/environments/shared/README.md`


---

# Shared Infrastructure Components

This folder contains shared configurations used across environments.

## 🔧 Files

- `providers.tf` – common provider block (Azure/AWS settings)
- `remote-backend.tf` – reusable state backend config (e.g., Azure storage or S3/Terraform Cloud)
- `tags.tf` – global tags for cost center, environment, project

## ✅ Usage

Environments import these blocks using:
```hcl
terraform {
  backend "remote" {
    ...
  }
}

provider "azurerm" { ... }
provider "aws" { ... }

locals {
  common_tags = yamldecode(file("../shared/tags.tf"))
}
```
---
## 🔐 Security Notes
 - Centralizing tags ensures enforcement of security lineage

 - Shared backend ensures state consistency

 ---
 