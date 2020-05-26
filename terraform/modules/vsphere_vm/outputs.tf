output "server_used" {
  value       = data.vsphere_host.host.name
  description = "Server used to deploy the instance"
}


output "instance_name" {
  value       = format("%s.%s", vsphere_virtual_machine.vm.clone[0].customize[0].linux_options[0].host_name, vsphere_virtual_machine.vm.clone[0].customize[0].linux_options[0].domain)
  description = "The FQDN of the VM"
}

output "instance_ip_addr" {
  value       = [vsphere_virtual_machine.vm.clone[*].customize[*].network_interface[*].ipv4_address]
  description = "The IPv4 address of the VM"
}

output "instance_ip_addr6" {
  value       = [vsphere_virtual_machine.vm.clone[*].customize[*].network_interface[*].ipv6_address]
  description = "The IPv6 address of the VM"
}
