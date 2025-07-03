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