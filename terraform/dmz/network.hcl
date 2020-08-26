locals {
  network = {
    name    = "DMZ"
    netmask = "24"
    gateway = "192.168.10.2"
    netmask6 = "64"
    gateway6 = "2001:470:cace:110::2"
  }
  domain        = "dmz.unicornafk.fr"
  reverse_zone  = "10.168.192.in-addr.arpa"
  reverse_zone6 = "0.1.1.0.e.c.a.c.0.7.4.0.1.0.0.2.ip6.arpa"
}