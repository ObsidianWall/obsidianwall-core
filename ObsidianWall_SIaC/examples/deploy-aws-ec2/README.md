

## 📁 `examples/deploy-aws-ec2/README.md`

```markdown
# Example: Deploy Netbird-enabled EC2 Instance

This example provisions an EC2 instance that automatically joins a Netbird VPN mesh overlay network using `cloud-init`.

---
## How to Deploy

```bash
cd ObsidianWall_SIaC/examples/deploy-netbird-ec2
terraform init
terraform apply
```
---

## Requirements
 - A working Netbird account

 - Pre-generated setup key or API token injected via variables

---

## Features
 - EC2 + Netbird mesh bootstrap

 - Secure networking without public IP exposure

 - Suitable for peer-to-peer service communication

---

## Related Modules
 - modules/aws-ec2

 - Netbird VPN integration

---
## Notes
You must bring your own Netbird tenant. This example uses cloud-init/ for first-boot VPN provisioning.

---