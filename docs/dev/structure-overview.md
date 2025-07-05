
# file: docs/dev/structure-overview.md 

# ObsidianWall Structure Overview

This document outlines the directory and architectural layout of the ObsidianWall platform. This modular and automation-first structure is designed to support scalable Security Infrastructure-as-Code (SIaC), simplify integration with external systems, and future-proof your deployments for an AI-augmented, knowledge-based economy.

---

## 🧠 Philosophy

> ObsidianWall is engineered for **modularity**, **observability**, and **machine-augmentable security workflows**.

- Designed for **cloud-native security automation**
- Compatible with **SIEM/SOAR platforms**, IaC scanners, NDR tools
- Structured for **AI-parsable feedback loops**
- Built to empower teams in the **Industry 4.0 and 5.0** era

---

## 📁 Repository Directory Structure
```plaintext
ObsidianWall-Core/
├── ObsidianWall_SIaC/ # Root directory for all Terraform modules and IaC environments
│ ├── modules/ # Modular, secure-by-default infrastructure components
│ │ ├── aws-ec2/
│ │ ├── azure-vm/
│ │ ├── ndr-aws-ec2/
│ │ └── ndr-azure-vm/
│ └── environments/ # Composable real-world blueprints (multi-module deployments)
│ ├── examples/
│ └── production-ready/
│
├── .github/ # Global CI/CD workflows
│ └── workflows/
│ ├── ci-security.yml
│ ├── validate-terraform.yml
│ └── other*.yml
│
├── .pre-commit-config.yaml # Pre-commit hooks (formatting, validation, security scans)
├── CONTRIBUTING.md
├── SECURITY.md
├── COMPLIANCE.md
├── README.md # Main documentation
│
├── docs/
│ ├── dev/ # Developer-focused documentation
│ │ ├── architecture.md
│ │ ├── structure-overview.md ← you are here
│ │ ├── workflows.md
│ │ ├── naming-conventions.md
│ │ └── module-readme-template.md
│ ├── user/ # User onboarding & tutorials
│ │ ├── quickstart.md
│ │ ├── faq.md
│ │ └── deploying-modules.md
│ └── sec/ # Security-focused design docs
│ ├── threat-model.md
│ ├── compliance.md
│ └── zero-trust.md
```
---

---

## 🔄 Modular Design for Composability & AI-Aware Feedback

- **Each module is isolated** with its own workflows and metadata
- This encourages **micro-security modules** to evolve independently
- Metadata inside `README.md`, `versions.tf`, and Terraform variables are structured to support **AI indexing and feedback**

---

## 🔌 Integration Touchpoints

ObsidianWall supports third-party integration at every stage:

| Phase              | Integration                                  |
|--------------------|----------------------------------------------|
| Build-time         | Pre-commit, TFLint, tfsec, checkov           |
| CI/CD              | GitHub Actions                               |
| Runtime            | Zeek, Suricata, Microsoft Sentinel, etc.     |
| Compliance         | Terraform Policy-as-Code, TFSec, Checkov     |
| Secrets Mgmt       | AWS Secrets Manager, Azure Key Vault         |

---

## 🔧 Developer Velocity Features

- ✅ All modules include GitHub Actions
- 🔁 Centralized and per-module `ci-security.yml`
- 🧪 Examples for end-to-end testing and demos
- 📜 Machine-readable and consistent documentation templates

---

## 🧬 Future-Proofing for Industry 4.0

ObsidianWall is built to evolve with:

- **AI-Augmented DevSecOps Pipelines** — AI can reason over this structure to suggest remediations, generate docs, or trigger response actions
- **Self-Service Infrastructure Security** — Enable product teams to deploy securely without security engineers being bottlenecks
- **Composable Automation Units** — Modules behave as atomic security infrastructure building blocks that scale horizontally across teams, clouds, and business units

---

## 📎 Related Docs

- `docs/dev/architecture.md`
- `docs/dev/naming-conventions.md`
- `docs/user/deploying-modules.md`

---

*Last updated: [07/04/2025]*



