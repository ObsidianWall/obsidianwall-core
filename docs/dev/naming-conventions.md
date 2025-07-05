
# file: developer-docs/naming-conventions.md
# Naming Conventions

# ObsidianWall Module Naming Conventions

This guide outlines the naming rules and standards for ObsidianWall modules and files to maintain consistency, discoverability, and clarity across the platform.

---

## 📦 Module Folder Naming

- Use lowercase with hyphens to separate words
- Format: `<cloud-provider>-<resource-type>`
- Examples:
  - `aws-ec2`
  - `azure-vm`
  - `aws-s3`
  - `azure-blob-storage`
  - `aws-kubernetes`
  - `azure-kubernetes`
  - `ndr-azure-vm`
  - `netbird-vpn-server`

If the module is cloud-agnostic, use a general name with no provider prefix:
- Example: `vpn-cloud-init`

---

## 📁 File Naming (Inside Module)

| File               | Purpose                                             |
|--------------------|-----------------------------------------------------|
| `main.tf`          | Core infrastructure logic (entry point)            |
| `variables.tf`     | Input variables and defaults                        |
| `outputs.tf`       | Outputs used by other modules                       |
| `versions.tf`      | Required Terraform and provider versions           |
| `network.tf`       | Optional: network setup (VPC, NSG, subnets, etc.)  |
| `security.tf`      | Optional: IAM, firewall, access policies            |
| `cloud-init/`      | Optional folder for provisioning scripts            |
| `.gitignore`       | Local exclusions for Terraform state/log files     |
| `README.md`        | Module documentation (based on template)           |

---

## 🌐 Resource Naming in Terraform

To promote consistency and traceability in the cloud provider consoles:

- Use this pattern:  
  `obsidianwall-<module-name>-<environment>-<resource-type>`

- Examples:
  - `obsidianwall-aws-ec2-dev-instance`
  - `obsidianwall-ndr-azure-vm-prod-nic`
  - `obsidianwall-netbird-vpn-server-stage-vm`

> ✏️ Environment suffixes: `dev`, `test`, `stage`, `prod`

---

## 🤖 Tags & Labels

Every cloud resource should include a base set of tags:

```hcl
tags = {
  "project"     = "obsidianwall"
  "module"      = "aws-ec2"
  "owner"       = "your-github-handle"
  "environment" = var.environment
}
    "created_by"  = "obsidianwall"
    }
    ```
-Add any additional tags relevant to the organization or project.   
- Use consistent tag keys across all resources 

```


## 💡 Naming Do's and Don'ts

**✅ Do:**

  Use lowercase and hyphens

  Follow provider prefix standards

  Be descriptive but concise

**❌ Don’t:**

  Use underscores or camelCase in module or folder names

  Hardcode environment or region into module names

  Use generic names like server.tf or setup.tf
  ----

**Maintaining these conventions ensures your modules are:**

  Predictable

  Reusable

  Discoverable via search and automation

Thanks for following the standard. 🛡️

---

_Last updated: 07/04/2025_