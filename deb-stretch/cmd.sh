#!/bin/bash
printf ${PASSWD}\\n${PASSWD}\\n | passwd \
&& cat /etc/resolv.conf > resolv.conf \
&& sed -i 's/# //'g resolv.conf \
&& cat resolv.conf > /etc/resolv.conf \
&& screen -dmS ops -c "/bin/bash"
