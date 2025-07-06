
## 📁 `obsidianwall-core/ObsidianWall_SIaC/environments/staging/README.md`



# Staging Environment

This environment mimics production as closely as possible for testing infrastructure and observability before promoting to prod.

---
## How to Deploy

```bash
cd ObsidianWall_SIaC/environments/staging
terraform init
terraform apply
```
---

## Modules Used
Same as prod/, but may use cost-effective alternatives (e.g., t3.medium instead of m5.large).

----
## Tags
Staging, CI/CD, Preview

----