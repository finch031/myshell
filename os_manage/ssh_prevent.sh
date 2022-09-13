#!/usr/bin/env bash

deny_log=/root/bin/ssh_deny.log
deny_ip_log=/root/bin/ssh_deny_ip.log
cat /var/log/secure | awk '/Failed/{print $(NF-3)}' | sort | uniq -c | awk '{print $2"="$1;}' > $deny_log

max_times="3"

echo "" > $deny_ip_log

for i in `cat $deny_log`
do
    ip=`echo $i |awk -F= '{print $1}'`
    num=`echo $i|awk -F= '{print $2}'`
    if [ $num -gt $max_times ];
    then
      grep $ip /etc/sshd.deny.hosteye > /dev/null
      if [ $? -gt 0 ];
      then
        echo "sshd:$ip:deny" >> /etc/sshd.deny.hosteye
        echo "sshd:$ip,times:$num" >> $deny_ip_log
      fi
    fi
done
