#!/bin/bash

apt-get update -y

curl -sL https://raw.githubusercontent.com/it-army-ua-scripts/ADSS/install/install.sh  | bash -s
adss
adss --lang en
adss --auto-install

sudo reboot 
