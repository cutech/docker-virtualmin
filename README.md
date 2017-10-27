# docker-virtualmin
Virtualmin docker image:

docker run -dit --privileged --restart unless-stopped -h [hostname] --name=vmin --dns=127.0.0.1 --dns=[gateway ip/external DNS] -p 20:20 -p 21:21 -p 2222:22 -p 25:25 -p 53:53 -p 53:53/udp -p 80:80 -p 110:110 -p 111:111 -p 143:143 -p 443:443 -p 587:587 -p 993:993 -p 995:995 -p 3306:3306 -p 10000:10000 -p 20000:20000 -p 38532:38532 -p 40259:40259 cutech/docker-virtualmin

This is still a work in progress (I've only tested this with debian:stretch), you can use the Dockerfile or Docker/Rancher compose (https://github.com/cutech/rOS-catalog/tree/master/templates/Virtualmin).

The Rancher version sets the /home and /usr/share/webmin/virtual-server/scripts/ directories as sidekick volumes for ease in backup and customization of scripts.

You may need to enter the Virtualmin container to start the Virtualmin server 

	docker exec -it [container-ID] /bin/bash
		[root@CaCrOS rancher]# service webmin start
		
The docker-compose.yml command *should* have removed the comments from the /etc/resolv.conf added DNS servers, if not you will have to do it by hand with nano/vi (sed wont do it).

Go to https://your.external.fqdn:10000 and login to the contol panel as root

Right-click on the Webmin tab in the upper left of the control panel and allow webmin popup, reload webmin modules (Checking for usable Webmin modules .. .. found 76 with installed applications, 47 not installed.), reload page, open the servers entry

Go back to the Virtualmin tab and finish the configuation;

Preload Virtualmin libraries? Yes
Run email domain lookup server? Yes

Run ClamAV server scanner? No

Run SpamAssassin server filter? No

Run MySQL database server? Yes
Run PostgreSQL database server? Yes 
	PostgreSQL has been enabled, but cannot be used by Virtualmin. Use the PostgreSQL Database module to fix the problem.
		PostgreSQL Users
			x Add a new PostgreSQL user when a Unix user is added.
			x Update a PostgreSQL user when the matching Unix user is modified.
			x Delete a PostgreSQL user when the matching Unix user is deleted.
		Granted Privileges
			 	information_schema.sql_parts (postgres)
					postgres x SELECT x UPDATE x INSERT x DELETE x RULE x REFERENCES x TRIGGER
					everyone x SELECT
				information_schema.sql_parts (template1)
					postgres x SELECT x UPDATE x INSERT x DELETE x RULE x REFERENCES x TRIGGER
					everyone x SELECT
Set MySQL password

MySQL configuration size

Primary nameserver

Password storage mode

Re-check and refresh configuation
	A problem was found with your Postfix virtual maps : No map sources were found in the Postfix configuration
		edit /etc/postfix/main.cf, add this line to the end: virtual_alias_maps = hash:/etc/postfix/virtual
			Webmin --> Postfix Mail Server --> Edit Config Files: virtual_alias_maps = hash:/etc/postfix/virtual
	Start Postfix/Reload Configuration

Re-check and refresh configuation
	The Procmail program needed for spam filtering does not appear to be installed on your system, or has not yet been set up properly in Webmin's Procmail Mail Filter module. If your system does not use spam filtering, it should be disabled in Virtualmin's module configuration page.
		edit /etc/postfix/main.cf, add this line to the end: mailbox_command = /usr/bin/procmail
			Webmin --> Postfix Mail Server --> Edit Config Files: mailbox_command = /usr/bin/procmail
	Start Postfix/Reload Configuration

Re-check and refresh configuation
	The procmail command /usr/bin/procmail is owned by group mail, when it should be owned by root. Email may not be properly delivered or checked for spam.
		chgrp -v root /usr/bin/procmail

Re-check and refresh configuation
	The procmail command /usr/bin/procmail has 100755 permissions, when it should be setuid and setgid to root. Email may not be properly delivered or checked for spam.
		chmod 4755 /usr/bin/procmail

Re-check and refresh configuation...

	Default IPv4 address for virtual servers is [container IP]

    Quotas are not enabled on the filesystem / which contains email files under /var/mail. Quota editing for email has been disabled.

    Shell /bin/false for FTP users is not included in /etc/shells, which may prevent FTP access.

    All commands needed to create and restore backups are installed.

    The selected package management and update systems are installed OK.

    Chroot jails are available on this system

.. your system is ready for use by Virtualmin.

Updating all Webmin users with new settings..
.. done

Updating Virtualmin library pre-load settings ..
.. done

Updating status collection job ..
.. done

Re-loading Webmin ..
.. done
