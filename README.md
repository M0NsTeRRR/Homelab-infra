This is my Homelab infrastructure.

![Ansible Lint](https://github.com/M0NsTeRRR/Homelab-infra/workflows/Ansible%20Lint/badge.svg)

# Requirements

- Ansible (version >= 2.9.6)
	- Python3 and Pip
- Packer (version >= 1.6.0)
- Terraform (version >= 0.12.28)
	- Terragrunt (version >= 0.23.31)

Fill ansible/secrets.yml based on ansible/secrets.example and encrypt the file with ansible-vault

Fill every certs/<folder> with :
- client.crt.j2
- client.key.j2
- node-exporter.crt.j2
- node-exporter.key.j2
- node-exporter.pem.j2

# Ansible
`cd ansible`  

Install dependencies `pip3 install -r requirements.txt`

fill all `secrets.yml` based on `secrets.example` in each subdirectory of `groups_vars`

### Playbooks to add fingerprint on know_hosts
`ansible-playbook -i <inventory_file> playbooks/add-ssh-keys.yml`  

### Playbooks to deploy SSH configuration
`ansible-playbook -i <inventory_file> playbooks/deploy_authorized_keys.yml`  

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
To delete the rules `netsh interface portproxy del v4tov4 listenport=<PORT>  listenaddress=<IP>`  

`cd packer`

Supported distributions :
- Debian (10.5.0) - [iso](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.5.0-amd64-netinst.iso)
- Ubuntu (20.04) - [iso](http://cdimage.ubuntu.com/ubuntu-server/daily/current/focal-legacy-server-amd64.iso)

### Create template
Linux : `./build.sh`  

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