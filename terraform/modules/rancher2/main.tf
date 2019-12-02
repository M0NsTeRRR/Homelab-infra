module "servers" {
  source = "../proxmox_VM"

  vm           = var.vm
  target_node  = var.target_node
  distribution = var.distribution
  hardware     = var.hardware
  disk_size    = var.disk_size
  network      = var.network
}
