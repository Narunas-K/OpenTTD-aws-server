#! /bin/bash
echo "Starting install" > /tmp/openttd-install.log
sudo apt-get update >> /tmp/openttd-install.log
sudo apt-get install openttd-opengfx ufw -y >> /tmp/openttd-install.log
wget https://cdn.openttd.org/openttd-releases/1.10.3/openttd-1.10.3-linux-ubuntu-focal-amd64.deb  -O /tmp/openttd-1.10.3.deb >> /tmp/openttd-install.log
sudo apt-get install -f /tmp/openttd-1.10.3.deb -y  >> /tmp/openttd-install.log
echo "Finishing install" >> /tmp/openttd-install.log