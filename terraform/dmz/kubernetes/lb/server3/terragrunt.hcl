terraform {
  source = "../../../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server3.unicornafk.fr"
  vm_name      = "lb3"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 2
    memory   = 4096
  }

  disk = {
    "datastore" = "SERVER3-RAID1"
    "size"      = 20
  }

  "vm_ip" = "192.168.10.63"
}