
## file: 📁`obsidianwall-core/ObsidianWall_SIaC/modules/aws-ec2/README.md`


---

## 📁 `obsidianwall-core/ObsidianWall_SIaC/modules/aws-ec2/README.md`


# `aws-ec2` Module for AWS EC2 Instances

Securely deploys an EC2 instance on AWS using industry best practices.

## 🚀 Features

- Hardened Amazon Linux / Ubuntu
- Key rotation via AWS Secrets Manager (optional)
- Security groups with least-privileged access
- Optional Netbird VPN integration

## 🧩 Usage

```hcl
module "aws_ec2" {
  source        = "../../modules/aws-ec2"
  vpc_id        = var.vpc_id
  subnet_id     = var.subnet_id
  instance_type = var.instance_type
}
```
---
## ✅ Inputs / Outputs
Refer to variables.tf / outputs.tf.


### 🔐 Security Notes
 - Enforces encryption at rest

 - Hardened OS config via cloud-init
---

