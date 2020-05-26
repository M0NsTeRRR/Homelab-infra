locals {
  network = {
    name    = "DMZ"
    netmask = "24"
    gateway = "192.168.10.2"
    netmask6 = "64"
    gateway6 = "2001:bc8:2e64:110::2"
  }
  domain = "dmz.unicornafk.fr"
}