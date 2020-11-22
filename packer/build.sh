#!/usr/bin/env bash
export PACKER_CACHE_DIR=packer_cache

set -e

ssh_username=ludovic
ssh_password=ludovic

echo -e "Please enter your choice: \n1) VM\n2) Raspberry Pi\n"
while :
do
  read CHOICE
  case $CHOICE in
	1)
    vcenter_server='vsphere.unicornafk.fr'
    vcenter_username='administrator@unicornafk.fr'

    read -p 'host_ip: ' host_ip
    read -p 'distribution: ' distribution
    read -sp 'vcenter_password: ' vcenter_password
    printf "\n"

    packer build \
      -var "host_ip=$host_ip" \
      -var "distribution=$distribution" \
      -var "vcenter_server=$vcenter_server" \
      -var "vcenter_username=$vcenter_username" \
      -var "vcenter_password=$vcenter_password" \
      -var "ssh_username=$ssh_username" \
      -var "ssh_password=$ssh_password" \
      -timestamp-ui \
      templates/"$distribution".json
		break
		;;
	2)
    read -p 'version: ' version
    printf "\n"

    packer build \
      -var "ssh_username=$ssh_username" \
      -var "ssh_password=$ssh_password" \
      -timestamp-ui \
      templates/raspi.json
		break
		;;
  *)
    break
    ;;
  esac
done