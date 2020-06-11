#!/bin/bash

apt-get install -y snmpd

sed -i '/agentaddress  127.0.0.1,\[::1\]/c\agentaddress 0.0.0.0,::' /etc/snmp/snmpd.conf

sed -i '/rocommunity  public default -V systemonly/c\rocommunity unicornafk default' /etc/snmp/snmpd.conf
sed -i '/rocommunity6 public default -V systemonly/c\rocommunity6 unicornafk default' /etc/snmp/snmpd.conf

systemctl restart snmpd