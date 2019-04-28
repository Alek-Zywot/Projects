#!/bin/bash
# Pi setup - Headless

# Enabled via boot folder script
# SSH, WiFi country, & WiFi
# Set locale: en_US.UTF-8 UTF-8
# Set time zone to New_York/Eastern (EST)
sudo timedatectl set-timezone EST


# Boot Optimization
# Backup Boot/config.txt
sudo cp /boot/config.txt /boot/config_backup.txt
# GPU Ram (Min = 16)
sudo sed -i -e '$a \# # Set GPU Ram \ngpu_mem=16' /boot/config.txt
# Disable Boot Splash
sudo sed -i -e '$a \# Disable Boot Splash\ndisable_splash=1' /boot/config.txt
# Backup Boot/cmdline.txt
sudo cp /boot/cmdline.txt /boot/cmdline_backup.txt
#  Enable cgroups in Raspberry pi kernel config
sudo sed -i -e 's/$/ cgroup_enable=cpuset cgroup_enable=memory/' /boot/cmdline.txt


# Power conservation
# Disable HDMI on boot using rc.local
sudo sed -i -e '$i \# Disable HDMI to conserve power\n/usr/bin/tvservice -o\n' /etc/rc.local
echo 'HDMI will be disabled on boot starting with next reboot'


# Update packages
sudo apt-get update
echo 'Upgrading packages'
sudo apt-get -y dist-upgrade
echo ' Done upgrading system'

# pip3 install --upgrade pip
# sudo apt-get remove python3-pip; sudo apt-get install python3-pip


# Install packages
#Install git
sudo apt-get -y install git


# Install setfacl/acl (Access Control Lists)
sudo apt-get -y install acl


#DOCKER
# Install Docker & add usergroup
curl -sSL get.docker.com | sh && \
  sudo usermod pi -aG docker
# Install Docker-Compose
sudo apt-get -y install docker-compose
# Create Docker directory
mkdir ~/docker
sudo setfacl -Rdm g:docker:rwx ~/docker
sudo chmod -R 775 ~/docker


# Install Ram2Log
# Keep logs in ram and write to sd card every 1 hour
cd ~
git clone https://github.com/azlux/log2ram
cd log2ram
chmod +x install.sh && sudo ./install.sh
cd ..
sudo rm -r log2ram
# Reboot prior to any other install

# Cleanup git packages
sudo apt-get clean

# NEEDS REBOOT
echo 'MUST REBOOT prior to any other install'
echo 'WILL REBBOT NOW'
