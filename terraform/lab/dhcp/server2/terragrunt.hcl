terraform {
  source = "../../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server2.unicornafk.fr"
  vm_name      = "dhcp1"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 1
    memory   = 1024
  }

  disk = {
    datastore = "SERVER2-DISK1"
    size      = 20
  }

  vm_ip  = "192.168.20.21"
  vm_ip6 = "2001:bc8:2e64:120::21"

  domain = "unicornafk.fr"
}