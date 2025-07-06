
#### file: 📁`obsidianwall-core/ObsidianWall_SIaC/modules/ndr-azure-vm/README.md`



---

# NDR (Azure) Module – Zeek + Suricata + Netbird

Deploys an NDR sensor VM on Azure with Zeek, Suricata, and optional Netbird agent.


## 🚀 Features

- Ubuntu LTS VM with hardened security
- Zeek + Suricata via cloud-init
- Azure Monitor Agent to forward logs to Sentinel
- Optional Netbird VPN join


## 🧩 Usage

```hcl
module "ndr_azure" {
  source            = "../../modules/ndr-azure-vm"
  resource_group    = var.resource_group
  vm_size           = var.vm_size
  log_analytics_workspace_id = var.workspace_id
  netbird_join_key? = var.netbird_join_key
}
```
---

## ✅ Inputs / Outputs
See variables.tf / outputs.tf.

### 🔐 Security Notes
 - Uses NSG locks limiting inbound/outbound

 - Logs forwarded securely to Sentinel

 - Updates via cloud-init on VM start

----
## 🛠️ Example
See environments/prod or examples/full-stack-combo.

----