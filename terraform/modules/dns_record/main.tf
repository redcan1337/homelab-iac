terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
    }
  }
}

resource "fortios_system_dnsdatabase" "trname" {
    name = var.zone_name
    domain = var.domain
    type = var.type
    view = var.view
    ttl = var.ttl
    authoritative = var.authoritative

    dynamic "dns_entry" {
        for_each = var.dns_entries
        iterator = dns_entry
        content {
            hostname = dns_entry.value.hostname
            type = dns_entry.value.type
            ttl = dns_entry.value.ttl
            ip = dns_entry.value.ip
        }
    }
}

