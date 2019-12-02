variable "rancher2" {
  description = "rancher2 configuration"
  default = {
    vm = [
      {
        informations = {
          name        = "server1-rancher2"
          description = "server1-rancher2"
        }
        target_node = "server1"
        network = {
          ip      = "192.168.10.60/24"
          gateway = "192.168.10.2"
          vlan    = 10
        }
      },
      {
        informations = {
          name        = "server2-rancher2"
          description = "server2-rancher2"
        }
        target_node = "server2"
        network = {
          ip      = "192.168.10.61/24"
          gateway = "192.168.10.2"
          vlan    = 10
        }
      },
      {
        informations = {
          name        = "server3-rancher2"
          description = "server3-rancher2"
        }
        target_node = "server3"
        network = {
          ip      = "192.168.10.62/24"
          gateway = "192.168.10.2"
          vlan    = 10
        }
      }
    ]
    hardware = {
      cores   = 2
      sockets = 2
      memory  = 4096
    }
    disk_size = 20
  }
}
