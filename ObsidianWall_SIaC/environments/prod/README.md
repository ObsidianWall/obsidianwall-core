
#### file: 📁`obsidianwall-core/ObsidianWall_SIaC/environments/prod/README.md`



# Production Environment

This is the production deployment of secure, composable infrastructure using ObsidianWall modules.

---
## Modules Used

- `aws-ec2`
- `azure-vm`
- `ndr-aws-ec2` or `ndr-azure-vm`
- `azure-storage`
- (Optional) `netbird-vpn` module for peer-to-peer encrypted overlay network

---

## How to Deploy

```bash
cd ObsidianWall_SIaC/environments/prod
terraform init
terraform apply
```
---
## Notes
 - Security posture is locked down: enforced encryption, ZTA defaults, IAM roles, NDR agents.

 - Module behavior may vary from dev (e.g., instance types, monitoring, tags).

---
## Tags
Zero Trust, Hardened, Runtime Observability, Logging, NDR
