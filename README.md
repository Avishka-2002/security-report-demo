# 🛡️ Security Report Demo (CI/CD Pipeline)

A lightweight demo repository showcasing automated security reports using **Trivy** (vulnerabilities & secrets scan) and **tfsec** (Infrastructure-as-Code scan) in **GitHub Actions**, exporting integrated SARIF/JSON artifacts.

---

## 🎯 Project Overview (The 6-Step Blueprint)

### 01. Create a New Repo
Fresh repository (`security-report-demo`) containing a sample application (`app.py`), container configuration (`Dockerfile`), and sample Terraform IaC (`main.tf`).

### 02. Add Workflow File
Defined at `.github/workflows/security.yml` with `on: [push]` trigger.

### 03. Setup Security Scan Jobs
- **`trivy-scan`**: Uses `aquasecurity/trivy-action` to scan filesystem & container configuration, writing JSON/SARIF output to `reports/trivy-report.json` and `reports/trivy-report.sarif`.
- **`tfsec-scan`**: Uses `aquasecurity/tfsec-action` to scan `main.tf` (Terraform IaC configuration), writing JSON/SARIF output to `reports/tfsec-report.json` and `reports/tfsec-report.sarif`.

### 04. Upload Artifact (Key Step)
Collects all generated files in the `reports/` directory and uploads them as a single downloadable workflow artifact named **`security-report`** using `actions/upload-artifact`.

### 05. Test the Pipeline
Push to your `main` branch, go to the **Actions** tab on GitHub, select the run, and download `security-report.zip`.

### 06. Review & Extend
Open the downloaded JSON/SARIF reports to review findings, integrate with GitHub Advanced Security (Code Scanning tab), or extend with OPA/Gatekeeper for policy checks.

---

## 🚀 Quick Setup Instructions

1. **Create GitHub Repo:** Create a new repository named `security-report-demo` on GitHub.
2. **Push Code:**
   ```powershell
   cd "C:\Users\EXT\OneDrive\Desktop\Week 12\security-report-demo"
   git init
   git add .
   git commit -m "feat: initial setup of Trivy and tfsec security pipeline"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/security-report-demo.git
   git push -u origin main
   ```
3. **Download Reports:**
   - Go to your repo -> **Actions** -> click on the workflow run.
   - Scroll down to **Artifacts** -> click **`security-report`** to download the ZIP file.
