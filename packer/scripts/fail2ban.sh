#!/bin/bash

apt install -y fail2ban

cat << EOT >> /etc/fail2ban/jail.d/ssh.conf
[DEFAULT]
ignoreip = 127.0.0.1/8
findtime = 3600
bantime = 86400
maxretry = 3

[sshd]
enabled = true
banaction = ufw
port = ssh
filter = sshd
logpath = %(sshd_log)s
maxretry = 5
EOT