## file: 📁`obsidianwall-core/ObsidianWall_SIaC/README.md`


# ObsidianWall SIaC Modules

Welcome to the core of **ObsidianWall’s** Security Infrastructure-as-Code (SIaC) framework.

This directory (`ObsidianWall_SIaC/`) contains the composable, reusable modules that power secure cloud deployments across AWS, Azure, and (soon) other providers.

---

## 📦 Structure Overview
```
ObsidianWall_SIaC/
├── modules/
│ ├── aws-ec2/
│ ├── azure-vm/
│ ├── ndr-aws-ec2/
│ ├── ndr-azure-vm/
│ └── ...
├── environments/
│ ├── dev/
│ ├── prod/
│ └── examples/
└── README.md (you are here)
```

---

## 🧱 What’s Inside?

### `modules/`
> Fully self-contained, production-ready Terraform modules

Each module includes:
- Secure defaults (encryption, logging, IAM least privilege)
- Preconfigured runtime observability options
- Input/output variables
- Built-time validation with `tfsec`, `checkov`, `tflint`
- Per-module GitHub Actions CI

_🔐 All modules enforce **Zero Trust** principles._

---

### `environments/`
> Composable blueprints for multi-module environments

Each environment folder can be used to:
- Build higher-level stacks (e.g., web app infra, secure data lake)
- Demonstrate integration between multiple modules (EC2 + NDR + S3)
- Define real-world deployments for staging, prod, etc.

---

## 🚀 Getting Started

```bash
cd ObsidianWall_SIaC/modules/aws-ec2
terraform init
terraform apply
```
_You can also use the environments/examples/ directory to try out reference stacks._

----

## 🛠 Using the CLI (Future)
We plan to offer a lightweight CLI (obsi) to simplify deploying modules and stacks with consistent naming and secure-by-default configuration.

----

## 🤝 Contributing
To add or modify modules:

 - Follow our CONTRIBUTING.md guidelines

 - Use pre-commit

 - Validate your changes via CI

---


## 💬 Need Help?
Check out:

 - docs/user/deploying-modules.md

 - docs/user/faq.md

 - Discussions or Issues tab


---
_Build securely,_

_🧱 The ObsidianWall Team_

---