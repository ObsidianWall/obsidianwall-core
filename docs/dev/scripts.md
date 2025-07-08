
#### fliepath: `obsidianwall-core/docs/dev/scripts.md`

### This document outlines the scripts available in the `docs/dev/scripts` directory, which are designed to assist developers in maintaining and automating various tasks related to CI/CD and module management.

---

### 🧪 `docs/dev/scripts.md`


# Developer Scripts

This directory contains helper tools for automation and CI maintenance.

## validate-ci-health.sh

Validates all modules to ensure required CI is in place (validate, format, lint, etc.)

## auto-patch-ci.py

Python script that can auto-add missing modules to:
- ci-security.yml
- validate-terraform.yml


## Future Scripts

- obsi-cli for scaffolding modules/environments
- Auto-generate README.md or compliance docs

---

---

## 📁 Script Execution Location

All scripts are stored in: `ObsidianWall_SIaC/scripts/`

Ensure they follow naming standards (`kebab-case`) and are properly executable (`chmod +x`).

---

## ✅ Linting & Security for Scripts

CI file: `.github/workflows/scripts-ci.yml` automatically handles this.

| File Type | Tools Used         |
|-----------|--------------------|
| `.sh`     | `shellcheck`, `shfmt` |
| `.py`     | `bandit`, `ruff`      |

---

## 🧠 Usage Guidelines

- Run `validate-ci-health.sh` to detect missing workflows
- Run `auto-patch-ci.py` to patch or create missing module CI files
- All scripts are intended for developer/local and CI execution
