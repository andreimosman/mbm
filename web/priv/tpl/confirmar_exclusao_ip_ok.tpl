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
            <font face="arial" size="4">Exclus&atilde;o de IP </font><br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><font face="arial" size="2"><b>Exclus&atilde;o
                    realizada com sucesso !!!</b></font><br />
  <br />
  <font size="2" face="arial"> IP eliminado: <i>{$ip}</i> <br />
  <br />
A exclus&atilde;o eliminou automaticamente o seguinte cliente: </font>
  <ol>
    <font size="2" face="arial">
      <loop name="clientes"> </loop name="clientes">
      <loop name="clientes"></loop name="clientes">
      </font><font face="arial">
        <loop name="clientes"></loop name="clientes">
        </font>
  </ol>
  <ol>
    <font face="arial">
      <loop name="clientes">
      <li> <font size="2">{$username}</font> </li>
      </loop name="clientes">
      </font>
  </ol>
  <font size="2" face="arial"><br />
  <br />
  <a href="{$smarty.server.PHP_SELF}?sessao=listaIPs">voltar</a> </font> <font size="2" face="arial">&nbsp;</font> </td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
