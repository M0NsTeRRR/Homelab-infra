#!/bin/bash

apt-get install -y snmp snmpd
export MIBS=/usr/share/mibs
systemctl restart snmpd

sed -i '/^agentAddress  udp:127.0.0.1:161/s/^/#/' /etc/snmp/snmpd.conf
sed -i '/^#agentAddress udp:161/s/^#//' /etc/snmp/snmpd.conf
sed -i '/^\#rocommunity public  localhost/a rocommunity unicornafk default' /etc/snmp/snmpd.conf