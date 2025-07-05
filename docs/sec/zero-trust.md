# files: docs/sec/zero-trust.md


# Zero Trust Security in ObsidianWall

> This document describes how ObsidianWall embodies and enables Zero Trust principles across cloud deployments.

---

## 🔐 What Is Zero Trust?

**Zero Trust Architecture (ZTA)** is a security paradigm based on the idea that no user, device, or service should be automatically trusted — even if it resides inside the network perimeter.

Core principles:
- **Never trust, always verify**
- **Enforce least privilege**
- **Assume breach**
- **Continuously monitor**

---

## 🧱 How ObsidianWall Enables Zero Trust

ObsidianWall modules are designed to **enforce Zero Trust by default**, both at build-time and optionally at runtime.

| Pillar                       | How ObsidianWall Supports It                                                                 |
|-----------------------------|-----------------------------------------------------------------------------------------------|
| **Identity Verification**   | Enforces IAM roles, MFA-recommended setups, and integration with Azure Entra ID or IAM SSO    |
| **Least Privilege Access**  | IAM roles and policies are tightly scoped with AWS IAM Analyzer and Azure Role Definitions    |
| **Network Segmentation**    | VPC, subnet, and NSG definitions follow deny-by-default and allow-by-intent patterns         |
| **Visibility & Monitoring** | Optional NDR modules (Zeek/Suricata) or SIEM integrations capture real-time traffic + alerts |
| **Encrypted by Default**    | S3 buckets, disks, and network transit are encrypted with customer-managed keys              |
| **CI/CD Enforcement**       | All code changes are validated via security workflows, tfsec, checkov, tflint, etc.          |
| **Secrets Management**      | Sensitive inputs must be referenced from secret managers, never hardcoded                   |

---

## ⚙️ Build-Time Enforcement

ObsidianWall uses:
- Static scanning: `tfsec`, `checkov`
- Pre-commit enforcement: `terraform fmt`, `tflint`, docs
- Module structure mandates secure IAM, private networking, encryption defaults

---

## 🔍 Runtime Observability (Optional)

Modules like `ndr-aws-ec2` or `ndr-azure-vm` inject runtime telemetry via:
- **Zeek or Suricata agents**
- **DNS & packet inspection**
- **Log forwarding to Sentinel, Splunk, or ObsidianWall UI (future)**

This allows for behavior-based policy validation **after** deployment.

---

## 🧪 Example: EC2 with VPN and NDR

```text
User deploys: aws-ec2 + netbird VPN + ndr-aws-ec2
Result:
✔️ Encrypted overlay network
✔️ Minimal public exposure
✔️ Runtime visibility into behavior
✔️ IAM scoped to role + security group hardening
✔️ Zero Trust posture validated pre-deployment
✔️ Continuous monitoring via NDR
✔️ Network traffic monitored by Zeek/Suricata for anomalies
✔️ Secrets managed via AWS Secrets Manager

```

## 🛡️ Summary

ObsidianWall helps teams:

Start with Zero Trust baked into infrastructure

Enforce ZTA in every module

Validate posture both pre-deployment and at runtime

By combining Infrastructure-as-Code with Security-as-Code and optional runtime observability, ObsidianWall serves as a Zero Trust foundation for modern cloud-native systems.

---
_Last updated: 07/05/2025_