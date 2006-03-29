{literal}
<style type="text/css">
<!--
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
          <p><br />
            <font face="arial" size="4">IP</font><br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><table width="600" border="0" cellspacing="5" cellpadding="0">
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
                                    <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{$smarty.server.PHP_SELF}?sessao=cadastroIP">Novo
                                          IP </a></font></td>
                                    <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">|</font></td>
                                    <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{$smarty.server.PHP_SELF}?sessao=listaIPs&amp;oper=tudo">Lista
                                          Completa </a></font></td>
                                    <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">|</font></td>
                                    <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{$smarty.server.PHP_SELF}?sessao=cadastroCliente">Habilitar
                                          Cliente </a></font></td>
                                    <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">|</font></td>
                                    <td align="center" valign="middle"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Listar
                                        Graficos</font> </td>
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
                              <td bgcolor="#D6E2EB"><form id="form1" name="form1" method="post" action="{$smarty.server.PHP_SELF}">
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
                                          <input type="hidden" name="oper" value="pesquisa" />
                                          <input type="hidden" name="SELF" value="{$smarty.server.PHP_SELF}" />
                                      </td>
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
                  <td align="center"><p align="center">{$mensagem}<br />
  {if $lista_ips && $lista_ips !=""} </p>
                      <table border="0" cellspacing="0" width="600" align="center">
                      <tr>
                        <td colspan="4" bgcolor="#D6E2EB" align="center"><font face="arial"><b>IP</b></font></td>
                        <td colspan="4" bgcolor="#B8CDDC" align="center"><font face="arial"><b>CLIENTE</b></font></td>
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
                      {foreach item=a from=$lista_ips}
                      <tr>
                        <td bgcolor="{$bgcolorI}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoIP&amp;ipaddr={$a.ipaddr}"><font face="arial" size="-1">{$a.ipaddr}</font></a></td>
                        <td bgcolor="{$bgcolorI}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoIP&amp;ipaddr={$a.ipaddr}"><font face="arial" size="-1" color="#FF0000"><b>{$a.banda_up}{$a.tp_up}<font color="008800">{$a.banda_alt_up}</font></b></a></td>
                        <td bgcolor="{$bgcolorI}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoIP&amp;ipaddr={$a.ipaddr}"><font face="arial" size="-1" color="#FF0000"><b>{$a.banda_down}{$a.tp_down}<font color="008800">{$a.banda_alt_down}</font></b></a></td>
                        <!-- Oper do IP -->
                        <td bgcolor="{$bgcolorI}"><a href="javascript:janelaEstatisticas('{$a.dir}');"><img src="imagens/estatisticas.gif" border="0" width="16" height="16" alt="[stats]" /></a>{$a.operI}</td>
                        <td bgcolor="{$bgcolorC}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoCliente&amp;username={$a.cliente}"><font face="arial" size="-1">{$a.cliente}</font></a></td>
                        <td bgcolor="{$bgcolorC}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoCliente&amp;username={$a.cliente}"><font face="arial" size="-1">{$a.mac}</font></a></td>
                        <td bgcolor="{$bgcolorC}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoCliente&amp;username={$a.cliente}"><font face="arial" size="-1" color="{$cor_status}">{$a.strstatus}</font></a><font face="arial" size="-1" color="{$a.cor_status}">{$a.st_nao_ativado}</font></td>
                        <!-- Oper do cliente -->
                        <td bgcolor="{$bgcolorC}">{$a.operC}</td>
                        <!--<td><a href="{$smarty.server.PHP_SELF}?sessao=excluirCliente&username={$a.cliente}"><img border="0" src="imagens/lixo.gif" width="15" height="16" alt="Excluir!!!"></a></td>-->
                      </tr>
                      {/foreach}
                    </table>
                    <font color="#FF0000" face="arial">{$nenhum}</font>
                    </center>
                    <br />
                    <br />
                  </td>
                </tr>
              </table>
                {/if}
<div align="center"></div></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
