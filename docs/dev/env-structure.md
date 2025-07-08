
#### file: `obsidianwall-core/docs/dev/env-structure.md`


# 📦 Environments Structure Guide

This document explains how the `environments/` directory works inside ObsidianWall.

---

## 🧱 Purpose

Environments define how Terraform modules are assembled, configured, and deployed for specific stages such as:

- `dev/`
- `staging/`
- `prod/`

Each environment is treated as a separate state with isolated deployments and configuration.

---

## 📁 Folder Structure

```bash
environments/
├── dev/
│   └── main.tf
├── prod/
│   └── main.tf
├── staging/
│   └── main.tf
```
