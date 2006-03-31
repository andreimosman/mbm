{literal}
<style type="text/css">
<!--
.style5 {	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style6 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
-->
</style>

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
            <font face="arial" size="4"><img src="imagens/admin.gif" width="400" height="50" /><br />
            </font><a href="{$smarty.server.PHP_SELF}?sessao=Admin&amp;oper=admin&amp;subsessao=cadastrar">Cadastrar Novo</a> <font face="arial" size="4"><br />
            </font></p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><table border="0" cellspacing="0" width="600" align="center">
                  <tr bgcolor="#AAAAAA">
                    <td width="490" bgcolor="#D6E2EB">&nbsp;</td>
                    <td width="106" bgcolor="#ACC5D7"><div align="center" class="style5">A&ccedil;&otilde;es</div></td>
                  </tr>
                  <tr>
                    <td colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td> {foreach item=a from=$ls_usuarios}
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="30" valign="middle"><span class="style6">{$a.uid} - <strong>{$a.login}</strong> - <i>{if
                                      $a.tipo_conta == "/"}Administrador{/if}{if
                                      $a.tipo_conta == "U"}Usuário{/if}</i></span></td>
                                  <td width="53" height="30" align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=Admin&amp;oper=admin&amp;subsessao=cadastrar&amp;login={$a.login}"><img src="imagens/gif_alterar.gif" alt="." width="16" height="16" border="0" /></a></td>
                                  <td width="53" height="30" align="center" valign="middle">{if $a.uid != "1"}<a href="{$smarty.server.PHP_SELF}?sessao=Admin&amp;oper=excluir&amp;uid={$a.uid}" onclick="return confirm('Deseja realmente excluir o usu&aacute;rio {$a.login}?')"><img src="imagens/lixeira.gif" alt="." width="16" height="16" border="0" /></a>{/if}</td>
                                </tr>
                                <tr>
                                  <td colspan="3" bgcolor="#999999"><img src="imagens/pixel.gif" alt="." width="1" height="1" /></td>
                                </tr>
                              </table>
                            {/foreach} </td>
                        </tr>
                    </table></td>
                  </tr>
                </table>
                  <br />
                <br />
              </td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
