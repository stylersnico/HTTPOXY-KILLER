#Use only what you need
- hosts: all
  become: yes
  become_method: sudo
  tasks:
#    - name: Fix Vulnerability on Debian Hosts
#      script: /etc/ansible/ressources/scripts/HTTPOXY-KILLER/httpoxy-fix.debian.sh

#    - name: Fix Vulnerability on RHEL Hosts
#      script: /etc/ansible/ressources/scripts/HTTPOXY-KILLER/httpoxy-fix.rhel.sh

#    - name: Fix Vulnerability on FreeBSD Hosts
#      script: /etc/ansible/ressources/scripts/HTTPOXY-KILLER/httpoxy-fix.freebsd.sh
