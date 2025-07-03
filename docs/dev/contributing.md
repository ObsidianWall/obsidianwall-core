# Contributing to ObsidianWall

---

### ✅ Summary of Where Things Belong

| File/Instruction                    | Location                         | Purpose                                      |
|------------------------------------|----------------------------------|----------------------------------------------|
| `.pre-commit-config.yaml`          | `ObsidianWall-Core/`             | Controls local pre-commit hooks              |
| GitHub Actions (global)            | `ObsidianWall-Core/.github/`     | CI for whole repo or repo-wide modules       |
| GitHub Actions (per-module)        | `ObsidianWall_SIaC/modules/...`  | CI security scan for individual modules      |
| Pre-commit setup instructions      | `README.md` or `CONTRIBUTING.md` | Tells devs how to enable local hooks         |

Would you like me to generate a full `.pre-commit-config.yaml` based on your stack and modules (e.g., `terraform fmt`, `tfsec`, `checkov`, `tflint`, etc.)?
