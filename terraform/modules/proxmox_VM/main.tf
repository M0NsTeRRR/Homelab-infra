resource "proxmox_vm_qemu" "rancher2" {
  name = var.vm.name
  desc = var.vm.description

  target_node = var.target_node

  pool = ""

  clone      = "${var.distribution.name}-${var.distribution.version}"
  clone_wait = 15

  agent = 1

  os_type = "cloud-init"
  cores   = var.hardware.cores
  sockets = var.hardware.sockets
  cpu     = "kvm64"
  memory  = var.hardware.memory
  scsihw  = "virtio-scsi-pci"

  disk {
    id           = 0
    size         = var.disk_size
    type         = "scsi"
    storage      = "pool"
    storage_type = "cephfs"
    iothread     = true
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
    tag    = var.network.vlan
  }

  ipconfig0 = "ip=${var.network.ip},gw=${var.network.gateway}"
}
