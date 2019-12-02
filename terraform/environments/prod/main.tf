module "server1-rancher2" {
  source = "../../modules/rancher2"

  vm          = var.rancher2.vm[0].informations
  target_node = var.rancher2.vm[0].target_node
  hardware    = var.rancher2.hardware
  disk_size   = var.rancher2.disk_size
  network     = var.rancher2.vm[0].network
}

module "server2-rancher2" {
  source = "../../modules/rancher2"

  vm          = var.rancher2.vm[1].informations
  target_node = var.rancher2.vm[1].target_node
  hardware    = var.rancher2.hardware
  disk_size   = var.rancher2.disk_size
  network     = var.rancher2.vm[1].network
}

module "server3-rancher2" {
  source = "../../modules/rancher2"

  vm          = var.rancher2.vm[2].informations
  target_node = var.rancher2.vm[2].target_node
  hardware    = var.rancher2.hardware
  disk_size   = var.rancher2.disk_size
  network     = var.rancher2.vm[2].network
}
