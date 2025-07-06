#### file: 📁`obsidianwall-core/.github/PULL_REQUEST_TEMPLATE.md`


---
name: Pull Request Template
about: Use this template for all pull requests.


# 📋 Pull Request Checklist

**Summary of Changes**
- [ ] Describe what’s changed and why.

**CI/CD & Code Quality**
- [ ] `terraform fmt`, `terraform validate`, and `plan` have all succeeded.
- [ ] Pre-commit hooks (`tfsec`, `checkov`, `tflint`) have run locally.

**Security & Compliance**
- [ ] Module includes or updates security defaults.
- [ ] `ci-security.yml` and `validate-terraform.yml` updated if adding a new module.
- [ ] Tagging scripts have been updated and passed (if needed).

**Documentation**
- [ ] New or modified modules have a `README.md` based on the template.
- [ ] Relevant docs updated (`docs/dev`, `docs/sec`, `docs/user`, etc.).

**Testing / Examples**
- [ ] Test/demo environment validated (`examples/<name>` or `environments/`).
- [ ] Cloud-init scripts tested (if applicable).

---

**Notes**
Provide any additional information/context for reviewers.

**Reviewer Checklist**
- [ ] Review the summary of changes.