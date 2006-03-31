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
          <p><img src="imagens/interfaces2.gif" alt=" " width="400" height="50" /><br />
            <br />
          <font size="4" face="arial">Exclus&atilde;o</font>
          <br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="left"><form method="post" action="{$smarty.server.PHP_SELF}" onsubmit="return confirm('Deseja realmente excluir esta Interface e todos os clientes anexados nela?')">
                <input type="hidden" name="sessao" value="{$sessao}" />
                <input type="hidden" name="oper" value="confirma" />
                <input type="hidden" name="interface" value="{$interface}" />
                <font face="Arial" size="2"> <b>Aten&ccedil;&atilde;o !!!</b><br />
                <br />
                  A exclus&atilde;o da interface (<i>{$interface}</i>) ir&aacute; eliminar
                  automaticamente os seguintes clientes: </font>
                <ol>
                  <loop name="clientes">
                    <li><font size="2" face="Arial">{$username}</font></li>
                  </loop name="clientes">
                </ol>
                <font size="2" face="Arial">A exclus&atilde;o da interface ir&aacute; eliminar
                automaticamente os seguintes IPs: </font>
                <ol>
                  <loop name="ips">
                    <li><font size="2" face="Arial">{$ipaddr}</font></li>
                  </loop name="ips">
                </ol>
                <div align="center"><br />
                    <input type="hidden" name="confirma" value="excluir" />
                    <input type="submit" name="submit" value="Confirmar Exclus&atilde;o de Interface" />
                  </div>
              </form>
                <div align="center"><br />
                    <br />
                    <a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces">voltar</a> </font> </div></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
