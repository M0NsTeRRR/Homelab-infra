terraform {
  source = "../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server3.unicornafk.fr"
  vm_name      = "rpki"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 1
    memory   = 3072
  }

  disk = {
    datastore = "SERVER3-RAID1"
    size      = 50
  }

  vm_ip  = "192.168.10.31"
  vm_ip6 = "2a0c:b641:02c0:110::31"

  domain = "unicornafk.fr"
}