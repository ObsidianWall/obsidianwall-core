
# files: docs/user/deploying-modules.md

# 📦 Deploying Modules

Welcome to ObsidianWall!

This guide walks you through deploying any module from the platform securely using Terraform — whether you're provisioning an EC2 instance, setting up a secure VM, or deploying the NDR runtime observability module.

---

## ⚙️ Prerequisites

Before deploying any module, ensure you have the following:

- [Terraform CLI](https://www.terraform.io/downloads.html) (v1.6.6 or later)
- Git
- Access credentials for your cloud provider (e.g., AWS or Azure CLI authenticated)
- Optional: [Pre-commit](https://pre-commit.com/) for local code checks

---

## 📁 Folder Structure

Modules are located under:
```
ObsidianWall-Core/
└── ObsidianWall_SIaC/
└── modules/
├── aws-ec2/
├── azure-vm/
├── ndr-aws-ec2/
├── ndr-azure-vm/
```


---

## 🚀 Quick Deployment

Each module is self-contained. Navigate into the module folder and run the following:

```bash
cd ObsidianWall_SIaC/modules/aws-ec2
terraform init
terraform plan
terraform apply
```
**🛡️ All modules are designed with secure defaults (e.g., encryption, IAM hardening, logging).**

----

## 🔑 Secure Variables

You must provide input variables required by each module. You can do this by:

Creating a terraform.tfvars file, or

Passing via -var flag, or

Using environment variables

**Example:**
```hcl
# terraform.tfvars
region = "us-east-1"
instance_type = "t3.micro"
key_name = "my-ec2-key"
ami = "ami-0c55b159cbfafe1f0" # Example AMI ID for us-east-1
```

