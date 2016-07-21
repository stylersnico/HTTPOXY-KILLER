#!/bin/bash
# Check root access
if [[ "$EUID" -ne 0 ]]; then
	echo -e "${CRED}Sorry, you need to run this as root${CEND}"
  	exit 1
fi

clear

echo "This script is made to work under freeBSD systems, Let's check your release now."

if [ -f /etc/freebsd-update.conf ]; then
    echo "Good freeBSD system detected, now, see if you use NGINX or Apache :"
	
else
    echo "No compatible OS detected, exiting ..."
    exit 0
fi

if [ -f /usr/local/etc/apache24/httpd.conf ]; then
    echo "Apache2 Found, fixing the httpoxy vulnerability ..."
    echo "RequestHeader unset Proxy early" >> /usr/local/etc/apache24/httpd.conf
    service httpd restart
    echo "Alright, the httpoxy vulnerability is fixed."

else
    echo "No Apache2 detected or not using standard folders"
fi

if [ -f /usr/local/etc/nginx/nginx.conf ]; then
    echo "NGINX Found, fixing the httpoxy vulnerability ..."
    wget -q https://raw.githubusercontent.com/stylersnico/HTTPOXY-KILLER/master/etc/nginx/fastcgi_params
    cat fastcgi_params >> /usr/local/etc/nginx/fastcgi_params
    service nginx restart
    echo "Alright, the httpoxy vulnerability is fixed."

else
    echo "No NGINX detected or not using standard folders"
fi
