#!/usr/bin/env bash
export PACKER_LOG_PATH=log
export PACKER_CACHE_DIR=packer_cache

set -e

for distribution in "debian" "ubuntu"; do
  packer validate \
    -var "host_ip=192.168.0.2" \
    -var "distribution=$distribution" \
    -var "version=18.04.3" \
    -var "proxmox_url=https://test.fr:8006/api2/json" \
    -var "proxmox_username=test" \
    -var "proxmox_password=test" \
    -var "proxmox_node=test" \
    templates/"$distribution"-proxmox.json | tee log/packer_validate.log
done