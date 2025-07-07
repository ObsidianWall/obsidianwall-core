
#### filepath: `obsidianwall-core/docs/dev/ci-structure.md`


# CI Structure

ObsidianWall uses a layered CI/CD design:

## 🧱 Repo-Level Workflows

- `.github/workflows/validate-terraform.yml`: Validates, formats, and runs `terraform plan`.
- `.github/workflows/ci-security.yml`: Runs `tfsec`, `checkov`, and `tflint` (optional).
- `.github/workflows/scripts-ci.yml`: Lints and checks security on Bash/Python scripts.

## 🔁 Reusable Module Workflow

All Terraform modules delegate their CI to:
- `.github/workflows/module-ci-template.yml`

This avoids repetition across 10+ modules. To use it:

```yaml
uses: your-org/your-repo/.github/workflows/module-ci-template.yml@main
with:
  working-directory: ObsidianWall_SIaC/modules/<module-name>

