variable "host_ip" {
  type    = string
  default = ""
}

variable "http_port" {
  type    = number
  default = 8888
}

variable "ssh_new_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "ssh_password" {
  type    = string
  default = ""
}

variable "ssh_username" {
  type    = string
  default = ""
}

variable "vcenter_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "vcenter_server" {
  type    = string
  default = ""
}

variable "vcenter_username" {
  type    = string
  default = ""
}

variable "distribution" {
  type    = string
  default = "debian"
}

variable "version" {
  type    = string
  default = "10.9.0"
}

source "vsphere-iso" "debian" {
  CPUs                 = 1
  RAM                  = 1024
  boot_command         = [
    "<esc><wait>",
    "auto url=http://${var.host_ip}:{{ .HTTPPort }}/debian.cfg",
    "<enter>"
  ]
  boot_wait            = "10s"
  cluster              = "HA"
  convert_to_template  = "true"
  cpu_cores            = 1
  datacenter           = "Homelab"
  datastore            = "SERVER3-RAID1"
  disk_controller_type = ["pvscsi"]
  guest_os_type        = "debian10_64Guest"
  host                 = "server3.unicornafk.fr"
  http_bind_address    = "0.0.0.0"
  http_directory       = "preseed"
  http_port_max        = var.http_port
  http_port_min        = var.http_port
  insecure_connection  = true
  iso_checksum         = "file:https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/SHA512SUMS"
  iso_url              = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-${var.version}-amd64-netinst.iso"
  network_adapters {
    network      = "LAB"
    network_card = "vmxnet3"
  }
  notes        = "${var.distribution}-${var.version}, generated on {{ isotime \"2006-01-02T15:04:05Z\" }}"
  password     = var.vcenter_password
  ssh_password = var.ssh_password
  ssh_timeout  = "30m"
  ssh_username = var.ssh_username
  storage {
    disk_size             = 10000
    disk_thin_provisioned = true
  }
  username       = var.vcenter_username
  vcenter_server = var.vcenter_server
  vm_name        = "packer-${var.distribution}"
  vm_version     = 14
}

build {
  sources = ["source.vsphere-iso.debian"]

  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_CONFIG=../ansible/ansible.cfg", "ANSIBLE_HOST_KEY_CHECKING=False", "ANSIBLE_USER=${var.ssh_username}", "ANSIBLE_SSH_PASS=${var.ssh_password}", "ANSIBLE_BECOME_PASS=${var.ssh_password}"]
    extra_arguments  = ["--extra-vars", "main_password=${var.ssh_new_password} main_user=${var.ssh_username}"]
    playbook_file    = "../ansible/deploy_packer.yml"
  }

}
