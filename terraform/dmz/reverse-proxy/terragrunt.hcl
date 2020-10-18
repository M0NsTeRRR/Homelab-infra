terraform {
  source = "../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server3.unicornafk.fr"
  vm_name      = "reverse-proxy"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 1
    memory   = 1024
  }

  disk = {
    datastore = "SERVER3-RAID1"
    size      = 20
  }

  vm_ip  = "192.168.10.30"
  vm_ip6 = "2a0c:b641:02c0:110::30"

  domain = "unicornafk.fr"
}