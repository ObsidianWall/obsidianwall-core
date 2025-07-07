
#### filepath: `obsidianwall-core/docs/dev/ci-structure.md`



# CI/CD Structure Overview

This document outlines how continuous integration workflows are structured in the ObsidianWall repository.

---

## 🗂 Workflow Types

| Type | File | Purpose |
|------|------|---------|
| ✅ Reusable Template | `.github/workflows/module-ci-template.yml` | Standard CI logic for all modules |
| 🔁 Module CI | `ObsidianWall_SIaC/modules/*/.github/workflows/ci-security.yml` | Calls the reusable workflow |
| 🔍 Lint Scripts | `.github/workflows/scripts-ci.yml` | Lints shell and Python scripts |
| 🔐 Global Security Scan | `.github/workflows/ci-security.yml` | Matrix scan across modules with tfsec + checkov |
| ✅ Terraform Validate | `.github/workflows/validate-terraform.yml` | Validate + format + plan |
| 🛠 Health Check | `.github/workflows/validate-ci-health.yml` | Scheduled validation of repo CI coverage |

---

## 🤖 Automation Scripts

Automation logic lives in `ObsidianWall_SIaC/scripts/`  
See `scripts.md` for usage.

---

## 🧪 Test Module

Use `modules/test-module/` to verify that CI workflows behave correctly before applying them repo-wide.

---

## 🧱 Adding New Modules

1. Create a new folder in `modules/`
2. Run `auto-patch-ci.py` to:
   - Add to matrix CI files
   - Create `ci-security.yml`
3. Confirm via `validate-ci-health.sh`
