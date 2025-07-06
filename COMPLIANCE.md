
## file: 📁 ` obsidianwall-core/COMPLIANCE.md`


# 🛡️ Compliance Overview

ObsidianWall is designed with compliance and regulatory alignment in mind. While we do not claim out-of-the-box certification (e.g., HIPAA, SOC 2, PCI-DSS), our platform provides composable, security-by-default infrastructure building blocks that **help your organization meet its compliance objectives faster**.

---

## ✅ What We Provide

ObsidianWall modules are:

- **Secure-by-default**: Configured with least privilege IAM, encryption, logging, private networking, and hardened resources.
- **Shift-left**: Automated security validation using `tfsec`, `checkov`, `tflint`, and cloud policy engines.
- **Auditable**: Output from CI/CD and runtime modules is traceable, verifiable, and attributable to specific IaC changes.
- **Composable for Compliance**: Designed to support requirements from common frameworks including:
  - NIST 800-53
  - ISO 27001
  - SOC 2
  - PCI-DSS
  - HIPAA

---

## ⚠️ What You Still Need To Do

While ObsidianWall helps enforce secure infrastructure defaults, you are responsible for:

- **Configuring cloud-native audit services** (e.g., AWS Config, Azure Monitor)
- **Maintaining compliance documentation**
- **Running vulnerability scanning on deployed workloads**
- **Handling application-layer compliance** (ObsidianWall does not cover your app code or databases)

---

## 🔍 Continuous Validation

We support multiple validation engines to ensure infrastructure posture remains compliant over time:

- Terraform static analysis with `tfsec`, `checkov`
- Optional runtime monitoring modules (NDR with Zeek/Suricata)
- Integration-ready with SIEMs like Microsoft Sentinel, Splunk, and OpenSearch

---

## 📜 Certifications

ObsidianWall is not a certified product, but its use can help accelerate your compliance initiatives when used properly within a secure SDLC.

---

For deep technical implementation, policy mapping, and extensibility — see [docs/sec/compliance.md](docs/sec/compliance.md).

---
