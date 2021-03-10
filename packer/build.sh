#!/usr/bin/env bash
export PACKER_CACHE_DIR=packer_cache

set -e

ssh_username=lortega
ssh_password=ludovic

echo -e "Please enter your choice: \n1) VM\n2) Raspberry Pi\n"
while :
do
  read CHOICE
  case $CHOICE in
	1)
    vcenter_server='vcenter.unicornafk.fr'
    vcenter_username='administrator@unicornafk.fr'

    read -p 'Host ip: ' host_ip
    read -p 'Distribution: ' distribution
    read -sp 'Vcenter password: ' vcenter_password
    printf "\n"
    read -sp 'VM password: ' main_password
    printf "\n"

    export main_password

    packer build \
      -var "host_ip=$host_ip" \
      -var "vcenter_server=$vcenter_server" \
      -var "vcenter_username=$vcenter_username" \
      -var "vcenter_password=$vcenter_password" \
      -var "ssh_username=$ssh_username" \
      -var "ssh_password=$ssh_password" \
      -var "main_password=$main_password" \
      -timestamp-ui \
      templates/"$distribution".pkr.hcl
		break
		;;
	2)
    read -sp 'VM password: ' main_password
    printf "\n"

    export main_password

    packer build \
      -var "ssh_username=$ssh_username" \
      -var "ssh_password=$ssh_password" \
      -var "main_password=$main_password" \
      -timestamp-ui \
      templates/raspi.json
		break
		;;
  *)
    break
    ;;
  esac
done