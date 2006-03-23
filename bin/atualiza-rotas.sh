#!/bin/sh

EXECUTAR=ON
DEBUG=ON

# Limpa as rotas

comando="route -n flush"

if [ "X$DEBUG" == "XON" ]; then
   echo $comando
fi

if [ "X$EXECUTAR" == "XON" ]; then
   $comando > /dev/null
fi

ARQ_ROTAS=/usr/local/mbm/etc/rotas.conf
if [ -f "$ARQ_ROTAS" ]; then
   for linha in `cat $ARQ_ROTAS|/usr/local/bin/replace " " "_"`; do 
      instrucao=`echo $linha|/usr/local/bin/replace "_" " "`
      
      comando="route add $instrucao  "

      if [ "X$DEBUG" == "XON" ]; then
         echo $comando
      fi

      if [ "X$EXECUTAR" == "XON" ]; then
         $comando
      fi

   done
fi

ARQ_IPS_PPPOE=/usr/local/mbm/etc/ips-pppoe.conf

if [ -f "$ARQ_IPS_PPPOE" ]; then
   for linha in `cat $ARQ_IPS_PPPOE|/usr/local/bin/replace " " "_"`; do 
      instrucao=`echo $linha|/usr/local/bin/replace "_" " "`

      comando="route add -host $instrucao  "

      if [ "X$DEBUG" == "XON" ]; then
         echo $comando
      fi
 
      if [ "X$EXECUTAR" == "XON" ]; then
         $comando
      fi


   done
fi


ARQ_ROTA_PADRAO=/etc/mygate

comando="route add -net default `cat $ARQ_ROTA_PADRAO`"
if [ "X$DEBUG" == "XON" ]; then
   echo $comando
fi

if [ "X$EXECUTAR" == "XON" ]; then
   $comando
fi
