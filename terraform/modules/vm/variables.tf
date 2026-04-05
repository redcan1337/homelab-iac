variable "name" {
  description = "VM name"
  type        = string
}

variable "target_node" {
  description = "Proxmox node to deploy on"
  type        = string
}

variable "template_name" {
  description = "Name of the template to clone"
  type        = string
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "Disk size (e.g., 20G)"
  type        = string
  default     = "20G"
}

variable "storage" {
  description = "Storage pool for disk"
  type        = string
  default     = "local-lvm"
}

variable "bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "ip_address" {
  description = "Static IP address (empty for DHCP)"
  type        = string
  default     = ""
}

variable "ip_netmask" {
  description = "IP netmask (CIDR notation, e.g., 24)"
  type        = string
  default     = "24"
}

variable "gateway" {
  description = "Gateway IP"
  type        = string
  default     = ""
}

variable "ci_user" {
  description = "Cloud-init user"
  type        = string
  default     = "debian"
}

variable "ssh_public_key" {
  description = "SSH public key for cloud-init"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the VM"
  type        = string
  default     = ""
}