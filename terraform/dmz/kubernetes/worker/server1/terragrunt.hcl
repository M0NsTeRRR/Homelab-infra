terraform {
  source = "../../../..//modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server1.unicornafk.fr"
  vm_name      = "worker1"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 2
    memory   = 4096
  }

  disk = {
    datastore = "SERVER1-RAID1"
    size      = 20
  }

  vm_ip  = "192.168.10.91"
  vm_ip6 = "2a0c:b641:02c0:110::91"
}