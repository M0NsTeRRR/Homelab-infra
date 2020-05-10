#!/bin/bash

apt install -y ufw

ufw allow ssh

ufw allow 161

yes | sudo ufw enable