#!/bin/sh

# Substitute secret token when the script is started for the first time.
sed -i "s/ThisTokenIsNotSoSecretChangeIt/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 32)/g" /var/shadowd_ui/app/config/parameters.yml

# Start the web server.
/usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -D
