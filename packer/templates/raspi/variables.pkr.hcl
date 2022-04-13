variable "password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "fullname" {
  type    = string
  default = ""
}

variable "username" {
  type    = string
  default = ""
}

variable "version" {
  type    = string
  default = "20.04.4"
}

variable "file_url" {
  type    = string
  default = "https://cdimage.ubuntu.com/releases/20.04.4/release/ubuntu-20.04.4-preinstalled-server-arm64+raspi.img.xz"
}

variable "file_checksum_url" {
  type    = string
  default = "https://cdimage.ubuntu.com/releases/20.04.4/release/SHA256SUMS"
}