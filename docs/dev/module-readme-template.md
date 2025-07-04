
# files: docs/sec/module-readme-template.md

# <Module Name>

> Short description of what this module does and what it provisions. # check out "naminf-conventions.md" for more details.

---

## 🚀 Usage

```hcl
module "<module-name>" {
  source = "github.com/your-org/ObsidianWall_SIaC//modules/<module-name>"

  # example variables
  name       = "example"
  region     = "us-east-1"
  ...
}

---

## 📥 Input Variables

| Name     | Type   | Default       | Description                     |
| -------- | ------ | ------------- | ------------------------------- |
| `name`   | string | n/a           | (Required) Name of the resource |
| `region` | string | `"us-east-1"` | AWS region to deploy into       |
| ...      | ...    | ...           | ...                             |


## 📤 Output Variables

| Name          | Description                        |
| ------------- | ---------------------------------- |
| `instance_id` | The ID of the created EC2 instance |
| `public_ip`   | The public IP address of the VM    |
| ...           | ...                                |
---

## 🔐 Security Notes
This module enforces encryption at rest (e.g., kms_key_id support).

Network access is restricted using Security Groups / NSGs.

Default configurations are secure, but be sure to:

  Review IAM permissions (if applicable).

  Use external secrets managers (e.g., AWS Secrets Manager, Azure Key Vault).

  Avoid hardcoding sensitive data.

---
☁️ Cloud-Specific Behavior
(Optional: Describe if the module behaves differently in AWS, Azure, etc.)