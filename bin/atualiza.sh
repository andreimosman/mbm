#!/bin/sh
############################################################################
# Este arquivo é parte integrante do MBM (Mosman Bandwidth Manager)        #
# CopyRight(c) mosman.com.br - Todos os direitos reservados                #
# http://www.mosman.com.br/                                                #
# mailto: mbm@mosman.com.br / mosman@mosman.com.br / suporte@mosman.com.br #
############################################################################

. /usr/local/mbm/bin/atualiza.conf
#. /home/mosman/dev/mbm-o33/bin/atualiza.conf

echo 'ATUALIZANDO O SISTEMA ( OpenBSD-'$VERSAO: `whoami` ')'
echo "-------------------------------------"

echo "Verificando arquivos: "
echo ""
echo "configurações:"

echo -n "$ARPCONF... "
if [ ! -f "$ARPCONF" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'

echo -n "$INTCONF... "
if [ ! -f "$INTCONF" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'

echo -n "$PFCONF... "
if [ ! -f "$PFCONF" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'

echo -n "$MRTGCONF... "
if [ ! -f "$MRTGCONF" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'





echo ""
echo "executaveis:"

echo -n "$ARP... "
if [ ! -f "$ARP" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'


echo -n "$ATUALIZAROTAS... "
if [ ! -f "$ATUALIZAROTAS" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'



echo -n "$PFCTL... "
if [ ! -f "$PFCTL" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'

echo -n "$MRTG... "
if [ ! -f "$MRTG" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'

echo -n "$SLEEP... "
if [ ! -f "$SLEEP" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'

echo -n "$KILLALL... "
if [ ! -f "$KILLALL" ];
then
   echo 'erro: não encontrado'
   echo ''
   echo 'ATUALIZAÇÃO NÃO EFETUADA !!! '
   exit 255;
fi
echo 'encontrado'


echo ''
echo 'Verificacoes OK, atualizando sistema:'
echo ''


#echo -n 'Token Bucket Regulator... '
#/sbin/tbrconfig $IF_EXTERNA $EXT_TOKENRATE $EXT_BUCKETSIZE 2>&1 > /dev/null
#for if in `cat $INTCONF` ; do
#   /sbin/tbrconfig $if $TOKENRATE $BUCKETSIZE 2>&1 > /dev/null
#done
#echo 'configurado'

echo -n 'ARP... '
#for if in `cat $INTCONF` ; do
#   ifconfig $if down
#done
#$SLEEP 2
$ARP -ad > /dev/null 2>&1;$ARP -f $ARPCONF > /dev/null 2>&1
#for if in `cat $INTCONF` ; do
#   ifconfig $if up
#done

#sh /usr/local/mbm/bin/atualiza-arp.sh 2>&1 >/dev/null



#$ARP -da > /dev/null 2>&1;$ARP -f $ARPCONF > /dev/null 2>&1

echo 'atualizado'

#echo -n 'rotas... '
#   sh $ATUALIZAROTAS 2>&1 >/dev/null
#echo 'atualizado'

echo -n 'Route-to+Queue para usuarios via cabo/ip privado... '
cat /etc/pf.conf | grep -v "xl1 route-to (fxp0 172.16.0.1) from 200" > /tmp/pf.conf
chown www.www /tmp/pf.conf && mv /tmp/pf.conf /usr/local/mbm/etc/pf.conf
echo 'atualizado'

echo -n 'PacketFilter... '
$PFCTL $PFPARAMRULES $PFCONF
if [ -f "/etc/nat.conf" ];
then
   $PFCTL $PFPARAMNAT /etc/nat.conf
fi
echo 'atualizado'

echo -n 'MRTG... '
$SLEEP 2
$MRTG $MRTGCONF > /dev/null & 2>&1
echo 'atualizado'

echo ''
echo 'Sistema Atualizado com Sucesso'
echo ''

