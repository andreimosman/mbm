#!/bin/sh
#arp -da 2>&1 >/dev/null 
for x in `cat /etc/macs.conf|/usr/local/bin/replace " " "_"`; do 
   ip=`echo $x|cut -d_ -f1`
   ipmac=`echo $x|/usr/local/bin/replace "_" " "`
   #echo "IP: [$ip]"
   #echo "IPMAC: [$ipmac]"
   arp -d $ip 2>&1 >/dev/null ;arp -s $ipmac permanent
done
