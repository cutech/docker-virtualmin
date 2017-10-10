# docker-virtualmin
Virtualmin docker image:

docker run -dit --privileged --restart unless-stopped -h [hostname] --name=vmin --dns=127.0.0.1 --dns=[gateway ip] -p 20:20 -p 21:21 -p 2222:22 -p 25:25 -p 53:53 -p 80:80 -p 110:110 -p 111:111 -p 143:143 -p 443:443 -p 587:587 -p 993:993 -p 995:995 -p 3306:3306 -p 10000:10000 -p 20000:20000 -p 38532:38532 -p 40259:40259 cutech/docker-virtualmin

This is still a bit rough, there are Modules that aren't loaded by the installer, and Postgres/Postfix need some hand tuning but it seems to serve up webpages.
