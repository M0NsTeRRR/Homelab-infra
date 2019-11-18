#!/usr/bin/env bash
export PACKER_LOG_PATH=log
export PACKER_CACHE_DIR=packer_cache

set -e

proxmox_url='https://192.168.40.12:8006/api2/json'

read -p 'host_ip: ' host_ip
read -p 'distribution: ' distribution
read -p 'version: ' version
printf "proxmox_url: $proxmox_url\n"
read -sp 'proxmox_password: ' proxmox_password
printf "\n"
read -p 'proxmox_node: ' proxmox_node

packer build \
  -var "host_ip=$host_ip" \
  -var "distribution=$distribution" \
  -var "version=$version" \
  -var "proxmox_url=$proxmox_url" \
  -var "proxmox_password=$proxmox_password" \
  -var "proxmox_node=$proxmox_node" \
  templates/"$distribution"-proxmox.json | tee log/packer_build.log