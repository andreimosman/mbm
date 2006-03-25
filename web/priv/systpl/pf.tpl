######################################################################################
# /etc/pf.conf                                                                       #
# Arquivo gerado pelo MBM - Mosman Bandwidth Manager V {$versao_mbm}                  #
# Autor: Andrei de Oliveira Mosman - Todos os direitos reservados                    #
# mosman@mosman.com.br / andreimosman@hotmail.com                                    #
# Todos os direitos reservados                                                       #
#                                                                                    #
# See pf.conf(5) for syntax and examples                                             #
######################################################################################

#
# Macros
#


#
# Tables
#


#
# Options
#

set optimization satellite
#set optmization aggressive
set block-policy drop
set block-policy return


#
# Normalizations (scrub)
#

scrub in all


#
# Queue
#

<loop name="interfaces">altq on {interface} bandwidth 2Gb cbq queue { def_{tipo}_{interface} }
   queue def_{tipo}_{interface} bandwidth 100% priority 0 cbq(default borrow) {queuelist}

</loop name="interfaces">


# Queue Definitions
<loop name="queue_list">queue {queue} bandwidth {banda} 
</loop name="queue_list">


#
# Translations (NAT/RDR)
#


#Ativando Proxy!!!
#rdr on xl1 proto tcp from any to any port 80 -> 127.0.0.1 port 3128
#


{PF_PRE_CONF}


#
# Rules
#



########################
# Início dos bloqueios #
########################


   block in log quick proto tcp from any to any port 135><139 label ms 
   block in log quick proto tcp from any port 135><139 to any label ms 
   block out log quick proto tcp from any to any port 135><139 label ms 
   block out log quick proto tcp from any port 135><139 to any label ms
   block in log quick proto udp from any to any port 135><139 label ms 
   block in log quick proto udp from any port 135><139 to any label ms 
   block out log quick proto udp from any to any port 135><139 label ms 
   block out log quick proto udp from any port 135><139 to any label ms 
   block in log quick proto udp from any to any port 135><139 label ms 
   block in log quick proto tcp from any to any port 4444 label ms 
   block in log quick proto tcp from any to any port 445 label ms 
   block in log quick proto tcp from any to any port 593 label ms 
   block in log quick proto udp from any to any port 69 label ms  



# Redes bloqueadas
###################
<loop name="redes_bloqueadas">
# {$username} ({$str_status})
block out from any to {alvo}
block in from {alvo} to any
</loop name="redes_bloqueadas">

# IPs bloqueados
###################
<loop name="ips_bloqueados">
# {$username} ({$str_status})
block out quick from any to {alvo}
block in quick from {alvo} to any
</loop name="ips_bloqueados">

# Serviços bloqueados
###################
<loop name="servicos_bloqueados">
# {$username} ({$servico})
block {tipo_bloqueio} quick proto tcp from {origem} to {destino}
#block {tipo_bloqueio} quick proto udp from {origem} to {destino}
</loop name="servicos_bloqueados">

########################
# Fianal dos bloqueios #
########################



# Rotulos (IPs disponiveis)
##################

<loop name="ips_disponiveis">
# {$username} ({$str_status})
pass in quick on {interface_externa} from any to {$ipaddr}
pass in  quick on {interface_interna} from {$ipaddr} to any
pass out quick on {interface_externa} from {$ipaddr} to any  queue {queueout} label out_{rotulo}
pass out quick on {interface_interna} from any to {$ipaddr} queue {queuein} label in_{rotulo}
</loop name="ips_disponiveis">

###########################################################################
# GERADO DINAMICAMENTE (VIA INTERFACE WEB/ATUALIZACAO DO SISTEMA (fim)    #
###########################################################################

{PF_POS_CONF}
