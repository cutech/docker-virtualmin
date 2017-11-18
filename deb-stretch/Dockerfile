FROM debian:stretch
MAINTAINER cutech <cody@c-u-tech.com>
ADD http://software.virtualmin.com/gpl/scripts/install.sh /root
ARG PASSWD=${PASSWD}
ENV PASSWD=${PASSWD}
USER root
RUN set -x \
&& export PASSWD=${PASSWD} && printf ${PASSWD}\\n${PASSWD}\\n | passwd \
&& sed -i s/true/false/ /etc/apt/apt.conf.d/docker-gzip-indexes \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get -y install apt-utils curl dialog gnupg gnupg2 gnupg1 nano perl postgresql postgresql-client procps screen sudo ssh wget \
&& apt-get -y autoremove \
&& touch /etc/network/interfaces
RUN chmod +x /root/install.sh \
&& ./root/install.sh -f -n ${HOSTNAME}.${DOMAIN}
RUN apt-get install -y ffmpeg libapache2-mod-php libdbd-pg-perl php-geoip php-imagick php-dev php-memcached php-cgi php-cli php-common php-curl php-gd php-gmp php-imap php-ldap php-mcrypt php-mysql subversion \
&& apt-get -y autoremove
RUN cat /etc/resolv.conf > resolv.conf \
&& sed -i 's/# //'g resolv.conf && cat resolv.conf > /etc/resolv.conf \
&& echo "virtual_alias_maps = hash:/etc/postfix/virtual" >> /etc/postfix/main.cf \
&& echo "mailbox_command = /usr/bin/procmail" >> /etc/postfix/main.cf \
&& chgrp -v root /usr/bin/procmail \
&& chmod 4755 /usr/bin/procmail
EXPOSE 20 21 22 25 53 53/udp 80 110 111 143 443 587 993 995 3306 10000 20000 38532 40259
# ENTRYPOINT ["service", "webmin", "start"]
# CMD ["/bin/bash", "-c", "screen -dmS ops -c \"/bin/bash\""]
