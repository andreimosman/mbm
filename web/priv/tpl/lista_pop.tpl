<link href="estilo.css" rel="stylesheet" type="text/css" />
{literal}
<style type="text/css">

.style5 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style6 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}

</style>
{/literal}
<br><br>
<div align="center">
  <p><br>
      <font face="arial" size="4">POPs<br />
    </font><span class="style6"><font face="arial"><a href="{$smarty.server.PHP_SELF}?sessao=POP&subsessao=cadastro">Cadastrar Novo</a></font></span> </p>
  <br />
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
          <td>


          {foreach item=a from=$ls_pop}
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="middle"><span class="style6">{$a.id_pop} -
                  <strong>{$a.nome_pop}</strong></span></td>
              <td width="53" height="30" align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=POP&subsessao=cadastro&id_pop={$a.id_pop}"><img src="imagens/gif_alterar.gif" width="16" height="16" border="0" /></a></td>
              <td width="53" height="30" align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=POP&subsessao=excluir&id_pop={$a.id_pop}" onClick="return confirm('Deseja realmente excluir este POP?')"><img src="imagens/lixeira.gif" width="16" height="16" border="0" /></a></td>
            </tr>
            <tr>
              <td colspan="3" bgcolor="#999999"><img src="imagens/pixel.gif" width="1" height="1" /></td>
              </tr>
          </table>
		  {/foreach}

		  </td>
          </tr>
      </table></td>
    </tr>

  </table>
  <br><br>	  </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
