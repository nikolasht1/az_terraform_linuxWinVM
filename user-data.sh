#!/bin/bash

apt-get update -y
usermod -a -G azureadmin azureadmin

sudo add-apt-repository ppa:wireshark-dev/stable
sudo apt install wireshark -y
sudo groupadd wireshark
sudo dpkg-reconfigure wireshark-common -yes
sudo usermod -a -G wireshark $(whoami)

curl -sL https://raw.githubusercontent.com/it-army-ua-scripts/ADSS/install/install.sh  | bash -s
adss
adss --lang en
adss --auto-install
sudo reboot 
