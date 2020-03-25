locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  network_vars = read_terragrunt_config(find_in_parent_folders("network.hcl"))

  vsphere_server = local.account_vars.locals.vsphere_server
  user           = local.account_vars.locals.user
  password       = local.account_vars.locals.password

  vsphere_datacenter = local.env_vars.locals.vsphere_datacenter
  vsphere_cluster    = local.env_vars.locals.vsphere_cluster
  dns                = local.env_vars.locals.dns

  network = local.network_vars.locals.network
  domain  = local.network_vars.locals.domain
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "vsphere" {
  vsphere_server = "${local.vsphere_server}"
  user           = "${local.user}"
  password       = "${local.password}"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
EOF
}

inputs = merge(
  local.account_vars.locals,
  local.env_vars.locals,
  local.network_vars.locals
)