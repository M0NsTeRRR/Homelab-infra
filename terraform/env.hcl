locals {
  vsphere_datacenter = "Homelab"
  vsphere_cluster    = "HA"
  dns = {
    server_list = ["192.168.10.21", "192.168.10.22", "2001:bc8:2e64:110::21", "2001:bc8:2e64:110::22"]
    suffix_list = ["unicornafk.fr", "adminafk.fr"]
  }
}