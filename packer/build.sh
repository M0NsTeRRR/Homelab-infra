#!/usr/bin/env bash
export PACKER_CACHE_DIR=packer_cache

set -e

vcenter_server='vsphere.unicornafk.fr'
username='administrator@vsphere.unicornafk.fr'

read -p 'host_ip: ' host_ip
read -p 'distribution: ' distribution
read -p 'version: ' version
read -sp 'password: ' password
printf "\n"

packer build \
  -var "host_ip=$host_ip" \
  -var "distribution=$distribution" \
  -var "version=$version" \
  -var "vcenter_server=$vcenter_server" \
  -var "username=$username" \
  -var "password=$password" \
  -timestamp-ui \
  templates/"$distribution".json