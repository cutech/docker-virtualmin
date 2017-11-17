FROM debian:stretch
# LABEL docker-virtualmin
MAINTAINER cutech <cody@c-u-tech.com>
ADD http://software.virtualmin.com/gpl/scripts/install.sh /root
# Set x, turn off gzip for apt indexes, set HN to hostname -f
RUN set -x
RUN sed -i s/true/false/ /etc/apt/apt.conf.d/docker-gzip-indexes
RUN HN=`hostname -f | cut -f 1 -d "."`
# create root password from ARGs
RUN printf ${passwd}\n${PASSWD}\n | passwd 
# install deps for virtualmin and ops
# RUN apt-get update -y && apt-get upgrade -y && apt-get -y install apt-utils curl dialog gnupg gnupg2 gnupg1 nano perl postgresql postgresql-client procps screen sudo ssh wget && apt-get -y autoremove
# enable execution for the install script and start it with runtime ARGs (-f skip confirmation prompt and -n hostname defaulted)
# RUN chmod +x /root/install.sh && sh /root/install.sh -f -n $(hostname -f)
# install support packages for virtualmin
# RUN apt-get install -y ffmpeg libapache2-mod-php libdbd-pg-perl php-geoip php-imagick php-dev php-memcached php-cgi php-cli php-common php-curl php-gd php-gmp php-imap php-ldap php-mcrypt php-mysql subversion
# RUN apt-get -y autoremove
# RUN touch /etc/network/interfaces
# RUN touch /etc/network/interfaces
# RUN cat /etc/resolv.conf > resolv.conf && sed -i 's/# //'g resolv.conf && cat resolv.conf > /etc/resolv.conf 
# RUN echo \"virtual_alias_maps = hash:/etc/postfix/virtual\" >> /etc/postfix/main.cf
# RUN echo \"mailbox_command = /usr/bin/procmail\" >> /etc/postfix/main.cf
# RUN chgrp -v root /usr/bin/procmail
# RUN chmod 4755 /usr/bin/procmail
EXPOSE 20 21 22 25 80 110 111 143 443 587 993 995 3306 10000 20000 38532 40259
EXPOSE 53/udp 53/tcp
