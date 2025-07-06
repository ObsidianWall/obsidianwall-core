
# file: 📁 `developer-docs/README-devcontainer.md`

# Dev Container Setup for ObsidianWall

This project includes a pre-configured **Dev Container** to streamline development in Visual Studio Code or GitHub Codespaces.

## 🔧 What's Inside

The `.devcontainer/devcontainer.json` includes:
- **Universal Base Image** from Microsoft
- **Terraform CLI** pre-installed via official Dev Container feature
- **GitHub CLI** for interacting with GitHub repos and workflows
- **VS Code Extension** for Terraform
- **Post-Creation Check** to verify tool installation

## 🚀 Getting Started (Locally)

1. **Install Requirements**:
   - [Docker](https://www.docker.com/products/docker-desktop/)
   - [Visual Studio Code](https://code.visualstudio.com/)
   - VS Code Extensions:
     - *Remote - Containers* or *Dev Containers*

2. **Open the Project in a Container**:
   - Open the Command Palette (⇧⌘P or Ctrl+Shift+P)
   - Run: `Dev Containers: Open Folder in Container`

> You’ll now be in a secure, isolated environment with everything preinstalled!

---

## ☁️ GitHub Codespaces (Optional)

If using [GitHub Codespaces](https://github.com/features/codespaces):
- Click the green `Code` button on your repo
- Choose **"Open in Codespaces"**

You’ll get the same environment, ready-to-code in your browser.

---

## 📂 File Reference

```bash
.devcontainer/
├── devcontainer.json        # Main configuration file
