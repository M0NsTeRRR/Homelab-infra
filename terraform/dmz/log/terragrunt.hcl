terraform {
  source = "../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server2.unicornafk.fr"
  vm_name      = "log"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 3
    memory   = 8192
  }

  disk = {
    datastore = "SERVER2-RAID1"
    size      = 500
  }

  vm_ip  = "192.168.10.102"
  vm_ip6 = "2a0c:b641:02c0:110::102"

  domain = "unicornafk.fr"
}