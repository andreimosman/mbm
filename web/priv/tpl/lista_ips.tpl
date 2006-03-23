<!--
<script language="JavaScript">

<table border="0">
        <tr>
          <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Clientes Ativos:</font></td>
          <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">{clientes_ativos}</font></td>
        </tr>
        <tr>
          <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Clientes Bloqueados:</font></td>
          <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">{clientes_bloqueados}</font></td>
        </tr>
        <tr>
          <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">IPs Disponiveis:</font></td>
          <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">{ips_disponiveis}</font></td>
        </tr>
        <tr>
          <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">IPs Cadastrados:</font></td>
          <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">{ips_cadastrados}</font></td>
        </tr>
      </table>

   function janelaEstatisticas(ip) {
      url="{mrtgweb}/"+ip+"/"+ip+".html";
      window.open(url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=1,resizable=1,width=550,height=480');
   }

</script>
//-->
<link href="estilo.css" rel="stylesheet" type="text/css" />

<br><br><!--hr size=1 width="500" color="#000000" align="left">
<a href="http://mbm.srv.imp.aeronet.com.br/estatisticas/gateway/172.16.1.2_1.html"><font face="arial" size="4"><b>Estatisticas</b></a><br></font>
<img src="http://mbm.srv.imp.aeronet.com.br/estatisticas/gateway/172.16.1.2_1-day.png"<br-->
<div align="center">
  <p><br>
      <font face="arial" size="4"><b>IPs</font></p>
  <br />
  <table width="600" border="0" cellspacing="5" cellpadding="0">
    <tr>
      <td align="center"><table width="450" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td bgcolor="#003366"><table width="450" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td align="center"><strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif">Op&ccedil;&otilde;es</font></strong></td>
              </tr>
              <tr>
                <td bgcolor="#D6E2EB"><table width="450" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{SELF}?sessao=cadastroIP">Novo
                            IP </a></font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">|</font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{SELF}?sessao=listaIPs&amp;oper=tudo">Lista
                            Completa </a></font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">|</font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{SELF}?sessao=cadastroCliente">Habilitar
                            Cliente </a></font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">|</font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Listar Graficos</font> </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center"><table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td bgcolor="#003366"><table width="350" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td align="center"><strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif">Pesquisa</font></strong></td>
              </tr>
              <tr>
                <td bgcolor="#D6E2EB"><form id="form1" name="form1" method="post" action="{SELF}">
                    <table width="350" border="0" cellspacing="1" cellpadding="0">
                      <tr>
                        <td width="325" align="center" valign="middle"><label>
                          <input name="chave" type="text" id="chave" size="40" />
                        </label></td>
                        <td width="90" align="center" valign="middle"><label>
                          <input type="submit" name="Submit" value="OK" />
                        </label></td>
                      </tr>
                      <tr>
                        <td align="center" valign="middle"><table width="200">
                            <tr>
                              <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                <label>
                                <input name="cond" type="radio" value="username" class="checkbox" checked="checked" />
                                </label>
                              </font></td>
                              <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">por
                                  Username</font></td>
                              <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                <input type="radio" name="cond" value="ip" class="checkbox"/>
                              </font></td>
                              <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">por
                                  IP</font></td>
                            </tr>
                        </table></td>
                        <td width="90" align="center" valign="middle"><input name="sessao" type="hidden" id="sessao" value="listaIPs" />
                            <input type="hidden" name="oper" value="pesquisa" /></td>
                      </tr>
                    </table>
                </form></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">
	    <p align=center>{mensagem}</p><br>

  <table border="0" cellspacing="0" width="600" align="center">
    <tr>
      <td colspan=4 bgcolor="#D6E2EB" align="center"><font face="arial"><b>IP</b></font></td>
      <td colspan=4 bgcolor="#B8CDDC" align="center"><font face="arial"><b>CLIENTE</b></font></td>
    </tr>
    <tr bgcolor="#AAAAAA">
      <td bgcolor="#D6E2EB"><font face="arial" size="-1"><b>IP</b></font></td>
      <td bgcolor="#D6E2EB"><font face="arial" size="-1"><b>UP</b></font></td>
      <td bgcolor="#D6E2EB"><font face="arial" size="-1"><b>DOWN</b></font></td>
      <td bgcolor="#D6E2EB"><font face="arial" size="-1"><b>&nbsp;</b></font></td>
      <td bgcolor="#B8CDDC"><font face="arial" size="-1"><b>USER</b></font></td>
      <td bgcolor="#B8CDDC"><font face="arial" size="-1"><b>MAC</b></font></td>
      <td bgcolor="#B8CDDC"><font face="arial" size="-1"><b>STATUS</b></font></td>
      <td bgcolor="#B8CDDC"><font face="arial" size="-1"><b>&nbsp;</b></font></td>
    </tr>
    <loop name="lista_IPs">
    <tr>
      <td bgcolor="{bgcolorI}"><a href="{SELF}?sessao=alteracaoIP&ipaddr={ipaddr}"><font face="arial" size="-1">{ipaddr}</font></a></td>
      <td bgcolor="{bgcolorI}"><a href="{SELF}?sessao=alteracaoIP&ipaddr={ipaddr}"><font face="arial" size="-1" color="#FF0000"><b>{banda_up}{tp_up}<font color="008800">{banda_alt_up}</font></b></a></td>
      <td bgcolor="{bgcolorI}"><a href="{SELF}?sessao=alteracaoIP&ipaddr={ipaddr}"><font face="arial" size="-1" color="#FF0000"><b>{banda_down}{tp_down}<font color="008800">{banda_alt_down}</font></b></a></td>
      <!-- Oper do IP -->
      <td bgcolor="{bgcolorI}"><a href="javascript:janelaEstatisticas('{dir}');"><img src="imagens/estatisticas.gif" border=0 width="16" height="16" ALT="[stats]"></a>{operI}</td>
      <td bgcolor="{bgcolorC}"><a href="{SELF}?sessao=alteracaoCliente&username={cliente}"><font face="arial" size="-1">{cliente}</font></a></td>
      <td bgcolor="{bgcolorC}"><a href="{SELF}?sessao=alteracaoCliente&username={cliente}"><font face="arial" size="-1">{mac}</font></a></td>
      <td bgcolor="{bgcolorC}"><a href="{SELF}?sessao=alteracaoCliente&username={cliente}"><font face="arial" size="-1" color="{cor_status}">{strstatus}</font></a><font face="arial" size="-1" color="{cor_status}">{st_nao_ativado}</font></td>
      <!-- Oper do cliente -->
      <td bgcolor="{bgcolorC}">{operC}</td>
      <!--<td><a href="{SELF}?sessao=excluirCliente&username={cliente}"><img border="0" src="imagens/lixo.gif" width="15" height="16" alt="Excluir!!!"></a></td>-->
    </tr>
    {lynx_hr} </loop name="lista_IPs">
  </table>
  <font color="#FF0000" face="arial">{nenhum}</font> </center><br><br>
	  </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
