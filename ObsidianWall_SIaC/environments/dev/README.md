
## file: 📁 `obsidianwall-core/ObsidianWall_SIaC/environments/dev/README.md`


# Dev Environment

This environment sets up infrastructure for development and testing purposes. It is not production-grade and may use looser security defaults or lower-cost instance types.

---
## Modules Used

- `aws-ec2`
- `azure-vm`
- `netbird-vpn` (optional)
- `azure-storage` (optional)

---

## How to Deploy

```bash
cd ObsidianWall_SIaC/environments/dev
terraform init
terraform apply
```
---

## Notes
 - This environment may include cloud-init/ scripts for bootstrapping lightweight monitoring or VPN configuration.

 - Uses shared remote backend from ../shared/remote-backend.tf for consistent state management.

---
## Tags
Development, Non-Prod, Lower Isolation

---


