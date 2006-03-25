####################################################################################
# Arquivo de configuração gerado pelo MBM (Mosman Bandwidth Manager) {$versao_mbm}  #
# CopyRight(c) mosman.com.br - Todos os direitos reservados                        #
# http://www.mosman.com.br/                                                        #
# mailto: mbm@mosman.com.br / mosman@mosman.com.br / suporte@mosman.com.br         #
####################################################################################

WorkDir: {saida}
Refresh: {refresh}
Interval: {intervalo}
WriteExpires: yes
Language: {lingua}
Options[_]: growright, nobanner, bits
Icondir: {icones}

<loop name="ips_disponiveis">
# {$username} ({$str_status})
#####################
Target[{dir}]: `{script} {$ipaddr}`
Directory[{dir}]: {dir}
MaxBytes[{dir}]: {maxbytes}
Title[{dir}]: Tráfego {$ipaddr} ({$username})
Unscaled[{dir}]: dwmy
PageTop[{dir}]: <H1>Análise de Tráfego Wireless</H1>
                   <TABLE>
                        <TR><TD>Sistema:</TD><TD>{$ipaddr} ({$username}) {local_link}</TD></TR>
                        <!--TR><TD>Responsável: </TD><TD>{responsavel_link}</TD></TR-->
                        <TR><TD>Interface:  </TD><TD>Wireless 802.11</TD></TR>
                        <TR><TD>Velocidade: </TD><TD>Medida em Kbps</TD></TR>
                        <TR><TD>Banda alocada: </TD><TD> {banda_alocada} </TD></TR>
                        <TR><TD>Status: </TD><TD> {$str_status} </TD></TR>
                   </TABLE>
Legend1[{dir}]: in
Legend2[{dir}]: out
Legend3[{dir}]: none
Legend4[{dir}]: none
LegendI[{dir}]: &nbsp;in:
LegendO[{dir}]: &nbsp;out:
</loop name="ips_disponiveis">


