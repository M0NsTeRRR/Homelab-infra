#!/bin/bash

apt-get install -y snmpd

sed -i '/^agentAddress  udp:127.0.0.1:161/s/^/#/' /etc/snmp/snmpd.conf
sed -i '/^#agentAddress udp:161/s/^#//' /etc/snmp/snmpd.conf
sed -i '/^\#rocommunity public  localhost/a rocommunity unicornafk default' /etc/snmp/snmpd.conf

systemctl restart snmpd