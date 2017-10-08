FROM debian:stretch
#LABEL docker-virtualmin
MAINTAINER cutech <cody@c-u-tech.com>
ADD http://software.virtualmin.com/gpl/scripts/install.sh /
RUN apt-get update -y && apt-get upgrade -y && apt-get -y install wget perl curl screen apache2-mpm-worker php5-dev libapache2-mod-php5 php5-ffmpeg php5-geoip php5-imagick php5-memcached php5-svn php5-cgi php5-cli php5-common php5-curl php5-gd php5-gmp php5-imap php5-ldap php5-mcrypt php5-mysql php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-pear memcached && apt-get -y autoremove
RUN chmod +x /install.sh
# create root password
RUN printf admin\\nadmin\\n | passwd
RUN chmod +x install.sh && sh install.sh -f --hostname $(hostname -f).id
EXPOSE 20 21 22 25 80 110 111 143 443 587 993 995 3306 10000 20000 40259 38532
EXPOSE 53/udp 53/tcp
ENTRYPOINT ["/bin/bash"]
