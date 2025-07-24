#### file: 📁`obsidianwall-core/ObsidianWall_SIaC/modules/azure-vm/README.md`


---

# `azure-vm` Module for Azure Virtual Machines

Securely provisions an Azure VM using best practices.

## 🚀 Features

- Ubuntu LTS VM
- SSH key access only
- Disk & network encryption by default
- NSG with secure rules
- Optional cloud-init for customization

## 🧩 Usage

```hcl
module "azure_vm" {
  source            = "../../modules/azure-vm"
  resource_group    = var.resource_group
  vm_size           = var.vm_size
}
```
---
## ✅ Inputs / Outputs
Refer to variables.tf / outputs.tf.

## 🔐 Security Notes
 - Uses SSH key, disables password login

 - Encrypted data disks

 - Hardened baseline via cloud-init

---



