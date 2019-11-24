This is my Homelab infrastructure.

# Requirements

- Ansible (version >= 2.9.0)
- Packer (version >= 1.4.5)
	- [terraform-provider-proxmox](https://github.com/Telmate/terraform-provider-proxmox)
		- Go (version == 1.13)
- Terraform (version >= 0.12.15)


# Packer
`cd packer`

Supported distributions :
- Debian (10.2.0) - [iso](http://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.3-server-amd64.iso)
- Ubuntu (18.04.3) - [iso](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.2.0-amd64-netinst.iso)

### Create template
`./build.sh`

### Validate syntax template
`./validate.sh`

# Credits

Copyright © Ludovic Ortega, 2019

Contributor(s):

-Ortega Ludovic - mastership@hotmail.fr