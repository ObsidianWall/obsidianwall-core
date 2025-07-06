
## file: 📁`obsidianwall-core/ObsidianWall_SIaC/modules/ndr-aws-ec2/README.md`


---


# NDR (AWS) Module – Zeek + Suricata + Netbird

Deploys an NDR sensor EC2 instance on AWS with Zeek, Suricata, and optional Netbird agent.

### 🚀 Features

- Hardened Amazon Linux 2 or Ubuntu
- Cloud-init bootstrap for Zeek, Suricata, and Netbird
- Logs optionally forwarded to CloudWatch or SIEM

## 🧩 Usage

```hcl
module "ndr_aws" {
  source            = "../../modules/ndr-aws-ec2"
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  instance_type     = var.instance_type
  netbird_join_key? = var.netbird_join_key
}
```
---

## ✅ Inputs / Outputs
See variables.tf / outputs.tf.

### 🔐 Security Notes
 - Secured Security Group

 - Cloud-init updates and logs

 - Monitoring agent integration optional

--- 
