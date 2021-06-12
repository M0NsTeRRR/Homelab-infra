locals {
  network = {
    name     = "LAB"
    netmask  = "24"
    gateway  = "192.168.20.2"
    netmask6 = "64"
    gateway6 = "2a0c:b641:02c0:120::2"
  }
  domain        = "lab.unicornafk.fr"
  reverse_zone  = "20.168.192.in-addr.arpa"
  reverse_zone6 = "0.2.1.0.0.c.2.0.1.4.6.b.c.0.a.2.ip6.arpa"
}