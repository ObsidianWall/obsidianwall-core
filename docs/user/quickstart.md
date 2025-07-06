
# file: 📁 `docs/user/quickstart.md`


---

**title:** Quickstart Guide

**description:** A step-by-step guide to get started with ObsidianWall.

# 🚀 Quickstart Guide

Welcome to ObsidianWall — a modular, secure-by-default Infrastructure-as-Code platform. Follow these steps to get up and running in minutes.

---

## 🧱 Step 1: Install Prerequisites

You'll need:

- [Terraform CLI](https://www.terraform.io/downloads.html) v1.6.6+
- Git
- Optional (recommended):
  - [Pre-commit](https://pre-commit.com/)  
  - Python (for static analysis tools)

---

## 🗂 Step 2: Clone the Repo


git clone https://github.com/your-org/ObsidianWall-Core.git
cd ObsidianWall-Core

---

## 🔍 Step 3: Explore the Modules
Modules live under:
```
ObsidianWall_SIaC/modules/
├── aws-ec2/
├── azure-vm/
├── ndr-aws-ec2/
├── ndr-azure-vm/
```
Each module contains:

 - Secure Terraform code (main.tf, etc.)

 - Local CI workflows

 - Usage documentation
---

## ⚙️ Step 4: Deploy a Module
Example: Deploy AWS EC2
```
cd ObsidianWall_SIaC/modules/aws-ec2
terraform init
terraform plan
terraform apply
```
_💡 Tip: Use terraform.tfvars or environment variables to pass required values._

---
## 🛡 Step 5: Run Security Checks (Optional but Recommended)
Install and run pre-commit hooks:
```
pip install pre-commit
pre-commit install
pre-commit run --all-files
```
This will run:

 - terraform fmt, validate

 - tflint

 - tfsec

 - checkov
---

## 🧪 Step 6: Try an Example Stack
```
cd ObsidianWall_SIaC/environments/examples/aws-ec2-minimal/
terraform init
terraform apply
```
---

## 🔄 Step 7: Customize or Contribute
Want to customize modules or contribute your own?

See CONTRIBUTING.md
Refer to docs/dev/naming-conventions.md for module naming and structure.

---
