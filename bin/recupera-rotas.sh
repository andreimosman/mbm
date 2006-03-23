#!/bin/sh

EXECUTAR=ON
DEBUG=OFF

ARQ_IPS_PPPOE=/usr/local/mbm/etc/ips-pppoe.conf

if [ -f "$ARQ_IPS_PPPOE" ]; then
   for linha in `cat $ARQ_IPS_PPPOE|/usr/local/bin/replace " " "_"`; do 
      instrucao=`echo $linha|/usr/local/bin/replace "_" " "`

      comando="route change -host $instrucao  "

      if [ "X$DEBUG" == "XON" ]; then
         echo $comando
      fi
 
      if [ "X$EXECUTAR" == "XON" ]; then
         $comando
      fi


   done
fi

