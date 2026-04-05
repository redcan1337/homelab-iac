# Output for Ansible inventory generation
output "k3s_nodes" {
  description = "K3s node details"
  value = {
    for name, vm in module.k3s_vms : name => {
      ip   = vm.ip_address
      role = var.k3s_nodes[name].role
    }
  }
}

output "k3s_servers" {
  description = "K3s server (control plane) IPs"
  value = [
    for name, vm in module.k3s_vms : vm.ip_address
    if var.k3s_nodes[name].role == "server"
  ]
}

output "k3s_agents" {
  description = "K3s agent (worker) IPs"
  value = [
    for name, vm in module.k3s_vms : vm.ip_address
    if var.k3s_nodes[name].role == "agent"
  ]
}
