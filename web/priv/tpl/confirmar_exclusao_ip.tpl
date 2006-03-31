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
          <p><img src="imagens/ip2.gif" width="400" height="50" /><br />
            <br />
            <font face="arial" size="4">Exclus&atilde;o</font><br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><form method="post" action="{$smarty.server.PHP_SELF}" onsubmit="return confirm('Confirma a exclus&atilde;o do IP e do cliente anexado?')">
                <input type="hidden" name="sessao" value="{$sessao}" />
                <input type="hidden" name="oper" value="confirma" />
                <input type="hidden" name="ip" value="{$ip}" />
                <font color="red" face="arial" size="2"> <b>Aten&ccedil;&atilde;o
                !!!</b> </font> <br />
                      <br />
                      <font face="arial" size="2"> A remo&ccedil;&atilde;o do
                      IP (<i>{$ip}</i>) implicar&aacute; na exclus&atilde;o autom&aacute;tica
                      do seguinte cliente:
                    <ol>
                      <loop name="clientes">
                        <li>{$username}</li>
                      </loop name="clientes">
                    </ol>
                    <br />
                    <br />
                    <br />
                    <input type="hidden" name="confirma" value="excluir" />
                    <input type="submit" name="submit" value="Confirma Exclus&atilde;o do IP" />


                            </form></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
