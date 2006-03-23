####################################################################################
# Arquivo de configuração gerado pelo MBM (Mosman Bandwidth Manager) {versao_mbm}  #
# CopyRight(c) mosman.com.br - Todos os direitos reservados                        #
# http://www.mosman.com.br/                                                        #
# mailto: mbm@mosman.com.br / mosman@mosman.com.br / suporte@mosman.com.br         #
####################################################################################

<loop name="interfaces">interface {interface} bandwidth 1000M tbrsize 7000  cbq
</loop name="interfaces">

<loop name="interfaces">class cbq {interface} root NULL pbandwidth 100
</loop name="interfaces">

<loop name="interfaces">class cbq {interface} ctl_class root exactbandwidth 100K control
class cbq {interface} def root borrow pbandwidth 95 default
</loop name="interfaces">

<loop name="altq_ips">
# {username} ({str_status})
#####################
class cbq {interface_externa} {altq_label} def exactbandwidth {banda_up}{tipo_banda_up} 
filter {interface_externa} {altq_label} 0 0 {alvo} 0 0
class cbq {interface_interna} {altq_label} def exactbandwidth {banda_down}{tipo_banda_down} 
filter {interface_interna} {altq_label} {alvo} 0 0 0 0
{svc}
</loop name="altq_ips">
