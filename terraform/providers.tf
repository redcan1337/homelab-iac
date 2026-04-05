variable "PM_API_TOKEN_ID" {
  description = "Proxmox API Token ID"
  type        = string
}

variable "PM_API_TOKEN_SECRET" {
  description = "Proxmox API Token Secret"
  type        = string
}

variable "PM_API_URL" {
  description = "Proxmox API URL"
  type        = string
}

provider "proxmox" {
  pm_api_url = var.PM_API_URL
  pm_api_token_id = var.PM_API_TOKEN_ID
  pm_api_token_secret = var.PM_API_TOKEN_SECRET
  pm_tls_insecure = true
}