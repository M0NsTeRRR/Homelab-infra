This is my Homelab infrastructure.

# Requirements

- Ansible (version >= 2.9.5)
- Packer (version >= 1.5.4)
- Terraform (version >= 0.12.24)
	- Terragrunt (version >= 0.23.2)

# Packer
`cd packer`

Supported distributions :
- Debian (10.3.0) - [iso](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.3.0-amd64-netinst.iso)  
- Ubuntu (18.04.4) - [iso](http://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.4-server-amd64.iso)

### Create template
Linux : `./build.sh`  
Windows : `./build.ps1`

### Validate syntax template
Linux : `./validate.sh`  
Windows : `./validate.ps1`

# Terraform
`cd terraform`  
fill `account.hcl`

Infrastructure is split in 2 parts :  
- dmz
- lab

**Command must be run in one of this two directories (dmz/lab)**

### Create an execution plan
`terragrunt plan-all`

### Deploy/update infrastructure
`terragrunt apply-all`

# Credits

Copyright © Ludovic Ortega, 2019

Contributor(s):

-Ortega Ludovic - mastership@hotmail.fr