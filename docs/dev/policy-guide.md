
#### ✅ File 3: `obsidianwall-core/docs/dev/policy-guide.md`



# ObsidianWall Policy Validation Guide

---
# 🔐 Policy Validation Strategy

This guide explains how ObsidianWall validates security policies across AWS, Azure, and open-source policy engines.

---

## ✅ 1. AWS Policy Validation

**Workflow:** `.github/workflows/validate-policy-aws.yml`

Uses AWS IAM Access Analyzer with multiple check types:
- `VALIDATE_POLICY`
- `CHECK_ACCESS_NOT_GRANTED`
- `CHECK_NO_NEW_ACCESS`
- `CHECK_NO_PUBLIC_ACCESS`

### 🔐 Requirements:
- GitHub OIDC → AWS IAM Role
- Secrets for:
  - `AWS_ROLE`
  - `TEMPLATE_PATH`
  - `REFERENCE_POLICY`, `REFERENCE_POLICY_TYPE`
  - `ACTIONS`, `RESOURCES`

---

## ✅ 2. Azure Policy Validation

**Workflow:** `.github/workflows/validate-policy-azure.yml`

Uses `az` CLI to fetch policy compliance results for deployed resources.

### 🔍 Optional:
Also runs `terrascan` for IaC policy scanning at the code level.

### 🔐 Requirements:
- GitHub OIDC → Azure App Registration
- Secrets for:
  - `AZURE_SUBSCRIPTION_ID`
  - `AZURE_CREDENTIALS`

---

## ✅ 3. Open Source (OPA) Policy Validation

**Workflow:** `.github/workflows/validate-policy-open.yml`

Uses [OPA](https://www.openpolicyagent.org/) via `conftest` to enforce policies written in Rego.

Scans `.tf` files against `.rego` rules under `policies/open-source/`.

### Example:
```bash
conftest test ObsidianWall_SIaC/modules/aws-ec2/main.tf
```