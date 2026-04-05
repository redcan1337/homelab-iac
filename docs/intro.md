# HomeLab
## Idea
The idea behind this repo is to migrate current homelab infrastructure to k3s. Currently it consists of:
1. Single Proxmox node that runs:
    - Single-node Zabbix instance
    - Website for my girlfriend's business
    - VM packed with scripts

The changes I want to make:
1. Introduce another Proxmox node (hardware is already here, need to solve some logistics issue in my room)
2. Implement k3s cluster, in IaC style, managed by Terraform and Ansible playbooks
3. Migrate current Zabbix monitoring to Prometheus + Grafana run on k3s
4. Migrate gf's website to k3s, create pipeline that would allow me to deploy changes to it via git

## Motivation
- Learn Kubernetes and modern DevOps tooling hands-on
- Move from Zabbix to Prometheus/Grafana ecosystem
- Practice Infrastructure as Code with Terraform and Ansible
- Build a realistic homelab that mirror production environments

## Hardware
1. HP EliteDesk 705 G4 Ryzen 5 32GB DDR4 1TB SSD (current Proxmox node)
2. HP EliteDesk 705 G4 Ryzen 5 32GB DDR4 512GB SSD (node to be)
3. Fortinet FortiWifi 60D (network/firewall)