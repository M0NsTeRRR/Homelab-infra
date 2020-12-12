variable "vsphere_datacenter" {
  description = "vSphere datacenter"
  type = string
}

variable "vsphere_cluster" {
  description = "vSphere cluster"
  type = string
}

variable "vsphere_host" {
  description = "vSphere host"
  type = string
}

variable "vm_name" {
  description = "VM name"
  type = string
}

variable "template" {
  description = "Template name"
  type = string
}

variable "hardware" {
  description = "Hardware informations"
  type = object({
    num_cpus  = number
    memory    = number
  })
}

variable "vm_ip" {
  description = "VM IP"
  type = string
}

variable "vm_ip6" {
  description = "VM IPv6"
  type = string
}

variable "vm_user" {
  description = "User"
  type = string
}

variable "vm_password" {
  description = "User password"
  type = string
  sensitive = true
}

variable "domain" {
  description = "Domain of the machine"
  type = string
}

variable "reverse_zone" {
  description = "IPv4 reverse zone"
  type = string
}

variable "reverse_zone6" {
  description = "IPv6 reverse zone"
  type = string
}

variable "dns" {
  description = "DNS informations"
  type = object({
    server_list = list(string)
    suffix_list = list(string)
  })
}

variable "disk" {
  description = "Disk size in Gb"
  type        = object({
    datastore  = string
    size       = number
  })
}

variable "network" {
  description = "Network name"
  type        = object({
    name     = string
    netmask  = string
    gateway  = string
    netmask6 = string
    gateway6 = string
  })
}