#!/bin/bash

cat <<EOT >> /etc/apt/detect-http-proxy.sh
#!/bin/bash
proxy=192.168.10.51

nc -zw1 $proxy 3128 && echo http://$proxy:3128/ || echo DIRECT
EOT

chmod +x /etc/apt/detect-http-proxy.sh

cat <<EOT >> /etc/apt/apt.conf.d/01proxy
Acquire::HTTP::ProxyAutoDetect "/etc/apt/detect-http-proxy.sh";
Acquire::HTTPS::Proxy "DIRECT";
EOT

apt-get update