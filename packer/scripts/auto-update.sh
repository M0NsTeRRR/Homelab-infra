#!/bin/bash

apt install -y unattended-upgrades

sed -i '/^\/\/Unattended-Upgrade::Mail "root";/c\Unattended-Upgrade::Mail "root";' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/^\/\/Unattended-Upgrade::MailOnlyOnError "true";/c\Unattended-Upgrade::MailOnlyOnError "false";' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/^\/\/Unattended-Upgrade::InstallOnShutdown "true";/c\Unattended-Upgrade::InstallOnShutdown "false";' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/^\/\/Unattended-Upgrade::Remove-Unused-Kernel-Packages "false";/c\Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";' /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/^\/\/Unattended-Upgrade::Remove-Unused-Dependencies "false";/c\Unattended-Upgrade::Remove-Unused-Dependencies "true";' /etc/apt/apt.conf.d/50unattended-upgrades
echo 'Unattended-Upgrade::Remove-New-Unused-Dependencies "true";' >> /etc/apt/apt.conf.d/50unattended-upgrades
sed -i '/^\/\/ Unattended-Upgrade::SyslogEnable "false";/c\Unattended-Upgrade::SyslogEnable "true";' /etc/apt/apt.conf.d/50unattended-upgrades

echo 'APT::Periodic::Enable "1";' >> /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Download-Upgradeable-Packages "1";' >> /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::AutocleanInterval "7";' >> /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Verbose "1";' >> /etc/apt/apt.conf.d/20auto-upgrades