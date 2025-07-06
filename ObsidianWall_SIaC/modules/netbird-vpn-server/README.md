
#### file: 📁`obsidianwall-core/ObsidianWall_SIaC/modules/netbird-vpn-server/README.md`


---

# ObsidianNetbird VPN Server Module

Provides a self-hosted Netbird VPN server for peer-to-peer encrypted networking.

## 🚀 Features

- TLS‑secured control plane
- Auto‑provisioned VM (Linux)
- IAM, firewall, and tag security by default

## 🧩 Usage

```hcl
module "netbird_vpn" {
  source      = "../../modules/netbird-vpn-server"
  region      = var.region
  instance_type = "t3.micro"
  # Provide credentials or secrets through variables or secret store
}
```
---

## ✅ Inputs / Outputs
Refer to variables.tf and outputs.tf.

## 🔐 Security Notes
  - TLS certificates are auto-generated.

  - Secure firewall rules lock down control plane.

  - Auto-join script can be used by other modules.

---

## 🧪 Example
See examples/full-stack-combo for usage alongside compute, storage, and NDR modules.

----