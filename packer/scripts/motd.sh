#!/bin/bash

apt install -y figlet lolcat

chmod -x /etc/update-motd.d/*

[ -e /etc/motd ] && rm /etc/motd

cat << 'EOT' >> /etc/update-motd.d/10-hostname
#!/bin/bash

/usr/bin/env figlet "$(hostname)" | /usr/bin/env /usr/games/lolcat -f
EOT
chmod +x /etc/update-motd.d/10-hostname

cat << 'EOT' >> /etc/update-motd.d/20-sysinfo
#!/bin/bash

# get load averages
IFS=" " read LOAD1 LOAD5 LOAD15 <<<$(cat /proc/loadavg | awk '{ print $1,$2,$3 }')
# get free memory
IFS=" " read USED FREE TOTAL <<<$(free -htm | grep "Mem" | awk {'print $3,$4,$2'})
# get processes
PROCESS=`ps -eo user=|sort|uniq -c | awk '{ print $2 " " $1 }'`
PROCESS_ALL=`echo "$PROCESS"| awk {'print $2'} | awk '{ SUM += $1} END { print SUM }'`
PROCESS_ROOT=`echo "$PROCESS"| grep root | awk {'print $2'}`
PROCESS_USER=`echo "$PROCESS"| grep -v root | awk {'print $2'} | awk '{ SUM += $1} END { print SUM }'`
# get processors
PROCESSOR_NAME=`grep "model name" /proc/cpuinfo | cut -d ' ' -f3- | awk {'print $0'} | head -1`
PROCESSOR_COUNT=`grep -ioP 'processor\t:' /proc/cpuinfo | wc -l`

W="\e[0;39m"
G="\e[1;32m"

echo -e "
${W}system info:
$W  Distro......: $W`cat /etc/*release | grep "PRETTY_NAME" | cut -d "=" -f 2- | sed 's/"//g'`
$W  Kernel......: $W`uname -sr`
$W  Uptime......: $W`uptime -p`
$W  Load........: $G$LOAD1$W (1m), $G$LOAD5$W (5m), $G$LOAD15$W (15m)
$W  Processes...:$W $G$PROCESS_ROOT$W (root), $G$PROCESS_USER$W (user), $G$PROCESS_ALL$W (total)
$W  CPU.........: $W$PROCESSOR_NAME ($G$PROCESSOR_COUNT$W vCPU)
$W  Memory......: $G$USED$W used, $G$FREE$W free, $G$TOTAL$W total$W"
EOT
chmod +x /etc/update-motd.d/20-sysinfo

cat << 'EOT' >> /etc/update-motd.d/30-diskinfo
#!/bin/bash

mountpoints=('/dev/sda1')

white="\e[39m"
green="\e[1;32m"
red="\e[1;31m"
yellow="\e[33m"
barWidth=34
max_usage=90
clear="\e[39m\e[0m"
dim="\e[2m"
barclear=""
echo
echo 'HDD free:'
for point in "${mountpoints[@]}"; do
    line=$(df -hl "${point}")
	label=$(lsblk -o label "${point}")
    usage=$(echo "$line"|tail -n1|awk '{print $5;}'|sed 's/%//')
    usedBarWidth=$((($usage*$barWidth)/100))
    barContent=""
    if [ "${usage}" -ge "${max_usage}" ]; then
        color=$red
    else
        color=$green
    fi
    barContent="${color}"
    for sep in $(seq 1 $usedBarWidth); do
        barContent="${barContent}|"
    done
    barContent="${barContent}${clear}${dim}"
    for sep in $(seq 1 $(($barWidth-$usedBarWidth))); do
        barContent="${barContent}-"
    done
    bar="[${barContent}${clear}]"
	echo "${label}" | awk '{if ($1 != "LABEL") printf("%-10s", $1); }'
	echo "${line}" | awk  '{if ($1 != "Filesystem") printf("%+8s used out of %+5s\n", $3, $2); }'
	echo -e "${bar}"

done
EOT
chmod +x /etc/update-motd.d/30-diskinfo

cat << 'EOT' >> /etc/update-motd.d/40-accessinfo
#!/bin/bash
echo -e "\e[1;31m

  UNAUTHORIZED ACCESS TO THIS DEVICE IS PROHIBITED

  You must have explicit, authorized permission to access or configure this device.
  Unauthorized attempts and actions to access or use this system may result in civil and/or criminal penalties.
  All activities performed on this device are logged and monitored.

\e[0m"
EOT
chmod +x /etc/update-motd.d/40-accessinfo
