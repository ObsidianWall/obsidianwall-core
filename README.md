#### file: 📁 `obsidianwall-core/README.md`
---

# ObsidianWall

**Composable Infrastructure. Secure by Default.**  
_Your cloud’s first and last line of defense._

---

## 🧩 What is ObsidianWall?

**ObsidianWall** is a modular, multi-cloud **Security Infrastructure-as-Code (SIaC)** platform built for security-conscious teams. It provides **pre-secured**, production-ready Terraform modules designed for AWS and Azure — and validates them at build time and runtime for continuous security assurance.

---

## 🔐 Why ObsidianWall?

Unlike generic IaC libraries, ObsidianWall focuses on:

- ✅ **Security by Design**: Hardened modules with restrictive defaults and policy enforcement.
- 🔄 **Build-Time + Runtime Validation**: Shift-left and drift detection in one platform.
- 🌐 **Multi-Cloud Ready**: AWS & Azure support with reusable, composable modules.
- 🧠 **Integrated Threat Context**: Links security alerts back to the IaC source.
- 📦 **Composability**: Mix-and-match Terraform modules like Lego™ bricks.
- 🛡️ **Compliance-Aware**: CI pipelines enforce NIST, SOC 2, PCI-DSS baselines.
- 🛠️ **DevEx Ready**: Pre-commit hooks, secure CI/CD, standardized docs & pipelines.

---

## 📦 Module Structure

Each module follows:


```
ObsidianWall_SIaC/
└── modules/
    ├── aws-ec2/                        ← 🔸 Example AWS EC2 module
    │   ├── main.tf                     ← Core Terraform configuration
    │   ├── network.tf                  ← Optional: networking setup
    │   ├── variables.tf                ← Input variables
    │   ├── outputs.tf                  ← Output values
    │   ├── security.tf                 ← Security policies (e.g. SGs, IAM)
    │   ├── versions.tf                 ← Terraform version constraints
    │   ├── README.md                   ← Usage docs for this module
    │   ├── .gitignore                  ← Ignore unnecessary local files
    │   └── .github/
    │       └── workflows/
    │           └── ci-security.yml     ← Module-level security CI pipeline
    ├── azure-vm/
    │   └── ...
    └── ndr-aws-ec2/
        └── ...
```

---

## 🚀 Getting Started

### 1. Install Pre-Commit (recommended)

```bash
brew install pre-commit     # or pipx install pre-commit
pre-commit install          # installs Git hooks
pre-commit run --all-files  # run all hooks on existing files (e.g., initial check)
```



### 2. Clone & Deploy a Module

```bash
git clone https://github.com/ObsidianWall/ObsidianWall-Core.git
cd ObsidianWall_SIaC/modules/aws-ec2
terraform init
terraform apply
```
All modules are security-scanned at commit via pre-commit and at PR via GitHub Actions.

### 3. Validate Security Policies

🛡️ Security & CI/CD
✅ Static Scans: tfsec, checkov, tflint

🧪 CI Pipelines:

ci-security.yml: dual static scan on module matrix

validate-terraform.yml: format, validate, and speculative plan

🔐 Secrets Management: Best practices enforced via AWS Secrets Manager / Azure Key Vault


### 4. 🔍 Example: Deploy Netbird VPN with AWS EC2

```bash
cd ObsidianWall_SIaC/modules/netbird-ec2
terraform init
terraform apply
# This deploys a hardened Netbird VPN server on AWS EC2 with security policies applied.
```
---
## 💬 Community

| Docs                   | Discussions             | Issues                   | Terraform Registry (TBA) |
| ---------------------- | ----------------------- | ------------------------ | ------------------------ |
| [📘 Docs (WIP)](docs/) | [💬 Chat](discussions/) | [🐛 Report Bug](issues/) | [🌍 Registry](#)         |

---

## 🤝 Contributing

We welcome secure-by-default contributions! Please review:

CONTRIBUTING.md     

Pre-commit setup & style guide

Pull Request Template


## 🛠️ Development Setup

To run the linter and scanners locally:

```bash
pre-commit run --all-files
```
---

## 📜 License

MIT License © 2025 ObsidianWall Contributors

---
## 🎨 Brand Identity

Logo: assets/logo.png

Primary Color: Ash Grey #B2B2B2

Secondary: Obsidian Black #0A0A0A

Accent: Carbon Steel #4D4D4D

---

