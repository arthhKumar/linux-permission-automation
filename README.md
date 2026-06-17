# Linux System Hardening & Automated Permission Audit Utility

## 📌 Project Overview
This project is a lightweight, high-performance POSIX-compliant shell script designed to automate security compliance on multi-tenant servers. The utility recursively scans a target directory infrastructure, evaluates the existing asset layout, and strips away unauthorized read, write, or execute vectors. This minimizes the risk of local data leakage and privilege escalation vulnerabilities.

## ⚙️ Technical Architecture & Core Logic
In modern server environments, loosely configured file permissions represent a severe attack vector. If a bad actor or a compromised application profile gains low-level access to a system, they immediately scan local directories to steal sensitive configuration tokens, database credentials, or administrative keys.

### Discretionary Access Control (DAC) Mechanism
The tool isolates target assets and applies a strict `600` octal bitmask configuration via standard Linux core binaries:
* **Owner (6):** Evaluated as 4 (Read) + 2 (Write) = 6. The valid system administrator maintains full privileges to read and modify the payload.
* **Group (0):** Absolute zero access allocations.
* **Others / World (0):** Absolute zero access allocations.

By locking files down to `chmod 600`, anyone else on the machine is completely barred from inspecting or executing local data.

## 🚀 Deployment & Usage

### Prerequisites
* A Linux, macOS, or Windows environment running a Bash interpreter (e.g., Git Bash).

### Execution Workflow
1. Clone the repository and navigate to the project directory:
   ```bash
   git clone [https://github.com/yourusername/linux-permission-automation.git](https://github.com/yourusername/linux-permission-automation.git)
   cd linux-permission-automation
