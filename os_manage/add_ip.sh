#!/usr/bin/env bash

for ip in `cat /etc/sshd.deny.hosteye`;do
   real_ip=`echo $ip | awk -F':' '{print $2}'`
   #echo $real_ip
   if grep '^[[:digit:]]*$' <<< "$real_ip";then
       echo $real_ip
   fi
   #fail2ban-client set sshd banip $real_ip
done
