{literal}
<style type="text/css">
<!--
.style1 {font-size: 12px; color: #FFFFFF}
.style4 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}

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
            <font face="arial" size="4"><img src="imagens/pop.gif" width="400" height="50" /><br />
            </font><a href="{$smarty.server.PHP_SELF}?sessao=POP&amp;subsessao=cadastro">Cadastrar Novo</a> <br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><table width="600" border="0" cellspacing="5" cellpadding="0">
                <tr>
                  <td align="center"><table border="0" cellspacing="0" width="600" align="center">
                      <tr bgcolor="#AAAAAA">
                        <td width="490" bgcolor="#003366">&nbsp;</td>
                        <td width="106" bgcolor="#003366"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>A&ccedil;&otilde;es</b></font></div></td>
                      </tr>
                      <tr>
                        <td colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td> {foreach item=a from=$ls_pop}
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td height="30" valign="middle"><span class="style1">{$a.id_pop}
                                          - <strong>{$a.nome_pop}</strong></span></td>
                                      <td width="53" height="30" align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=POP&amp;subsessao=cadastro&amp;id_pop={$a.id_pop}"><img src="imagens/gif_alterar.gif" alt="." width="16" height="16" border="0" /></a></td>
                                      <td width="53" height="30" align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=POP&amp;subsessao=excluir&amp;id_pop={$a.id_pop}" onclick="return confirm('Deseja realmente excluir este POP?')"><img src="imagens/lixeira.gif" alt="." width="16" height="16" border="0" /></a></td>
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
                <div align="center"></div></td></tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
