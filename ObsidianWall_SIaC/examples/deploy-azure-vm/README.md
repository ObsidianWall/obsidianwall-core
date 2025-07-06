

## 📁 `obsidianwall-core/ObsidianWall_SIaC/examples/deploy-azure-vm/README.md`


---

# Example: Deploy Azure VM

This is a minimal example showing how to provision a secure virtual machine on Azure using ObsidianWall’s `azure-vm` module.

---

## How to Run

```bash
cd ObsidianWall_SIaC/examples/deploy-azure-vm
terraform init
terraform apply
```
---

## Features
 - OS hardening baseline

 - Optional cloud-init/ provisioning (if folder present)

 - Encrypted disk

 - Default network security rules

---

## Notes
 - This is a minimal demo — not suitable for production as-is.

 - You may need to configure service principal credentials via environment variables or a backend.

---
## Related Modules
 - modules/azure-vm

---