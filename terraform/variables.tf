# K3s node definitions
variable "k3s_nodes" {
  description = "Map of k3s nodes to create"
  type = map(object({
    target_node = string
    cores       = number
    memory      = number
    disk_size   = string
    ip          = string
    role        = string  # "server" or "agent"
    tags        = string  # Comma-separated tags
  }))
}

# Template settings
variable "template_name" {
  description = "Name of the VM template to clone"
  type        = string
}

# Network settings
variable "bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "gateway" {
  description = "Network gateway"
  type        = string
}

variable "ip_netmask" {
  description = "IP netmask (CIDR)"
  type        = string
  default     = "24"
}

# Storage
variable "storage" {
  description = "Storage pool for VM disks"
  type        = string
  default     = "local-lvm"
}

# Cloud-init
variable "ci_user" {
  description = "Default user for cloud-init"
  type        = string
  default     = "debian"
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
}
