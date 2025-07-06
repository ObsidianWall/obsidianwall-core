

# files: obsidianwall-core/ObsidianWall_SIaC/environments/dev/README.md


# Dev Environment

This environment sets up infrastructure for development and testing purposes. It is not production-grade and may use looser security defaults or lower-cost instance types.

## Modules Used

- `aws-ec2`
- `azure-vm`
- `netbird-vpn` (optional)
- `azure-storage` (optional)

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

## 📁 `environments/prod/README.md`


# Production Environment

This is the production deployment of secure, composable infrastructure using ObsidianWall modules.

## Modules Used

- `aws-ec2`
- `azure-vm`
- `ndr-aws-ec2` or `ndr-azure-vm`
- `azure-storage`
- (Optional) `netbird-vpn` module for peer-to-peer encrypted overlay network

## How to Deploy

```bash
cd ObsidianWall_SIaC/environments/prod
terraform init
terraform apply
```
## Notes
 - Security posture is locked down: enforced encryption, ZTA defaults, IAM roles, NDR agents.

 - Module behavior may vary from dev (e.g., instance types, monitoring, tags).

## Tags
Zero Trust, Hardened, Runtime Observability, Logging, NDR

---

## 📁 `environments/staging/README.md`

```markdown
# Staging Environment

This environment mimics production as closely as possible for testing infrastructure and observability before promoting to prod.

## How to Deploy

```bash
cd ObsidianWall_SIaC/environments/staging
terraform init
terraform apply
```
---

