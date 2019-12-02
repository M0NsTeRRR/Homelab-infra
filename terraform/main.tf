provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url      = "https://192.168.40.11:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = ""
  pm_otp          = ""
}

module "prod" {
  source = "./environments/prod"
}

module "dev" {
  source = "./environments/dev"
}
