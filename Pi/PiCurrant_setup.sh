#!/bin/bash
# Setup Currant Pi
# A webserver that gives basic hardware stats

# Install web server
sudo apt-get install lighttpd php7.0-cgi
sudo lighttpd-enable-mod fastcgi fastcgi-php
sudo service lighttpd force-reload

# Backup existing web server
sudo mv /var/www/html /var/www/html_backup
sudo mkdir /var/www/html

# Download, unzip, and copy CurrantPi
cd /tmp/
wget https://github.com/ColinWaddell/CurrantPi/archive/master.zip -O temp.zip
unzip temp.zip
rm temp.zip
sudo cp -r /tmp/CurrantPi-master/* /var/www/html/
rm -rf /tmp/CurrantPi-master

# Set permissions
sudo chmod -R 710 /var/www
