# Ansible Container Orchestrator

This project uses **Ansible** to automate environment preparation for container-based applications. It installs required system tools like `pip` and the `docker` Python module on a group of web servers.

### Hexlet tests and linter status:
[![Actions Status](https://github.com/Zyabridos/devops-for-programmers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Zyabridos/devops-for-programmers-project-76/actions)

## Requirements

- Python 3.x
- Ansible 2.10+
- Two configured servers (DigitalOcean or similar)
- SSH access with root privileges
- Your public SSH key must be added to each server

## Setup Instructions

1. **Install required Ansible roles**:

```bash
ansible-galaxy install -r requirements.yml
```

### To ping webservers group:

Pings all servers in the `webservers` group to verify SSH connectivity and Ansible setup.

```bash
make ping
```

Expected output:

```js
web-1 | SUCCESS => {
  "changed": false,
  "ping": "pong"
}
web-2 | SUCCESS => {
  "changed": false,
  "ping": "pong"
}
```

## Check your inventory file:
Ensure inventory.ini contains your correct server IPs and SSH users.
Example:
```bash
[webservers]
web-1 ansible_host=159.223.13.142 ansible_user=root
web-2 ansible_host=159.223.223.227 ansible_user=root
```

## Run the setup using Makefile:
```bash
make prepare
```

## This will:

-Install pip
-Install the docker Python module
-Prepare the servers for deploying container-based apps

## 📌 Notes
- Main playbook name should be **playbook.yml**
- Inventory file name should be **inventory.yml** (alternatively you can change ansible config file)
- The hosts group must be called webservers (see inventory.ini)
- Ensure your servers allow SSH access from your machine
