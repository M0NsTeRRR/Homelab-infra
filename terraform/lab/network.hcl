locals {
  network = {
    name    = "LAB"
    netmask = "24"
    gateway = "192.168.20.2"
    netmask6 = "64"
    gateway6 = "2001:470:cace:120::2"
  }
  domain        = "lab.unicornafk.fr"
  reverse_zone  = "20.168.192.in-addr.arpa"
  reverse_zone6 = "0.2.1.0.e.c.a.c.0.7.4.0.1.0.0.2.ip6.arpa"
}