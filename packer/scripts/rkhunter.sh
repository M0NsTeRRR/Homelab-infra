#!/bin/bash

apt install -y rkhunter

sed -i '/^CRON_DAILY_RUN=/c\CRON_DAILY_RUN="true"' /etc/default/rkhunter
sed -i '/^CRON_DB_UPDATE=/c\CRON_DB_UPDATE="true"' /etc/default/rkhunter
sed -i '/^APT_AUTOGEN=/c\APT_AUTOGEN="true"' /etc/default/rkhunter
echo 'UPDATE_MIRRORS=1' >> /etc/default/rkhunter
echo 'MIRRORS_MODE=0' >> /etc/default/rkhunter
echo 'MAIL-ON-WARNING=root' >> /etc/default/rkhunter
echo 'PHALANX2_DIRTEST=1' >> /etc/default/rkhunter
echo 'COPY_LOG_ON_ERROR=1' >> /etc/default/rkhunter
echo 'WEB_CMD=""' >> /etc/default/rkhunter
echo 'PKGMGR=DPKG' >> /etc/default/rkhunter
echo 'USE_LOCKING=1' >> /etc/default/rkhunter


cat << 'EOT' >> /etc/default/rkhunter
UPDATE_MIRRORS=1
MIRRORS_MODE=0
CRON_DAILY_RUN="true"
CRON_DB_UPDATE="true"
APT_AUTOGEN="true"
MAIL-ON-WARNING=root
PHALANX2_DIRTEST=1
COPY_LOG_ON_ERROR=1
WEB_CMD=""
PKGMGR=DPKG
USE_LOCKING=1
EOT