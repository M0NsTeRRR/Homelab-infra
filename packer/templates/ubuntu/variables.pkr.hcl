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
  default = "20.04.1"
}