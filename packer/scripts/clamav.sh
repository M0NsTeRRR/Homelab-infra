#!/bin/bash

apt install -y clamav clamav-freshclam clamav-daemon

sed -i '/^Checks 24/c\Checks 1' /etc/clamav/freshclam.conf