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
          <p><img src="imagens/clientes.gif" alt=" " width="400" height="50" /><br />
            <br />
          <font size="4" face="arial">Exclus&atilde;o</font>
          <br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><form method="post" action="{$smarty.server.PHP_SELF}" onsubmit="return confirm('Deseja realmente excluir este cliente?')">
                <input type="hidden" name="sessao" value="{$sessao}" />
                <input type="hidden" name="oper" value="confirma" />
                <input type="hidden" name="username" value="{$username}" />
                <font color="#CC0000" face="arial" size="2"> <b>Aten&ccedil;&atilde;o
                !!!</b></font><br />
                <br />
                <font face="arial" size="2"> Voc&ecirc; deseja realmente excluir
                o cliente <i>{$username}</i> ??? <br />
                <br />
                <br />
                <input type="hidden" name="confirma" value="excluir" />
                <input type="submit" name="submit" value="Confirmar Exclus&atilde;o de Cliente" />
              </form></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
