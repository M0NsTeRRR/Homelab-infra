variable "host_ip" {
  type    = string
  default = ""
}

variable "http_port" {
  type    = number
  default = 8889
}

variable "ssh_new_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "ssh_password" {
  type    = string
  default = ""
}

variable "ssh_password_encrypted" {
  type    = string
  default = ""
}

variable "ssh_fullname" {
  type    = string
  default = ""
}

variable "ssh_username" {
  type    = string
  default = ""
}

variable "vcenter_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "vcenter_server" {
  type    = string
  default = ""
}

variable "vcenter_username" {
  type    = string
  default = ""
}

variable "distribution" {
  type    = string
  default = "ubuntu"
}

variable "version" {
  type    = string
  default = "20.04.4"
}

variable "iso_url" {
  type    = string
  default = "https://releases.ubuntu.com/20.04/ubuntu-20.04.4-live-server-amd64.iso"
}

variable "iso_checksum" {
  type    = string
  default = "file:https://releases.ubuntu.com/20.04/SHA256SUMS"
}

variable "vm_ip" {
  type    = string
  default = "192.168.20.80"
}

variable "vm_netmask" {
  type    = string
  default = "255.255.255.0"
}

variable "vm_gateway_ip" {
  type    = string
  default = "192.168.20.2"
}

variable "vm_dns_ip" {
  type    = string
  default = "192.168.10.21"
}