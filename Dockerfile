FROM debian:stretch
#LABEL docker-virtualmin
MAINTAINER cutech <cody@c-u-tech.com>
ADD http://software.virtualmin.com/gpl/scripts/install.sh /
ARG DEBIAN_FRONTEND=noninteractive
RUN sed -i s/true/false/ /etc/apt/apt.conf.d/docker-gzip-indexes
RUN apt-get update -y && apt-get upgrade -y && apt-get -y install apt-utils curl dialog gnupg gnupg2 gnupg1 nano perl postgresql postgresql-client procps screen sudo ssh wget && apt-get -y autoremove
# create root password
RUN printf admin\\nadmin\\n | passwd
RUN chmod +x install.sh && sh install.sh -n cutech.ddns.net
RUN apt-get install -y ffmpeg libapache2-mod-php libdbd-pg-perl php-geoip php-imagick php-dev php-memcached php-cgi php-cli php-common php-curl php-gd php-gmp php-imap php-ldap php-mcrypt php-mysql subversion && apt-get -y autoremove
EXPOSE 20 21 22 25 80 110 111 143 443 587 993 995 3306 10000 20000 40259 38532
EXPOSE 53/udp 53/tcp
ENTRYPOINT ["service webmin start && /bin/bash"]
