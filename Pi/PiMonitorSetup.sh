#!/bin/bash
# This script setups Pi Currant to monitor my pi.
# Im lazy so this is downloaded and autorun on every new pi I setup.

# instll lighttpd
apt-get install lighttpd php5-cgi --yes
lighttpd-enable-mod fastcgi fastcgi-php
service lighttpd force-reload

# backup current server
mv /var/www/html /var/www/html_backup
mkdir /var/www/html

# download and setup PiCurrant
cd /tmp/
wget https://github.com/ColinWaddell/CurrantPi/archive/master.zip -O temp.zip
unzip temp.zip
rm temp.zip
cp -r /tmp/CurrantPi-master/* /var/www/html/
rm -rf /tmp/CurrantPi-master
