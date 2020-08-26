terraform {
  source = "../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server3.unicornafk.fr"
  vm_name      = "monitoring"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 2
    memory   = 4096
  }

  disk = {
    datastore = "SERVER3-RAID1"
    size      = 100
  }

  vm_ip  = "192.168.10.101"
  vm_ip6 = "2001:470:cace:110::101"

  domain = "unicornafk.fr"
}