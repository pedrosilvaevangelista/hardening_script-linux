# 🛡️ Linux Security Hardening Script

[![Shell Script](https://img.shields.io/badge/Shell-Bash-4EAA25.svg)](https://www.gnu.org/software/bash/)
[![Debian/Ubuntu](https://img.shields.io/badge/Platform-Debian%2FUbuntu-orange.svg)](https://www.debian.org/)

> **Automate essential security hardening practices on Debian-based Linux systems**

This script performs **basic security hardening** on Debian-based Linux systems (such as Ubuntu), automating best-practice configurations to significantly reduce the attack surface of a freshly installed server.

---

## 🎯 **Objective**

Automatically implement essential security configurations that transform a default Linux system into a more attack-resilient environment, following industry security best practices.

---

## 🚀 **Installation and Usage**

### ⚠️ **IMPORTANT: Run as sudo/root**

```bash
# Clone the repository
git clone https://github.com/pedrosilvaevangelista/hardening_script-linux.git
cd hardening_script-linux

# Make the script executable
chmod +x hardening_script-linux.sh

# Run the script
sudo ./hardening_script-linux.sh
```

---

## 🔧 **Features**

### 🔄 **System Update**

* Updates all packages and security fixes
* Ensures the system is fully patched

### 👤 **User Management**

* **Creates an administrative user** (`admin`) with sudo privileges
* **Disables root login via SSH** for increased security
* Sets initial password: `lab123` (⚠️ **change immediately**)

### 🔐 **SSH Hardening**

```bash
✅ Automatic backup of original configuration
✅ Enforces SSHv2 only
✅ Prohibits direct root login
✅ Disables empty passwords
✅ Disables X11 and TCP forwarding
✅ Legal warning banner
```

### 🛡️ **Attack Protection**

* **Fail2Ban**: Automatic protection against brute-force attacks
* **UFW Firewall** (optional): Restrictive default policy
* **Kernel hardening**: Protection against multiple attack vectors

### 🔒 **Strong Password Policy**

Implemented via PAM:

* Minimum **12 characters**
* Requires uppercase, lowercase, numbers, and symbols
* Automatic complexity enforcement

### 🔧 **Kernel Configuration**

```bash
🚫 Disables IP forwarding
🚫 Blocks ICMP redirects
🚫 Prevents source routing
📊 Enables logging of suspicious packets
🛡️ SYN flood protection
🔒 Hides kernel pointers
```

### 📁 **File Permissions**

* Adjusts permissions of critical files (`/etc/passwd`, `/etc/shadow`)
* Restricts access to sensitive system information

### 🔄 **Automatic Updates**

* Configures `unattended-upgrades`
* Automatic application of security patches
* Reduces vulnerability window

---

## 📋 **Post-Execution Checklist**

After running the script, your system will have:

* ✅ Fully updated system
* ✅ Root SSH login disabled
* ✅ Administrative user created
* ✅ SSH configured with secure practices
* ✅ Fail2Ban active against brute force
* ✅ Strong password policy enforced
* ✅ Kernel hardened against attacks
* ✅ Automatic security updates enabled
* ✅ File permissions adjusted
* ✅ Security warning banner configured

---

## ⚠️ **Important Warnings**

### 🔄 **Reboot Recommended**

After execution, **reboot the system** to ensure all configurations are properly applied.

### 🔑 **Change the Default Password**

The `admin` user is created with the password `lab123`. **CHANGE IT IMMEDIATELY**:

```bash
sudo passwd admin
```

### 🧪 **Test in a Controlled Environment**

Always test the script in a development or staging environment before deploying to production.

---

## 🔧 **Optional Configurations**

The script includes commented sections for:

* **UFW Firewall**: Uncomment to enable a restrictive firewall
* **Disable IPv6**: For environments that do not use IPv6

---

## 📞 **Support**

Found an issue or have suggestions? Open an issue in the repository.

<div align="center">

**🛡️ Keep your system secure! 🛡️**

</div>

---
