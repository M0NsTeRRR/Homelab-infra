terraform {
  source = "../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server3.unicornafk.fr"
  vm_name      = "git"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 2
    memory   = 2048
  }

  disk = {
    datastore = "SERVER3-RAID1"
    size      = 50
  }

  vm_ip  = "192.168.10.27"
  vm_ip6 = "2001:470:cace:110::27"

  domain = "unicornafk.fr"
}