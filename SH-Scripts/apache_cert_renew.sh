#!/bin/sh
if [ $(id -u) -ne 0 ]; then
echo "Error: Script must be run as root."
exit 1
fi

echo "Halting webservers..."
systemctl stop apache2
systemctl status apache2
certbot renew
systemctl start apache2
systemctl status apache2
