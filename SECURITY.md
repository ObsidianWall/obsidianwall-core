
# files: obsidianwall-core/SECURITY.md

# Security Policy

## 🛡️ ObsidianWall Security Commitment

ObsidianWall is built on a foundation of security-first principles. Our goal is to empower teams to deploy secure infrastructure by default, without needing deep expertise in cloud security. Security is embedded at every layer — from Terraform modules to CI/CD and runtime observability.

---

## 🔐 Reporting Security Issues

If you discover a vulnerability in ObsidianWall’s codebase or workflows, please report it responsibly:

- Email: security@obsidianwall.dev *(placeholder — replace with your contact)*
- Do **not** file public GitHub issues for sensitive vulnerabilities.
- We aim to respond within **72 hours** and issue fixes within **7 business days**, depending on severity.

---

## 🛠️ Secure Development Practices

- **Pre-commit Hooks**: All contributors must use pre-commit checks including `tfsec`, `checkov`, `terraform fmt`, `validate`, and `tflint`.
- **CI/CD Security Scanning**: All modules are scanned in GitHub Actions with dual engines (`tfsec` and `checkov`) on every PR.
- **Terraform Best Practices**:
  - Enforced encryption
  - No hardcoded secrets
  - IAM least-privilege by default
  - Logging and monitoring integration enabled

---

## 🔄 Continuous Auditing

We leverage the following to ensure security drift is minimized:

- `tflint` for style and security linter rules
- `tfsec` and `checkov` for static analysis
- GitHub Actions matrix scanning of modules
- (Future) Runtime NDR observability module for behavior analysis

---

## 📦 Secure Module Design

Every module is designed with:

- Secure defaults (e.g., encryption, access blocks)
- Explicit input validation via `variables.tf`
- Modular CI workflows (`ci-security.yml`) per module
- Version locking via `versions.tf`

---

## 🔄 Security Feedback Loop

We're building toward a complete **IaC + Runtime Security Feedback Loop**. ObsidianWall will surface both build-time posture and runtime findings (via the NDR module) to give teams a unified view of infrastructure security.

---

## 🔏 Dependency Management

- Terraform provider versions are pinned
- GitHub Actions use verified versions (e.g., `hashicorp/setup-terraform@v1`)
- Only verified modules and actions are consumed

---

## 🚨 Incident Response (Placeholder)

Until we finalize a full security incident response process, contributors and users should:

1. Immediately isolate vulnerable infrastructure.
2. Disable any exposed secrets or credentials.
3. Report findings to security@obsidianwall.dev.

---

## 🧩 Future Plans

- Secrets management validation (`aws_secretsmanager`, `azure_key_vault`)
- NIST/PCI-DSS mapping and compliance insights
- Runtime alert correlation to IaC definitions
- Threat modeling docs in `/docs/sec/threat-model.md`

---

Stay secure,  
**The ObsidianWall Team**
