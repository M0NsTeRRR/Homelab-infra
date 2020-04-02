#!/bin/bash

apt install ufw -y

ufw allow ssh

ufw allow 161

yes | sudo ufw enable