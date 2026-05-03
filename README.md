# Windows Development Environment Setup

This repository provides PowerShell scripts to install and remove essential development tools:
- Git (latest stable version)
- Python 3.12
- Miniconda (with Jupyter Notebook)

## ⚠️ Important
- **Run Visual Studio Code or PowerShell in Administrator mode** before executing scripts.
- Without administrator rights, system-wide (Machine scope) PATH updates will fail.
- Miniconda must be installed in an ASCII-only path (`C:\Miniconda3`) to avoid issues with non-English usernames.

## 🚀 Installation
Open an **Administrator PowerShell** and run:

```powershell
.\git_install.ps1
.\python3.12_install.ps1