terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  name        = var.name
  target_node = var.target_node
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  tags        = var.tags
  memory      = var.memory
  
  scsihw = "virtio-scsi-single"
  
  cpu {
    cores = var.cores
    sockets = 1
    type = "host"
  }

  disks {
    ide {
      ide0 {
        cloudinit {
          storage = var.storage
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = "1G"
          storage = var.storage
        }
      }
      scsi1 {
        disk {
          size    = var.disk_size
          storage = var.storage
        }
      }
    }
  }
  
  network {
    id = 0
    model  = "virtio"
    bridge = var.bridge
  }
  
  ipconfig0 = var.ip_address != "" ? "ip=${var.ip_address}/${var.ip_netmask},gw=${var.gateway}" : "ip=dhcp"
  
  ciuser  = var.ci_user
  sshkeys = var.ssh_public_key
  
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
