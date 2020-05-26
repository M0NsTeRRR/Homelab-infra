locals {
  vsphere_datacenter = "Homelab"
  vsphere_cluster    = "HA"
  dns = {
    server_list = ["192.168.10.21", "192.168.10.22"]
    suffix_list = ["unicornafk.fr", "adminafk.fr"]
  }
}