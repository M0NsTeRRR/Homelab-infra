locals {
  network = {
    name    = "ROUTING"
    netmask = "24"
    gateway = "192.168.5.1"
    netmask6 = "64"
    gateway6 = "2a0c:b641:02c0:105::1"
  }
  domain        = "routing.unicornafk.fr"
  reverse_zone  = "5.168.192.in-addr.arpa"
  reverse_zone6 = "5.0.1.0.0.c.2.0.1.4.6.b.c.0.a.2.ip6.arpa"
}