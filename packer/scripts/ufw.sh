#!/bin/bash

apt install ufw -y

ufw allow ssh

ufw allow 161

ufw enable