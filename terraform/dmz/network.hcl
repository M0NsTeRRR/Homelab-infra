locals {
  network = {
    name    = "DMZ"
    netmask = "24"
    gateway = "192.168.10.2"
    netmask6 = "64"
    gateway6 = "2001:bc8:2e64:110::2"
  }
  domain        = "dmz.unicornafk.fr"
  reverse_zone  = "10.168.192.in-addr.arpa"
  reverse_zone6 = "0.1.1.0.4.6.e.2.8.c.b.0.1.0.0.2.ip6.arpa"
}