#!/bin/bash
# Check root access
if [[ "$EUID" -ne 0 ]]; then
	echo -e "Sorry, you need to run this as root"
  	exit 1
fi

clear

echo "This script is made to work under RHEL systems, Let's check your release now."

if [ -f /etc/redhat-release ]; then
    echo "Good RHEL system detected, now, see if you use NGINX or Apache :"
	
else
    echo "No compatible OS detected, exiting ..."
    exit 0
fi

if [ -f /etc/httpd/conf/httpd.conf ]; then
    echo "Apache2 Found, fixing the httpoxy vulnerability ..."
    echo "RequestHeader unset Proxy early" >> /etc/httpd/conf/httpd.conf
    service httpd restart
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
