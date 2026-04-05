output "vm_id" {
  description = "VM ID"
  value       = proxmox_vm_qemu.vm.id
}

output "name" {
  description = "VM name"
  value       = proxmox_vm_qemu.vm.name
}

output "ip_address" {
  description = "VM IP address"
  value       = proxmox_vm_qemu.vm.default_ipv4_address
}
