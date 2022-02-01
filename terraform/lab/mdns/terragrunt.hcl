terraform {
  source = "../..//modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server3.unicornafk.fr"
  vm_name      = "mdns"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 1
    memory   = 2048
  }

  disk = {
    datastore = "SERVER3-RAID1"
    size      = 20
  }

  networks = [
    {
      name     = "HOME"
      ip       = "192.168.50.51"
      netmask  = "24"
      ipv6     = "2a0c:b641:2c0:150::51"
      netmask6 = "64"
    },
    {
      name     = "GUEST"
      ip       = "192.168.60.51"
      netmask  = "24"
      ipv6     = "2a0c:b641:2c0:160::51"
      netmask6 = "64"
    }
  ]

  vm_ip  = "192.168.20.51"
  vm_ip6 = "2a0c:b641:2c0:120::51"

  domain = "unicornafk.fr"
}