#!/usr/bin/env bash

# update packages
apt-get update

# install dns server bind
apt-get install bind9 dnsutils

# create zone files
mkdir -p /etc/bind/zones/master
ln -fs /vagrant/db.redesfga.com /etc/bind/zones/master

echo "zone \"redesfga.com\" {
       type master;
       file \"/etc/bind/zones/master/db.redesfga.com\";
};" > /etc/bind/named.conf.local

./etc/init.d/bind9 start
