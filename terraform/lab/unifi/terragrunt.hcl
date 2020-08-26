terraform {
  source = "../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server3.unicornafk.fr"
  vm_name      = "unifi"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 1
    memory   = 2048
  }

  disk = {
    datastore = "SERVER3-RAID1"
    size      = 20
  }

  vm_ip  = "192.168.20.50"
  vm_ip6 = "2001:470:cace:120::50"

  domain = "unicornafk.fr"
}