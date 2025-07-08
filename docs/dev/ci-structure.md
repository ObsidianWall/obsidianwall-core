
#### filepath: `obsidianwall-core/docs/dev/ci-structure.md`

---

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

## CI Workflow Layers

| Layer         | Purpose                              | Location                                      |
|--------------|--------------------------------------|-----------------------------------------------|
| Global        | DRY workflows + security + linting   | `.github/workflows/`                          |
| Module        | Reuses global workflows via `uses:`  | `modules/*/.github/workflows/ci-security.yml` |
| Environment   | Validates runtime configuration      | `environments/**/env-runtime.yml`             |
| Examples      | Uses templates to test deployments   | `examples/**/ci-security.yml` (optional)      |
| Scripts       | Lint Bash & Python tools             | `.github/workflows/scripts-ci.yml`            |
| Policy Scan   | Validates policies (AWS/Azure/OPA)   | `validate-policy-*.yml` in `.github/workflows/` |

---

## Versioning Strategy for Actions

To ensure stability, we pin all reusable GitHub Actions by version tag (e.g., `@v12.2170.0`).  
To improve security, we will transition to pinning by full commit SHA for 3rd-party actions.

### ✅ Example

```yaml
- uses: bridgecrewio/checkov-action@v12.2170.0 # TODO: Pin with SHA
```
---

## 🤖 Automation Scripts

Automation logic lives in `ObsidianWall_SIaC/scripts/`  
See [`docs/dev/scripts.md`](scripts.md) for full usage instructions.

---

## 🧪 Test Module

Use `modules/test-module/` to verify that CI workflows behave correctly before applying them repo-wide.

---

## 🔁 DRY Workflow Logic

Each module’s CI file should call the reusable template like so:

```yaml
jobs:
  module-ci:
    uses: ./.github/workflows/module-ci-template.yml
    with:
      working-directory: ObsidianWall_SIaC/modules/your-module-name
```
---

## 🧱 Adding New Modules

1. Create a new folder under ObsidianWall_SIaC/modules/
2. Run `scripts/auto-patch-ci.py` to:
   - Adds the new module to ci-security.yml and validate-terraform.yml
   - Generates a local .github/workflows/ci-security.yml using DRY logic
3. Confirm coverage using scripts/validate-ci-health.sh
