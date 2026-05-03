# Windows Development Environment Setup  
윈도우 개발 환경 자동화 스크립트

이 저장소는 Windows 개발 환경을 빠르게 세팅하기 위한 PowerShell 자동화 스크립트 모음입니다.  
Git, Python 3.12, Miniconda, Jupyter Notebook을 설치/삭제할 수 있습니다.

---

## 📌 Project Purpose / 프로젝트 목적
- Automate Windows development environment setup for consistent team usage.  
- Git, Python, Miniconda, Jupyter Notebook installation/removal in one step.  
- 관리자 권한 실행 및 필수 설정을 안내하여 혼동을 줄입니다.

---

## ⚠️ Requirements / 필수 요구사항
- Windows OS  
- PowerShell 5 or higher  
- Internet connection  
- **Run VS Code or PowerShell in Administrator mode**  
- **관리자 권한으로 실행 필수** (VS Code 또는 PowerShell을 관리자 모드로 실행)

---

## 🚀 Installation / 설치 방법
Run in Administrator PowerShell:  
관리자 권한 PowerShell에서 실행:

```powershell
.\git_set\git_install.ps1
.\python3.12_set\python3.12_install.ps1

Verify Installation:
설치 후 확인:
git --version
python --version
conda --version
jupyter --version
```

---

## ❌ Removal / 삭제 방법
Run in Administrator PowerShell:
관리자 권한 PowerShell에서 실행:

```powershell
.\git_set\git_remove.ps1
.\python3.12_set\python3.12_remove.ps1

Verify removal:
삭제 후 확인:
git --version
python --version
conda --version
jupyter --version
```