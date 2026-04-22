terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
    fortios = {
      source  = "fortinetdev/fortios"
    }
    local = {
      source  = "hashicorp/local"
    }
  }
}

# K3s Cluster VMs
module "k3s_vms" {
  source   = "./modules/vm"
  for_each = var.k3s_nodes

  name           = each.key
  target_node    = each.value.target_node
  template_name  = var.template_name
  cores          = each.value.cores
  memory         = each.value.memory
  disk_size      = each.value.disk_size
  storage        = var.storage
  bridge         = var.bridge
  ip_address     = each.value.ip
  ip_netmask     = var.ip_netmask
  gateway        = var.gateway
  ci_user        = var.ci_user
  ssh_public_key = var.ssh_public_key
  tags           = each.value.tags
}

# FortiGate DNS Records
module "dns_records" {
  source = "./modules/dns_record"

  zone_name     = "k3s.home"
  domain        = "k3s.home"
  type          = "A"
  view          = "default"
  ttl           = 3600
  authoritative = true
  dns_entries   = var.dns_static_entries
}

# Ansible inventory
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.yml"

  content = yamlencode({
    all = {
      hosts = {
        for name, vm in module.k3s_vms :
        name => {
          ansible_host = vm.ip_address
        }
      }

      children = {
        server = {
          hosts = {
            for name, vm in module.k3s_vms :
            name => {}
            if var.k3s_nodes[name].role == "server"
          }
        }

        agent = {
          hosts = {
            for name, vm in module.k3s_vms :
            name => {}
            if var.k3s_nodes[name].role == "agent"
          }
        }
      }
    }
  })
}