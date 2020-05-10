#!/bin/bash

apt install -y fail2ban

cat << EOT >> /etc/fail2ban/jail.d/custom.conf
[DEFAULT]
ignoreip = 127.0.0.1
findtime = 3600
bantime = 86400
maxretry = 3

[sshd]
enabled = true
EOT