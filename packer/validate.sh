#!/usr/bin/env bash
export PACKER_LOG_PATH=log
export PACKER_CACHE_DIR=packer_cache

set -e

packer validate \
  -var "host_ip=192.168.0.2" \
  -var "distribution=debian" \
  -var "version=10.2.0" \
  -var "proxmox_url=https://test.fr:8006/api2/json" \
  -var "proxmox_username=test" \
  -var "proxmox_password=test" \
  -var "proxmox_node=test" \
  templates/debian-proxmox.json | tee log/packer_validate.log