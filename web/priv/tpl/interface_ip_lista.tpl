{literal}
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>

<style type="text/css">
<!--
.style1 {
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #FFFFFF;
	font-weight: bold;
}
.style2 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style3 {color: #000000}

.style2 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style3 {font-size: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; }

.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #000000;
}

.style1 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

.style3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
{/literal}
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="148" align="left" valign="top">{include file ='menu_left.tpl'}</td>
    <td align="center" valign="middle"><table width="600" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><center>
          <p><img src="imagens/interfaces2.gif" alt=" " width="400" height="50" /></p>
          <table width="550" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <td align="center" valign="top"><table width="300" border="0" cellpadding="0" cellspacing="0" bgcolor="#003366">
                <tr>
                  <td><table width="300" border="0" cellspacing="1" cellpadding="0">
                    <tr>
                      <td bgcolor="#FFFFFF"><table width="300" border="0" cellspacing="2" cellpadding="0">
                        <tr>
                          <td align="right"><span class="style3">Interface:</span></td>
                          <td><span class="style3">{$interface}</span></td>
                        </tr>
                        <tr>
                          <td width="86" align="right"><span class="style3">Tipo:</span></td>
                          <td width="211"><span class="style3">{if $tipo_interface
                              == "I"}INTERNA{/if}{if $tipo_interface
                              == "E"}EXTERNA{/if}</span></td>
                        </tr>
                        <tr>
                          <td align="right"><span class="style3">NAT:</span></td>
                          <td><span class="style3">{if $nat == "t"}Habilitado{/if}{if
                              $nat == "f"}Desabilitado{/if}</span></td>
                        </tr>
                        <tr>
                          <td align="right"><span class="style3">Obs:</span></td>
                          <td><span class="style3">{$observacao}</span></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td align="center" valign="top">&nbsp;</td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <table width="450" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td bgcolor="#95AFBD"><table width="450" border="0" cellpadding="5" cellspacing="0" id="barra">
                <tr>
                  <td width="279" bgcolor="#000066"><FONT face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Endere&ccedil;os IP</b></FONT> </td>
                  <td width="151" align="center" bgcolor="#000066"><FONT face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">[<a href="{$smarty.server.PHP_SELF}?sessao=configurarIPinterface&amp;interface={$interface}&amp;oper=cadastrar">Cadastrar IP</a>]</FONT></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" bgcolor="#FFFFFF">{foreach item=a from=$ips}
                <table width="400" border="0" cellspacing="1" cellpadding="0">
                  <tr>
                    <td width="184"><span class="style2">{$a.ipaddr}</span></td>
                    <td width="185"><span class="style2">{$a.netmask}</span></td>
                    <td width="30" align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=configurarIPinterface&amp;oper=excluiIpInterface&amp;net={$a.ipaddr}&amp;interface={$interface}" onclick="return confirm('Voc&ecirc; tem certeza que quer excluir este IP da interface?')"><img src="imagens/lixeira.gif" alt="." width="16" height="16" border="0" /></a></td>
                  </tr>
                  <tr>
                    <td colspan="3" bgcolor="#999999"><img src="imagens/pixel.gif" alt="." width="150" height="1" /></td>
                  </tr>
                </table>
                {/foreach} </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <table width="450" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td bgcolor="#000066"><table width="450" border="0" cellpadding="5" cellspacing="0" id="menuTop">
                  <tr>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Informa&ccedil;&otilde;es
                          do Sistema Operacional </b></font></td>
                    </tr>
              </table></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp; </p>
          <p><a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces">voltar</a></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
