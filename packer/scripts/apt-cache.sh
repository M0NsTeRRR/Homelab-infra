#!/bin/bash

cat <<EOT >> /etc/apt/apt.conf.d/01proxy
Acquire::HTTP::Proxy "http://192.168.10.51:3142";
Acquire::HTTPS::Proxy "DIRECT";
EOT

apt-get update