<link href="estilo.css" rel="stylesheet" type="text/css" />
{literal}
<style type="text/css">

.style6 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
.style7 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #003399;
}

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
        <td align="center"><p><font face="arial" size="4"><img src="imagens/pop.gif" alt=" " width="400" height="50" /><br />
          </font><font face="arial" class="style6"><a href="{$smarty.server.PHP_SELF}?sessao=POP">voltar
          para lista de POPs </a> </font></p>
          <p class="style7">{$titulo} POP <br />
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
                        <input type="submit" name="Submit" value="...{$titulo}..." />
                        <input name="sessao" type="hidden" id="sessao" value="POP" />
                        <input name="acao" type="hidden" id="acao" value="alt" />
                        <input name="subsessao" type="hidden" id="subsessao" value="cadastro" />
                        <input name="id_pop" type="hidden" id="id_pop" value="{$id_pop}" />
                      </label></td>
                    </tr>
                  </table>
              </form></td>
            </tr>
          </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<br><br>
<div align="center">
  <p><br>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
