locals {
  vsphere_datacenter = "Homelab"
  vsphere_cluster    = "HA"
  dns = {
    server_list = ["192.168.10.51", "1.1.1.1"]
    suffix_list = ["unicornafk.fr", "adminafk.fr"]
  }
}