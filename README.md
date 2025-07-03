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


├── ObsidianWall_SIaC/
│   └── modules/                    ← 🔸 All modules live under /modules
│       ├── aws-ec2/                ← Example AWS EC2 module
|       │   ├── main.tf                ← Core Terraform configuration
|       |   ├── network.tf             ← Network configuration
│       │   ├── variables.tf           ← Input variables
│       │   ├── outputs.tf             ← Outputs for other modules
│       │   ├── security.tf              ← Security policies
│       │   ├── versions.tf               ← Terraform version constraints
│       │   ├── README.md             ← Module documentation
│       │   ├── .gitignore            ← Ignore local files
│       │   └── .github/workflows/    ← Local module-level GitHub Actions
│       │       └── ci-security.yml
│       └── ...
├── README.md                         ← Main documentation
├── provider.tf                   
├── .gitignore                        ← Ignore local files
|── versions.tf                       ← Terraform version constraints

