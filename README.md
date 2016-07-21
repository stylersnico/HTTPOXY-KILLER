HTTPOXY-KILLER
==============

##License
Script for fixing the HTTPOXY Vulnerability on Debian and RHEL systems (Apache and NGINX)

Based on : https://www.howtoforge.com/tutorial/httpoxy-protect-your-server/

Copyleft (C) Nicolas Simond - 2016

This script is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This script is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this script.  If not, see <http://www.gnu.org/licenses/gpl.txt>

##About this script
Script for fixing the HTTPOXY Vulnerability on Debian and RHEL systems (Apache and NGINX)

Tested on :

- Ubuntu 16.04
- Debian 8.5
- CentOS 7.11

With :

- Apache 2.4.18-2ubuntu3
- NGINX 1.9.15-0ubuntu1
- Apache 2.4.10-10+deb8u4
- NGINX 1.6.2-5+deb8u1
- HTTPD 2.4.6-40.el7.centos.4
- nginx.x86_64 1:1.6.3-9.el7

##Dependencies
Wget and NGINX/Apache

##Designed for
Debian/RHEL based systems

##Installation

For Debian based systems :

<code>cd /tmp && wget --no-check-certificate -q https://raw.githubusercontent.com/stylersnico/HTTPOXY-KILLER/master/httpoxy-fix.debian.sh && chmod +x httpoxy-fix.debian.sh && ./httpoxy-fix.debian.sh</code>


For RHEL based systems :

<code>cd /tmp && wget --no-check-certificate https://raw.githubusercontent.com/stylersnico/HTTPOXY-KILLER/master/httpoxy-fix.rhel.sh && chmod +x httpoxy-fix.rhel.sh && ./httpoxy-fix.rhel.sh</code>

##Test

Use https://httpoxy.rehmann.co/
