
## file:📁 `obsidianwall-core/docs/dev/architecture.md`



# ObsidianWall Architecture (Work in Progress)

> This document outlines the high-level architecture and design principles behind the ObsidianWall platform. It is a living document that will evolve alongside the platform.

---

## 🎯 Goals of the Architecture

- Enable secure-by-default infrastructure deployments across cloud platforms
- Provide a composable and modular IaC structure
- Integrate build-time and runtime security into the lifecycle
- Support centralized and/or federated deployment patterns
- Promote multi-cloud flexibility while enforcing consistent security baselines

---

## 🧱 Core Components

### 1. **SIaC Modules**
Reusable Terraform modules for secure infrastructure components.

- Example modules:
  - `aws-ec2`
  - `azure-vm`
  - `ndr-aws-ec2`
  - `netbird-vpn-server` *(planned)*
- Each module is:
  - Self-contained
  - Secure by design
  - Built with pre-commit and GitHub Actions workflows

---

### 2. **Environment Blueprints**
Higher-order compositions that combine modules into real-world deployments.

- Example: `environments/secure-api-gateway/`
- Defines `main.tf`, `providers.tf`, and calls reusable modules
- Can be used for different application scenarios and verticals

---

### 3. **CI/CD Pipeline (GitHub Actions)**
Used to automate validation, scanning, and module testing.

- Global workflows:
  - `ci-security.yml`
  - `validate-terraform.yml`
- Module-local workflows:
  - Each module contains its own `.github/workflows/ci-security.yml`
- Pre-commit hooks mirror global checks locally

---

### 4. **Security Observability Layer**
(Planned phase 2–3)

- Deployable NDR modules (Zeek/Suricata) with integrations into:
  - Microsoft Sentinel
  - AWS Security Hub
  - Azure Monitor
- Optional: logs ingested into centralized UI/portal
- Supports correlation between runtime incidents and IaC source

---

## 📡 Integration Points

| Component             | Purpose                          | Integration With             |
|----------------------|----------------------------------|------------------------------|
| Terraform Modules     | Provision secure infrastructure  | Terraform CLI / Terraform Cloud |
| SIEM Tools            | External log ingestion           | Sentinel / Splunk / Azure Monitor |
| NDR Modules           | Runtime traffic inspection       | Zeek / Suricata / Elastic     |
| Secrets Management    | Runtime secrets resolution       | AWS Secrets Manager / Azure Key Vault |

---

## 🔄 Security Lifecycle

```plaintext
Design ➜ IaC Module ➜ Pre-Commit Hooks ➜ GitHub Actions ➜ Provisioning ➜ Runtime Observability ➜ Feedback Loop ➜ Improvement
```

## 🧭 Planned Enhancements

  Threat modeling templates

  Runtime → IaC misconfiguration mapping

  Custom policy-as-code enforcement engine

  Secure onboarding wizard for module configuration

## 🧭 Future Enhancements

## 📌 Notes

  This is not a monolithic platform — it’s composable by default

  All security integrations are optional and pluggable

  Deployment flows can be CI-driven or CLI-based


## 📎 Related Docs

  docs/dev/structure-overview.md

  docs/dev/workflows.md

  docs/sec/threat-model.md

  docs/user/deploying-modules.md

----

