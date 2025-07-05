# files: docs/dev/workflows.md

# CI/CD & Automation Workflows Overview

This document outlines the structure and function of ObsidianWall’s automated workflows, including pre-commit hooks, CI/CD pipelines, module-level scans, and runtime integrations.

> ObsidianWall workflows are designed with security-first principles, CI/CD scalability, and developer productivity in mind. All workflows align with shift-left security and future-ready automation practices.

---

## 🔁 Workflow Tiers

| Workflow Tier       | Scope             | Description                                                                 |
|---------------------|------------------|-----------------------------------------------------------------------------|
| Global CI/CD        | Repo-wide        | Runs security and validation across all modules when PRs affect them       |
| Module-local CI     | Per-module       | Each module can define local `.github/workflows/ci-security.yml` to enable isolated validation and scanning |
| Pre-commit Hooks    | Local developer  | Ensures validation and security scans run before code reaches GitHub       |
| Runtime Integration | Optional, future | Runtime log feeds from NDR modules can be correlated to originating IaC     |

---

## ⚙️ GitHub Actions (CI/CD)

### 🔐 `ci-security.yml`
Located at: `.github/workflows/ci-security.yml`

- Performs **static security scans** using:
  - [tfsec](https://github.com/aquasecurity/tfsec)
  - [Checkov](https://github.com/bridgecrewio/checkov)
- Scans are run on all module directories using a matrix strategy

### 🧪 `validate-terraform.yml`
Located at: `.github/workflows/validate-terraform.yml`

- Performs:
  - `terraform init`
  - `terraform fmt -check`
  - `terraform validate`
  - `terraform plan` (dry run)

---

## 🧩 Per-Module Workflows

Every module should optionally include:
 modules/aws-ec2/.github/workflows/ci-security.yml


These allow targeted security scans and faster feedback cycles.

---

## 🧲 Pre-Commit Hook Workflow

Located at: `.pre-commit-config.yaml`

Hooks run locally before commit:

| Hook ID            | Description                                  |
|--------------------|----------------------------------------------|
| `terraform_fmt`    | Formats Terraform code                       |
| `terraform_validate` | Validates Terraform syntax and logic        |
| `tflint`           | Lints Terraform best practices               |
| `terraform_docs`   | Auto-generates Terraform variable tables     |
| `tfsec`            | Runs static security scans                   |
| `checkov`          | Runs broader IaC configuration checks        |

> 🧠 Pre-commit setup instructions are in `CONTRIBUTING.md`

---

## 📦 Runtime Security Workflow (Optional)

For users deploying NDR modules (e.g., `ndr-aws-ec2`, `ndr-azure-vm`), security logs can be forwarded to:

- Microsoft Sentinel
- AWS Security Hub
- Splunk
- Or ingested by a future ObsidianWall runtime UI

These logs correlate runtime alerts to the specific IaC that provisioned them.

---

## 📚 Related Docs

- `docs/dev/structure-overview.md`
- `docs/dev/module-readme-template.md`
- `.github/workflows/ci-security.yml`
- `.github/workflows/validate-terraform.yml`

----

_Last updated: 07/04/2025_

