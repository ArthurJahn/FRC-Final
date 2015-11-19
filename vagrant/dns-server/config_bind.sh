#!/usr/bin/env bash

# update packages
apt-get update

# install dns server bind
echo 'Installing dependencies...'
apt-get install -y bind9 dnsutils
apt-get install -y haveged

# create zone files
echo 'Create file zones...'
mkdir -p /etc/bind/zones/master
cp /vagrant/db.redesfga.com /etc/bind/zones/master

echo "Creating Keys..."
cd /etc/bind/zones/master
dnssec-keygen -a NSEC3RSASHA1 -b 2048 -n ZONE redesfga.com
dnssec-keygen -f KSK -a NSEC3RSASHA1 -b 4096 -n ZONE redesfga.com

echo "Update Zone with genereted keys..."
for key in `ls Kredesfga.com*.key`
do
echo "\$INCLUDE $key">> db.redesfga.com
done

echo "Creating signzone..."
dnssec-signzone -A -3 $(head -c 1000 /dev/random | sha1sum | cut -b 1-16) -N INCREMENT -o redesfga.com -t db.redesfga.com

echo 'Config bind server...'
cp -f /vagrant/named.conf.local /etc/bind/
cp -f /vagrant/named.conf.options /etc/bind/

echo 'starting bind server'
cd /etc/init.d/
./bind9 restart
