#!/bin/bash

sudo apt install -y zip

sudo apt install -y nmap

sudo apt install -y bpytop

sudo tee -a /boot/firmware/config.txt <<EOF > /dev/null
dtoverlay=disable-bt
dtoverlay=disable-wifi
EOF
