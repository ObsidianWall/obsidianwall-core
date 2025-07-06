
## 📁 `obsidianwall-core/ObsidianWall_SIaC/examples/full-stack-combo/README.md`


---

# Example: Full-Stack Infrastructure Deployment

This example stack deploys a composable and secure full-stack environment combining:

- EC2 or VM workloads
- VPN overlay via Netbird
- Storage modules
- Optional runtime NDR module

---

## Architecture

```text
[ DevSecOps ] --> [ Terraform ]
                      |
       -------------------------------------
      |           |           |           |
    Netbird     EC2/VM      Storage     NDR
     VPN       Compute     (Azure)    Runtime

```
---

## How to Deploy
```
cd ObsidianWall_SIaC/examples/full-stack-combo
terraform init
terraform apply
```
---
## Features
 - Modular Zero Trust architecture

 - Each component pluggable or optional

 - Supports hybrid-cloud setups

 ---

## Good For
 - Demoing ObsidianWall to stakeholders

 - Customer POCs

 - Internal pre-production full-stack tests

 ---