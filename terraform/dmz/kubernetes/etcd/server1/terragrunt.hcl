terraform {
  source = "../../../../modules/vsphere_vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vsphere_host = "server1.unicornafk.fr"
  vm_name      = "etcd1"
  template     = "packer-ubuntu"

  hardware = {
    num_cpus = 2
    memory   = 4096
  }

  disk = {
    "datastore" = "SERVER1-DISK1"
    "size"      = 20
  }

  "vm_ip" = "192.168.10.81"
}