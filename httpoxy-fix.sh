# Check root access
if [[ "$EUID" -ne 0 ]]; then
	echo -e "${CRED}Sorry, you need to run this as root${CEND}"
  	exit 1
fi

echo "This script is made to work under Debian and RHEL systems \
Let's check your release now."

if [ -f /etc/debian_version ]; then
    echo "Good Debian system detected, now, see if you use NGINX or Apache :

    if [ -f /etc/apache2/apache2.conf ]; then
        echo "Apache2 Found, fixing the httpoxy vulnerability .... \"
        a2enmod headers
        wget https://raw.githubusercontent.com/stylersnico/HTTPOXY-KILLER/master/etc/apache2/conf-available/httpoxy.conf
        mv httpoxy.conf /etc/apache2/conf-available/httpoxy.conf
        a2enconf httpoxy
        service apache2 restart
        echo "Alright, the httpoxy vulnerability is fixed."

    else
        echo "No Apache2 detected or not using standard folders"

    fi

    if [ -f /etc/nginx/nginx.conf ]; then
        echo "NGINX Found, fixing the httpoxy vulnerability ... \"
        echo 'fastcgi_param HTTP_PROXY "";' >> /etc/nginx/fastcgi_params
        service nginx restart
        echo "Alright, the httpoxy vulnerability is fixed."

    else
        echo "No NGINX detected or not using standard folders"

    fi

    echo "Alright, the httpoxy vulnerability is fixed."


elif [ -f /etc/redhat-release ]; then
    echo "Good RHEL system detected, now, see if you use NGINX or Apache :

    if [ -f /etc/httpd/conf/httpd.conf ]; then
        echo "Apache2 Found, fixing the httpoxy vulnerability .... \"
        echo "RequestHeader unset Proxy early" >> /etc/httpd/conf/httpd.conf
        service httpd restart
        echo "Alright, the httpoxy vulnerability is fixed."

    else
        echo "No Apache2 detected or not using standard folders"

    fi

    if [ -f /etc/nginx/nginx.conf ]; then
        echo "NGINX Found, fixing the httpoxy vulnerability ... \"
        echo 'fastcgi_param HTTP_PROXY "";' >> /etc/nginx/fastcgi_params
        service nginx restart
        echo "Alright, the httpoxy vulnerability is fixed."

    else
        echo "No NGINX detected or not using standard folders"

    fi

else
    echo "No compatible OS detected, exiting ..."
    exit 0
fi
