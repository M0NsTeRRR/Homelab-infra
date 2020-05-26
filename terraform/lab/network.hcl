locals {
  network = {
    name    = "LAB"
    netmask = "24"
    gateway = "192.168.20.2"
    netmask6 = "64"
    gateway6 = "2001:bc8:2e64:120::2"
  }
  domain = "lab.unicornafk.fr"
}