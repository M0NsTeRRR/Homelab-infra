This is my Homelab infrastructure.

![Ansible Lint](https://github.com/M0NsTeRRR/Homelab-infra/workflows/Ansible%20Lint/badge.svg)

# Requirements

- Ansible (version >= 2.9)
	- Python3 and Pip
- Packer (version >= 1.6)
    - Packer builder arm
- Terraform (version >= 0.13)
	- Terragrunt (version >= 0.23)

# Ansible
`cd ansible`  

Fill every certs/<folder> with :
- ca.crt.j2
- ca.csr.j2
- ca.pem.j2
- client.crt.j2
- client.csr.j2
- client.pem.j2

Install dependencies `pip3 install -r requirements.txt`

fill all `secrets.yml` based on `secrets.example` in each subdirectory of `groups_vars`

### Playbooks to add fingerprint on know_hosts
`ansible-playbook -i <inventory_file> playbooks/add-ssh-keys.yml`  

### Playbooks to create client certificate signed by a CA
`ansible-playbook playbooks/generate-certs.yml`

### Playbooks to deploy dmz
`ansible-playbook -i dmz deploy_dmz.yml`

### Playbooks to deploy lab
`ansible-playbook -i lab deploy_lab.yml`

# Packer
Port 8888 used for debian build  
Port 8889 used for ubuntu build  

Open both ports on windows firewall  
Start powershell prompt with admin right `netsh interface portproxy add v4tov4 listenport=<PORT> listenaddress=<IP> connectport=<PORT> connectaddress=127.0.0.1`  
Replace <IP> with the LAN IP of your PC and <PORT> with [8888, 8889]  
To delete the rules `netsh interface portproxy del v4tov4 listenport=<PORT> listenaddress=<IP>`

`cd packer`

Supported distributions :

**VM**
- Debian (10.5.0) - [iso](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.5.0-amd64-netinst.iso)
- Ubuntu (20.04.1) - [iso](http://cdimage.ubuntu.com/ubuntu-legacy-server/releases/20.04.1/release/ubuntu-20.04-legacy-server-amd64.iso)

**Raspberry Pi (v3/v4)**
- Ubuntu (20.04.1) - [iso](https://cdimage.ubuntu.com/releases/20.04.1/release/ubuntu-20.04.1-preinstalled-server-arm64+raspi.img.xz)

### Create template
`./build.sh` (sudo permission required for Raspberry Pi choice only)

# Terraform
`cd terraform`  

Install dependencies `apt install -y ipv6calc jq`

fill `account.hcl` based on `account.example`

Infrastructure is split in 2 parts :  
- dmz
- lab

**Command must be run in one of this two directories (dmz/lab)**

### Create an execution plan
`terragrunt plan-all`

### Deploy/update infrastructure
`terragrunt apply-all`

# Licence

The code is under CeCILL license.

You can find all details here: https://cecill.info/licences/Licence_CeCILL_V2.1-en.html

# Credits

Copyright © Ludovic Ortega, 2019

Contributor(s):

-Ortega Ludovic - mastership@hotmail.fr