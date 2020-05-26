#!/bin/bash

apt install -y chkrootkit


sed -i '/^RUN_DAILY="false"/c\RUN_DAILY="true"' /etc/chkrootkit.conf