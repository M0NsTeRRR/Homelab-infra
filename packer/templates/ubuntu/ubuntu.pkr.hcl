packer {
  required_version = ">=1.7"
  required_plugins {
    vsphere = {
      version = ">=v1.0"
      source  = "github.com/hashicorp/vsphere"
    }
  }
}

source "vsphere-iso" "ubuntu" {
  CPUs = 1
  RAM  = 1024
  boot_command = [
    "<enter><enter><f6><esc><wait>",
    " ip=${var.vm_ip}::${var.vm_gateway_ip}:${var.vm_netmask}::::${var.vm_dns_ip}",
    " autoinstall ds=nocloud-net;seedfrom=http://${var.host_ip}:{{.HTTPPort}}/",
    " --- <enter>"
  ]
  boot_wait            = "5s"
  cluster              = "HA"
  convert_to_template  = "true"
  cpu_cores            = 1
  datacenter           = "Homelab"
  datastore            = "SERVER3-RAID1"
  disk_controller_type = ["pvscsi"]
  guest_os_type        = "ubuntu64Guest"
  host                 = "server3.unicornafk.fr"
  http_bind_address    = "0.0.0.0"
  http_port_max        = var.http_port
  http_port_min        = var.http_port
  http_content = {
    "/meta-data" = file("../../cloud-config/meta-data")
    "/user-data" = templatefile("../../cloud-config/user-data", { build_fullname = var.ssh_fullname, build_username = var.ssh_username, build_password_encrypted = var.ssh_password_encrypted })
  }
  insecure_connection = true
  iso_checksum        = var.iso_checksum
  iso_url             = var.iso_url
  remove_cdrom        = true
  network_adapters {
    network      = "LAB"
    network_card = "vmxnet3"
  }
  notes        = "${var.distribution}-${var.version}, generated on {{ timestamp }}"
  password     = var.vcenter_password
  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_timeout  = "30m"
  storage {
    disk_size             = 10000
    disk_thin_provisioned = true
  }
  username       = var.vcenter_username
  vcenter_server = var.vcenter_server
  vm_name        = "packer-${var.distribution}-${var.version}"
  vm_version     = 14
}

build {
  sources = ["source.vsphere-iso.ubuntu"]

  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_CONFIG=../ansible/ansible.cfg", "ANSIBLE_HOST_KEY_CHECKING=False", "ANSIBLE_USER=${var.ssh_username}", "ANSIBLE_SSH_PASS=${var.ssh_password}", "ANSIBLE_BECOME_PASS=${var.ssh_password}"]
    extra_arguments  = ["--extra-vars", "main_password=${var.ssh_new_password} main_user=${var.ssh_username}"]
    playbook_file    = "../ansible/deploy_packer.yml"
  }

}
