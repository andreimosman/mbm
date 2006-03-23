<script language="JavaScript">
<!--
   function janelaEstatisticas(ip) {
      url="{mrtgweb}/"+ip+"/"+ip+".html";
      window.open(url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=1,resizable=1,width=550,height=480');
   }
//-->
</script>
<br><br><!--hr size=1 width="500" color="#000000" align="left">
<a href="http://mbm.srv.imp.aeronet.com.br/estatisticas/gateway/172.16.1.2_1.html"><font face="arial" size="4"><b>Estatisticas</b></a><br></font>
<img src="http://mbm.srv.imp.aeronet.com.br/estatisticas/gateway/172.16.1.2_1-day.png"<br-->
<div align="center">
  <p><br>
      <font face="arial" size="4"><b>IPs</font></p>
  <table width="600" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <td width="352"><table width="350" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td bgcolor="#003366"><table width="350" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td align="center"><strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif">Op&ccedil;&otilde;es</font></strong></td>
              </tr>
              <tr>
                <td bgcolor="#D6E2EB"><table width="350" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{SELF}?sessao=cadastroIP">Novo
                            IP </a></font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">|</font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{SELF}?sessao=listaIPs">Lista
                            Completa </a></font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">|</font></td>
                      <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{SELF}?sessao=habilitarCliente">Habilitar
                            Cliente </a></font></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table>
        <p>&nbsp;</p>
        <table width="350" border="0" cellspacing="0" cellpadding="0">
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
                                  <input name="cond" type="radio" value="username" checked="checked" />
                                  </label>
                                </font></td>
                                <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">por
                                    Username</font></td>
                                <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                  <input type="radio" name="cond" value="ip" />
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
        </table>
      <p></p></td>
      <td width="245" align="center" valign="middle"><table border="0">
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
      </table></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  </div>
