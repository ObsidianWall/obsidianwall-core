## file: 📁 `obsidianwall-core/docs/sec/threat-model.md`



# Threat Model for ObsidianWall

> This document outlines the foundational threat model for the ObsidianWall Secure Infrastructure-as-Code (SIaC) platform.

---

## 🧱 Platform Scope

ObsidianWall provisions **secure-by-default, modular infrastructure** across cloud platforms (e.g., AWS, Azure). This includes:

- Virtual Machines (e.g., `aws-ec2`, `azure-vm`)
- Networked Deployments (VPCs, VNets, VPNs like Netbird)
- Logging & Monitoring Agents
- Optional NDR (Network Detection & Response) Nodes

---

## 🎯 Threat Modeling Approach

We follow a **STRIDE-based** approach with a strong bias toward:

- **Shift-left detection** (CI/CD and IaC static scanning)
- **Least privilege** defaults and RBAC enforcement
- **Runtime anomaly detection** (via optional NDR modules)

---

## 🛡️ Threat Categories and Mitigations

| Threat             | Example Risk | ObsidianWall Mitigation Strategy |
|--------------------|--------------|-----------------------------------|
| **Spoofing**       | Impersonation of users or cloud roles | Secure IAM defaults, no hardcoded credentials, support for federated identity |
| **Tampering**      | Module misconfiguration | CI/CD validation, pre-commit hooks, policy-as-code, signed releases |
| **Repudiation**    | Lack of audit trail | Enable logging for IAM, network, cloud-init; recommend integration with SIEM |
| **Information Disclosure** | Secrets exposed in code or logs | Integration with cloud-native secret managers, no plaintext credentials |
| **Denial of Service (DoS)** | Overconsumption of cloud resources | Resource limits in modules, autoscaling guards, optional rate-limiting proxies |
| **Elevation of Privilege** | Default roles too permissive | Least-privilege role bindings, IAM analysis (e.g., AWS Access Analyzer) |

---

## 🔐 Additional Security Controls

- **CI/CD Enforcement**:
  - `tfsec`, `checkov`, `tflint`, `terraform validate`
  - GitHub workflows must pass before merging to `main`
- **Secrets Hygiene**:
  - No secret values stored in code
  - Use of `AWS Secrets Manager` / `Azure Key Vault` is encouraged
- **Runtime Monitoring (Optional)**:
  - Zeek/Suricata NDR modules can detect lateral movement, DNS exfiltration, unauthorized access
  - SIEM integration supported (Sentinel, Splunk, etc.)

---

## 🚩 Known Limitations

- Runtime behavior depends on deployment configuration (ObsidianWall does not enforce runtime policies unless NDR is deployed)
- Module misuse is possible if users bypass input validation or force override variables

---

## 📅 Maintenance

This threat model will be reviewed:

- Quarterly or during major version releases
- When new cloud service modules are added (e.g., S3, CosmosDB, Kubernetes)

---

