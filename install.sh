#!/bin/bash

sudo apt install -y zip

sudo apt install -y nmap

sudo snap install bpytop

sudo apt install -y unzip

sudo tee -a /boot/firmware/config.txt <<EOF > /dev/null
dtoverlay=disable-bt
dtoverlay=disable-wifi
EOF



for file in ./scripts/*; do
  # commands to execute for each file
  filename=$(basename "$file")
  echo "$filename"
  sudo cp -f ./scripts/$filename /bin/
  sudo chmod +x /bin/$filename
done