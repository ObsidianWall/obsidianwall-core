#### file: 📁 `obsidianwall-core/docs/user/faq.md`



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
_These provide sample configurations that use one or more ObsidianWall modules._


### Do I need to modify modules?
No. Modules are preconfigured with secure defaults. You can override variables to customize deployments as needed.


### How do I customize a module?

You can customize modules by modifying the `variables.tf` file in the module directory. You can also pass variables directly when running `terraform apply`:

```bash
terraform apply -var="region=us-west-2" -var="instance_type=t3.micro"
```
_You can also create a terraform.tfvars file with your preferred values for reuse._


### Can I use ObsidianWall with other IaC tools?
Yes — but with some caveats.

ObsidianWall modules are written in Terraform HCL, so they are natively supported in Terraform workflows.

However, ObsidianWall can be used alongside other IaC tools like:

  - Pulumi (by calling Terraform modules)

  - CloudFormation (in separate stacks)

  - Crossplane (via Composition/ProviderConfig patterns)

_ObsidianWall’s vision includes future adapter modules and templates to help bridge Terraform and other tools._

### Can I use ObsidianWall with existing Terraform code?
Yes.

ObsidianWall modules are designed to be composable, meaning you can integrate them into your existing Terraform projects seamlessly.

You can:

  - Import ObsidianWall modules into your existing main.tf or stack structure

  - Use terraform_remote_state to link outputs between your current code and ObsidianWall modules

  - Gradually migrate or replace existing modules with more secure ObsidianWall counterparts

_🔐 Bonus: By integrating even a single ObsidianWall module, your infrastructure benefits from built-in security validation and Zero Trust defaults._


### Can I use ObsidianWall to deploy non-ObsidianWall IaC infrastructure?
Yes.

You can integrate ObsidianWall modules into broader Terraform stacks alongside community or internal modules. For example:

  - Use ObsidianWall for secure networking or compute

  - Use custom/internal modules for business-specific services

_Just ensure compatibility with Terraform versioning and variable interfaces._

_In the future, obsi-cli and obsidianwall-core may support mixed pipelines, policy validation, and security guardrails across third-party IaC modules as well._

---

## 🔐 Security & Compliance

### Are the modules secure?
Yes. Every module is scanned with:

  - tfsec (Terraform vulnerability detection)

  - checkov (IaC misconfiguration analysis)

  - tflint (linting and best practices)

_We also validate modules with GitHub Actions CI workflows._

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
  - Terraform CLI

  - Pre-commit

  - Python (for some scanning tools)

  - Git
_Run pre-commit install after cloning to ensure local checks match CI._  


### Can I use obsi-cli to deploy modules?
_(🧪 Experimental Feature)_

Yes. If you’re using the obsi-cli tool (ObsidianWall’s future CLI), you can deploy and manage modules with simplified commands.

Example:
```bash
obsi deploy aws-ec2 --env dev
```
_⚠️ Note: obsi-cli is a planned part of the ObsidianWall ecosystem but may not be available in all releases._


----

## 🚨 Troubleshooting

### My deployment fails at terraform plan. What now?
Check:

  - Input variables — are required values provided?

  - Terraform version — ObsidianWall supports 1.6.6+

  - Cloud credentials — authenticated to AWS/Azure?

  - Use terraform validate and terraform fmt to check formatting and syntax.

### My module fails CI checks — how do I fix it?
Run the same checks locally with pre-commit:
```bash
pre-commit run --all-files
```
---
**Still have questions?**
👉 Open an issue, discussion, or reach us at support@obsidianwall.dev (placeholder).

---

