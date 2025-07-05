


# ❓ Frequently Asked Questions (FAQ)

Welcome to the ObsidianWall FAQ. Here you’ll find answers to the most common questions around using, deploying, and extending the ObsidianWall platform.

---

## 🧱 General

### What is ObsidianWall?
ObsidianWall is a **Security Infrastructure-as-Code (SIaC)** platform. It provides secure-by-default Terraform modules for multi-cloud deployments, backed by build-time and optional runtime security analysis.

### Who is ObsidianWall for?
It’s built for DevOps, SecOps, and Cloud Engineers who want composable, production-ready modules without needing to build everything from scratch — especially with security and compliance top-of-mind.

---

## 🛠️ Using ObsidianWall

### How do I deploy a module?
Navigate into a module folder and run:

```bash
terraform init
terraform apply
```
**See deploying-modules.md for full guidance.**

### Where can I find module examples?

Inside:
````
ObsidianWall_SIaC/environments/examples/

````
These provide sample configurations that use one or more ObsidianWall modules.


### Do I need to modify modules?
No. Modules are preconfigured with secure defaults. You can override variables to customize deployments as needed.

---

## 🔐 Security & Compliance

### Are the modules secure?
Yes. Every module is scanned with:

  tfsec (Terraform vulnerability detection)

  checkov (IaC misconfiguration analysis)

  tflint (linting and best practices)

We also validate modules with GitHub Actions CI workflows.

### What is “Security-as-Code” in ObsidianWall?
Security-as-Code means we encode IAM, encryption, network access, logging, and compliance controls directly into our Terraform modules and policies — not as afterthoughts.

### Do I need to deploy the NDR modules?
Not required, but recommended. The NDR modules (e.g. ndr-aws-ec2) provide runtime observability and allow advanced threat detection and behavior monitoring. Great for Zero Trust and post-deployment auditing.

---

## 🤝 Contributing

### Can I contribute my own modules?
Absolutely! Start by reading CONTRIBUTING.md in the root repo.

### Are there naming conventions I should follow?
Yes — see docs/dev/naming-conventions.md.

### What tools should I install to contribute?
  Terraform CLI

  Pre-commit

  Python (for some scanning tools)

  Git
Run pre-commit install after cloning to ensure local checks match CI.  

----

## 🚨 Troubleshooting

### My deployment fails at terraform plan. What now?
Check:

  Input variables — are required values provided?

  Terraform version — ObsidianWall supports 1.6.6+

  Cloud credentials — authenticated to AWS/Azure?

  Use terraform validate and terraform fmt to check formatting and syntax.

### My module fails CI checks — how do I fix it?
Run the same checks locally with pre-commit:
```bash
pre-commit run --all-files
```
---
**Still have questions?**
👉 Open an issue, discussion, or reach us at support@obsidianwall.dev (placeholder).

---

