This is my Homelab infrastructure.

![Ansible Lint](https://github.com/M0NsTeRRR/Homelab-infra/workflows/Ansible%20Lint/badge.svg)
![Packer Lint](https://github.com/M0NsTeRRR/Homelab-infra/workflows/Packer%20Lint/badge.svg)
![Terraform Lint](https://github.com/M0NsTeRRR/Homelab-infra/workflows/Terraform%20Lint/badge.svg)

# Requirements

- Ansible (version >= 2.10)
	- Python3 and Pip
- Packer (version >= 1.7)
    - Packer builder arm
- Terraform (version >= 0.14)
	- Terragrunt (version >= 0.28)

# Ansible
`cd ansible`  

Fill certs folders

Install dependencies `pip3 install -r requirements.txt`

fill all `secrets.yml` based on `secrets.example` in each subdirectory of `groups_vars`

### Playbooks to add fingerprint on know_hosts
`ansible-playbook -i hosts playbooks/add-ssh-keys.yml`

### Playbooks to create client certificate signed by a CA
`ansible-playbook playbooks/generate-certs.yml`

### Playbooks to deploy a zone
`ansible-playbook -i hosts deploy_<zone>.yml`  
Replace `<zone>` by the appropriate zone name

# Packer
`cd packer`

Port 8888 used for debian build  
Port 8889 used for ubuntu build  

Open both ports on windows firewall  
Start powershell prompt with admin right `netsh interface portproxy add v4tov4 listenport=<WINDOWS PORT> listenaddress=<WINDOWS IP> connectport=<WSL PORT> connectaddress=<WSL IP>`  
Replace <IP> with the LAN IP of your PC and <PORT> with [8888, 8889]  
To delete the rules `netsh interface portproxy del v4tov4 listenport=<PORT> listenaddress=<IP>`

Supported distributions :

**VM**
- Debian (10.8.0) - [iso](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.8.0-amd64-netinst.iso)
- Ubuntu (20.04.2) - [iso](http://cdimage.ubuntu.com/ubuntu-legacy-server/releases/20.04.2/release/ubuntu-20.04.2-legacy-server-amd64.iso)

**Raspberry Pi (v3/v4)**
- Ubuntu (20.04.2) - [iso](https://cdimage.ubuntu.com/releases/20.04.2/release/ubuntu-20.04.2-preinstalled-server-arm64+raspi.img.xz)

### Create template
`./build.sh` (sudo permission required for Raspberry Pi choice only)

# Terraform
`cd terraform`  

Install dependencies `apt install -y ipv6calc jq`

fill `account.hcl` based on `account.example`

**Command must be run in one of this two directories (dmz/lab/vpn)**

### Create an execution plan
`terragrunt run-all plan`

### Deploy/update infrastructure
`terragrunt run-all apply`

# Licence

The code is under CeCILL license.

You can find all details here: https://cecill.info/licences/Licence_CeCILL_V2.1-en.html

# Credits

Copyright © Ludovic Ortega, 2021

Contributor(s):

-Ortega Ludovic - mastership@hotmail.fr