#!/bin/sh
####
# Envia um ping para os clientes para mante-los ativos
############

cut -d" " -f 1 /usr/local/mbm/etc/ips-pppoe.conf |fping -Aa
