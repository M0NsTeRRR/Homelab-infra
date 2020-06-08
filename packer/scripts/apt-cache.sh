#!/bin/bash

cat << 'EOT' >> /etc/apt/detect-http-proxy.sh
#!/bin/bash
IP=apt-proxy.unicornafk.fr
PORT=3142

nc -w1 -z ${IP} ${PORT} && echo http://${IP}:${PORT} || echo DIRECT
EOT

chmod +x /etc/apt/detect-http-proxy.sh

cat <<EOT >> /etc/apt/apt.conf.d/01proxy
Acquire::HTTP::Proxy-Auto-Detect "/etc/apt/detect-http-proxy.sh";
Acquire::HTTPS::Proxy "DIRECT";
EOT

apt-get update