#!/usr/bin/env bash
export PACKER_CACHE_DIR=packer_cache

set -e

vcenter_server='vsphere.unicornafk.fr'
vcenter_username='administrator@vsphere.unicornafk.fr'

read -p 'host_ip: ' host_ip
read -p 'distribution: ' distribution
read -p 'version: ' version
read -sp 'vcenter_password: ' vcenter_password
printf "\n"

packer build \
  -var "host_ip=$host_ip" \
  -var "distribution=$distribution" \
  -var "version=$version" \
  -var "vcenter_server=$vcenter_server" \
  -var "vcenter_username=$vcenter_username" \
  -var "vcenter_password=$vcenter_password" \
  -timestamp-ui \
  templates/"$distribution".json