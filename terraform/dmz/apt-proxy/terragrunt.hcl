terraform {
  source = "../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server3.unicornafk.fr"
  vm_name      = "apt-proxy"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 1
    memory   = 1024
  }

  disk = {
    datastore = "SERVER3-RAID1"
    size      = 100
  }

  vm_ip  = "192.168.10.41"
  vm_ip6 = "2001:bc8:2e64:110::41"

  domain = "unicornafk.fr"
}