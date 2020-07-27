output "server_used" {
  value       = data.vsphere_host.host.name
  description = "Server used to deploy the instance"
}

output "instance_name" {
  value       = format("%s.%s", var.vm_name, var.domain)
  description = "The FQDN of the VM"
}

output "instance_ip_addr" {
  value       = [var.vm_ip]
  description = "The IPv4 address of the VM"
}

output "instance_ip_addr6" {
  value       = [var.vm_ip6]
  description = "The IPv6 address of the VM"
}
