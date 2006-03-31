{literal}
<style type="text/css">
<!--
.style6 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
.style7 {	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #003399;
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
              <font face="arial" size="4"><img src="imagens/pop.gif" alt=" " width="400" height="50" /><br />
              </font><font face="arial" class="style6"><a href="{$smarty.server.PHP_SELF}?sessao=POP">voltar
              para lista de POPs </a> </font></p>
          <p class="style7">{$msg} POP <br />
          </p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><form id="form1" name="form1" method="post" action="{$smarty.server.PHP_SELF}">
                  <table width="247" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                      <td width="79" class="style6"><div align="right">Nome do
                          POP </div></td>
                      <td width="154"><label>
                        <input name="nome_pop" type="text" id="nome_pop" value="{$nome_pop}" />
                      </label></td>
                    </tr>
                    <tr>
                      <td colspan="2" align="center"><label>
                        <input type="submit" name="Submit" value="...{$msg}..." />
                        <input name="sessao" type="hidden" id="sessao" value="POP" />
                        <input name="acao" type="hidden" id="acao" value="cad" />
                        <input name="subsessao" type="hidden" id="subsessao" value="cadastro" />
                      </label></td>
                    </tr>
                  </table>
              </form></td>
            </tr>
          </table>
          <p></p>
        </center>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
