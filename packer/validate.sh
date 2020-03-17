#!/usr/bin/env bash
export PACKER_CACHE_DIR=packer_cache

set -e

for distribution in "debian" "ubuntu"; do
  packer validate \
	-var "host_ip=192.168.0.1" \
	-var "distribution=$distribution" \
	-var "version=10" \
	-var "vcenter_server=192.168.0.1" \
	-var "username=administrator@vsphere.local" \
	-var "password=test" \
	-timestamp-ui \
	templates/"$distribution".json
done