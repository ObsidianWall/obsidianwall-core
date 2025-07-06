
## file: 📁 `obsidianwall-core/docs/sec/compliance.md`



# 🔍 Compliance Strategy & Enforcement  
_Deep Dive: docs/sec/compliance.md_

---

## 🎯 Purpose

This document outlines the mechanisms, philosophy, and tools ObsidianWall uses to enable and support compliance alignment with regulatory frameworks (e.g., NIST 800-53, SOC 2, PCI-DSS, HIPAA, ISO 27001).

ObsidianWall does **not** guarantee regulatory certification — instead, it provides composable building blocks and enforcement capabilities to help your teams achieve and maintain compliance posture across cloud environments.

---

## 📐 Core Design Principles

- **Security-as-Code & Compliance-as-Code**
- **Declarative Policies and Automated Validation**
- **Composable & Auditable Infrastructure**
- **Shift-Left Compliance** — validate before runtime

---

## 🧰 Tools & Policy Engines

| Tool               | Purpose                                            | Stage        |
|--------------------|----------------------------------------------------|--------------|
| `tfsec`            | Terraform static analysis for security best practices | Build-time   |
| `checkov`          | Deep misconfiguration checks + framework mapping   | Build-time   |
| `tflint`           | Linting + enforceable custom rulesets              | Build-time   |
| `terraform-docs`   | Generates standardized, auditable docs             | Build-time   |
| AWS IAM Analyzer   | Least privilege + access path validation           | Cloud-native |
| Azure Policy        | Declarative cloud compliance rules                 | Cloud-native |
| `conftest` + OPA   | Custom Rego-based policy-as-code checks            | Optional     |
| `Zeek`/`Suricata`  | Runtime visibility + audit trails via NDR modules  | Runtime      |

---

## 📋 Framework Mapping Strategy

ObsidianWall does not hardcode framework-specific logic. Instead:

- We map security controls (from checkov/tfsec) to **common compliance families**:
  - 🔐 Identity (NIST AC-1, SOC2 Access Controls)
  - 🛡️ Encryption (NIST SC-12, PCI-DSS 3.4)
  - 📜 Logging (ISO 27001 A.12.4)
  - 🌐 Network security (NIST SC-7, HIPAA 164.312)
  - ⚠️ Alerting & Monitoring (NIST SI-4, SOC2 Monitoring)

- Each module can include a `compliance-mapping.md` (future feature) to:
  - Document how its configuration aligns with known controls
  - Provide references to rules triggered in CI/CD scans
  - Link to mitigations or required downstream controls

---

## 🧱 Runtime Enforcement Strategy

> Runtime observability is optional — but powerful.

When users deploy **NDR modules**, runtime logs provide:

- ✅ Confirmed network activity trails
- 🧩 Contextual alerts tied back to deployed IaC modules
- 🔍 Integration into SIEMs (Sentinel, Splunk, OpenSearch)

These logs can validate real-world enforcement of least privilege, logging, firewall rules, and behavior baselines — helping teams **prove compliance, not just claim it**.

---

## 🌍 Cloud-Native vs. Open Source

| Cloud-Native Tool     | Notes                        | Cost              |
|------------------------|------------------------------|-------------------|
| AWS IAM Analyzer       | Free for basic usage         | Mostly Free       |
| Azure Policy + Defender| May incur cost (Defender tier)| Mixed             |
| Open Policy Agent (OPA)| OSS policy engine            | Free              |
| Conftest               | OSS tool for Rego testing     | Free              |

We support **multi-backend compliance validation** so users can choose AWS, Azure, or OSS stack based on:
- Budget
- Custom policy needs
- Integration preferences

---

## 🧠 Future: ObsidianWall Policy Core

> A reusable policy-core module that defines portable, auditable baseline security policies.

- ❗Pluggable policies for each module
- 🔄 Rego, JSON, or YAML rules embedded and validated in CI
- 📁 Shared policy packs (e.g., `baseline-minimum.tf`, `nist-mappings.json`)
- 📦 Terraform `policy_library` integration

---

## 🔗 Extending with Your Own Frameworks

You can inject your own compliance logic by:

- Adding custom `checkov` policies in `.checkov.yml`
- Creating OPA rules and applying them via `conftest`
- Using `terraform validate -json` for parsing custom logic
- Wrapping modules with `compliance_wrappers` in your CI/CD

---

## 📤 Exporting Compliance Artifacts

> (Coming Soon)

- JSON exports of passing/failing controls
- PDF/Markdown summaries for audit sharing
- CI-based compliance history tracking

---

## ✅ Summary

ObsidianWall gives you:

- Pre-built compliance-aligned modules
- Enforcement hooks during build-time
- Optional runtime visibility
- Support for cloud-native and open-source policy tools
- Roadmap to deeper automation and policy-as-code libraries

For consumer-level summary, refer to: [`COMPLIANCE.md`](obsidianwall-core/COMPLIANCE.md)

---


