#!/bin/bash
# Check root access
if [[ "$EUID" -ne 0 ]]; then
	echo -e "${CRED}Sorry, you need to run this as root${CEND}"
  	exit 1
fi

echo "This script is made to work under Debian systems, Let's check your release now."

if [ -f /etc/debian_version ]; then
    echo "Good Debian system detected, now, see if you use NGINX or Apache :"

else
    echo "No compatible OS detected, exiting ..."
    exit 0
fi

if [ -f /etc/apache2/apache2.conf ]; then
    echo "Apache2 Found, fixing the httpoxy vulnerability ..."
    a2enmod headers
    wget -q https://raw.githubusercontent.com/stylersnico/HTTPOXY-KILLER/master/etc/apache2/conf-available/httpoxy.conf
    mv httpoxy.conf /etc/apache2/conf-available/httpoxy.conf
    a2enconf httpoxy
    service apache2 restart
    echo "Alright, the httpoxy vulnerability is fixed."
else
    echo "No Apache2 detected or not using standard folders"
fi

if [ -f /etc/nginx/nginx.conf ]; then
    echo "NGINX Found, fixing the httpoxy vulnerability ..."
    wget -q https://raw.githubusercontent.com/stylersnico/HTTPOXY-KILLER/master/etc/nginx/fastcgi_params
    cat fastcgi_params >> /etc/nginx/fastcgi_params
    service nginx restart
    echo "Alright, the httpoxy vulnerability is fixed."
else
    echo "No NGINX detected or not using standard folders"
fi
