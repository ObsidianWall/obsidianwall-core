# file: 📁 ` obsidianwall-core/CONTRIBUTING.md`

# Contributing to ObsidianWall

Thank you for your interest in contributing to **ObsidianWall**, the Security Infrastructure-as-Code (SIaC) platform designed to provision secure, composable cloud infrastructure.

We welcome contributions of all kinds — from new modules to improving documentation, fixing bugs, or suggesting new features. Here's how to get started.

---

## 🛠️ Prerequisites

To contribute effectively, please ensure you have:

- [Terraform](https://www.terraform.io/downloads.html) (v1.6.6 or higher)
- Python (for `checkov`, `tflint`, etc.)
- Git
- [Pre-commit](https://pre-commit.com/)
- Optional: Docker, Node.js, etc. for advanced testing or CI/CD workflows

---

## 🔁 Project Structure Overview
```
ObsidianWall-Core/
├── ObsidianWall_SIaC/
│ └── modules/
│ ├── aws-ec2/
│ ├── azure-vm/
│ ├── ndr-aws-ec2/
│ └── ndr-azure-vm/
├── .github/
│ └── workflows/
│ └── *.yml
├── .pre-commit-config.yaml
├── README.md
├── docs/
│ └── dev/
│ └── CONTRIBUTING.md (you are here)
```


---

## 🚦 Workflow Summary

| Area                     | Tooling/Policy                                                   |
|--------------------------|------------------------------------------------------------------|
| Terraform Validation     | `terraform fmt`, `validate`, `plan`                              |
| Static Security Scans    | `tfsec`, `checkov`                                               |
| Linting / Docs           | `tflint`, `terraform-docs`                                       |
| CI/CD                    | GitHub Actions + Matrix Workflow                                |
| Local Dev Hooks          | Managed via `.pre-commit-config.yaml`                            |

---

## 🚧 Local Development Setup

To ensure quality and consistent formatting, we use [pre-commit](https://pre-commit.com/). To set up:

```bash
# 1. Install pre-commit if not already installed
pip install pre-commit

# 2. Install the hooks
pre-commit install

# 3. (Optional) Run on all files
pre-commit run --all-files

# 4. (optional) If you want to run specific hooks, you can do so:
pre-commit run <hook_id>
```
---
## ✍️ Contributing a New Module

To contribute a new module, please follow these steps:

1. Fork the repo and create a new branch from `main`
2. Create your new module in:  
   `ObsidianWall_SIaC/modules/<your-module-name>/`

   > 💡 Refer to [`docs/dev/naming-conventions.md`](docs/dev/naming-conventions.md) for the correct naming rules and examples.

3. Include the following files in your module:
    - `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`
    - Optional: `network.tf`, `security.tf`, `cloud-init/` (for provisioning VMs with cloud-init)
    - `README.md` —  
      > 📄 Use the **template** in [`docs/dev/module-readme-template.md`](docs/dev/module-readme-template.md).  
      This template includes the required sections: description, usage, input/output variables, security notes, and examples. It helps ensure that all modules are consistently documented and easy to use.

4. Include a local GitHub Actions security workflow:  
   `ObsidianWall_SIaC/modules/<module>/.github/workflows/ci-security.yml`

5. Run `pre-commit` locally and fix any issues.


6. Submit a PR with:
    - A clear title and description
    - Link to any related issues (if applicable)
---

## 🔍 Module Quality Checklist

Before submitting your module, make sure it passes all required validation and security checks:

 terraform fmt

 terraform validate

 tfsec

 checkov

 tflint

 Module-specific CI workflow exists at .github/workflows/ci-security.yml

 Module is included in repo-wide:

.github/workflows/ci-security.yml

.github/workflows/validate-terraform.yml

---

## 🛠️ Improvements & Fixes

For bug fixes or improvements to existing modules:

Create a new branch from main

Use clear, descriptive commit messages and PR titles

Adhere to the existing module structure and naming conventions

If relevant, add test/demo configs under:
ObsidianWall_SIaC/environments/examples/

---

## 📄 Documentation Contributions
To contribute or update documentation:

Edit relevant .md files under docs/

Make sure to link new content from the README.md or other appropriate docs

For new modules:

  Provide a complete README.md

  Use the standard template: docs/dev/module-readme-template.md

---

## ✅ Final PR Checklist

Before opening a PR:

  pre-commit passes on all modified files

  terraform plan completes with no errors

  README.md is present for new modules

  Security workflows (local + global) are correctly configured

--- 


## ✅ CI/CD Expectations

When you open a PR:

terraform validate, plan, fmt will run automatically

Static security tools tfsec and checkov will run across changed modules

Your PR will be blocked if:

  Terraform formatting fails

  Security violations are critical

  Module naming/structure deviates from standards

---

## 🧠 Guidelines & Philosophy

Security First: Every module should enforce secure defaults.

Composable by Design: Favor modular, reusable code.

Declarative Infrastructure: No imperative bash scripts unless absolutely necessary.

Zero Hardcoding: Always use variables for sensitive or environment-specific config.

Cloud Agnostic Where Possible: But follow native best practices (e.g., AWS S3 encryption block, Azure NSG config).

---

## 🤝 Code of Conduct

We expect all contributors to follow our Code of Conduct to ensure a respectful and inclusive environment.

---
## 🙋 Need Help?

If you're unsure how to start, open a Discussion or tag your PR with help-wanted.

We’re happy to guide new contributors. 🧱🛡️

---
**Happy building,**

The ObsidianWall Team

---
