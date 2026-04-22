variable "zone_name" {
  description = "DNS Zone name"
  type        = string
}

variable "domain" {
  description = "Domain name for the DNS record"
  type        = string
}

variable "type" {
  description = "Type of DNS zone"
  type        = string
  default = "master"
}

variable "view" {
  description = "Zone view"
  type        = string
  default     = "shadow"
}

variable "ttl" {
  description = "Time to live for DNS records"
  type        = number
  default     = 300
}

variable "authoritative" {
  description = "Whether the zone is authoritative"
  type        = string
  default     = "enable"
}

variable "dns_entries" {
  description = "List of DNS entries to create"
  type = list(object({
    hostname   = string
    type   = string
    ttl    = number
    ip     = string
  }))
  default = []
}
