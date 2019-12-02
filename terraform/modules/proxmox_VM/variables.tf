variable "vm" {
  description = "VM informations"
  type = object({
    name        = string
    description = string
  })
}

variable "target_node" {
  description = "Node name that will host the VM"
  type        = string
}

variable "distribution" {
  description = "Distribution informations"
  type = object({
    name    = string
    version = string
  })
}

variable "hardware" {
  description = "Hardware informations"
  type = object({
    cores   = number
    sockets = number
    memory  = number
  })
}

variable "disk_size" {
  description = "Disk size in Gb"
  type        = number
}

variable "network" {
  description = "Network informations"
  type = object({
    ip      = string
    gateway = string
    vlan    = number
  })
}
