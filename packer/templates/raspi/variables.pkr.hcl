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
  default = "20.04.3"
}