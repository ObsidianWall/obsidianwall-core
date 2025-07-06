
## file: 📁`obsidianwall-core/ObsidianWall_SIaC/scripts/README.md`

---

# `scripts/`

This directory contains helpful utilities used across ObsidianWall:

- **validate-tags.py** — Ensures all resources follow your organization's tagging policy.
- **cleanup-resources.sh** — Helps developers clean up test environments quickly.
- (Add descriptions for any additional scripts.)

---

### 🛠️ Usage

1. Make sure dependencies are installed (e.g., Python for tag validation).
2. Run scripts from repo root:
   ```bash
   cd ObsidianWall_Core/ObsidianWall_SIaC/scripts
   ./validate-tags.py --help
  ```
3. Review output and apply fixes as instructed.  

---

### 📌 Integration
- CI/CD pipelines call validate-tags.py to enforce tag standards.

 - Cleanup script helps clear test infra in dev environments.

---
