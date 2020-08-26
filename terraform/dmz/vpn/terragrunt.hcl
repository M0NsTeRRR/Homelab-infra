terraform {
  source = "../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server3.unicornafk.fr"
  vm_name      = "vpn"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 1
    memory   = 1024
  }

  disk = {
    datastore = "SERVER3-RAID1"
    size      = 20
  }

  vm_ip  = "192.168.10.29"
  vm_ip6 = "2001:470:cace:110::29"

  domain = "unicornafk.fr"
}