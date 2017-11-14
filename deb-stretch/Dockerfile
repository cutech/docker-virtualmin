FROM debian:stretch
# LABEL docker-virtualmin
MAINTAINER cutech <cody@c-u-tech.com>
ADD http://software.virtualmin.com/gpl/scripts/install.sh /root
# docker/rancher-compose.yml provides the ARGs ${FQDN} ${UNINSTALL} ${SETUP} ${MINIMAL} ${BUNDLE} ${DISABLE}
ARG DEBIAN_FRONTEND=noninteractive
# turn off gzip for apt indexes
# RUN sed -i s/true/false/ /etc/apt/apt.conf.d/docker-gzip-indexes
# create root password from ARGs
# RUN printf ${PASSWD}\\n${PASSWD}\\n | passwd 
# install deps for virtualmin and ops
# RUN apt-get update -y && apt-get upgrade -y && apt-get -y install apt-utils curl dialog gnupg gnupg2 gnupg1 nano perl postgresql postgresql-client procps screen sudo ssh wget && apt-get -y autoremove
# enable execution for the install script and start it with runtime ARGs (-f skip confirmation prompt and -n hostname defaulted)
# RUN chmod +x /root/install.sh && sh /root/install.sh -f -n ${FQDN} ${UNINSTALL} ${SETUP} ${MINIMAL} ${BUNDLE} ${DISABLE}
# install support packages for virtualmin
# RUN apt-get install -y ffmpeg libapache2-mod-php libdbd-pg-perl php-geoip php-imagick php-dev php-memcached php-cgi php-cli php-common php-curl php-gd php-gmp php-imap php-ldap php-mcrypt php-mysql subversion && apt-get -y autoremove && touch /etc/network/interfaces
EXPOSE 20 21 22 25 80 110 111 143 443 587 993 995 3306 10000 20000 38532 40259
EXPOSE 53/udp 53/tcp
# ENTRYPOINT ["service webmin start"]
CMD [/bin/bash, -c, "screen -S ops -d -m /bin/bash"]