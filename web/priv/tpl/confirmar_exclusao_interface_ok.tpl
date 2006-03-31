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
              <td align="left"><font color="red" face="arial" size="2"><b>Exclus&atilde;o
                    realizada com sucesso !!!</b> </font><br />
  <br />
  <font size="2" face="arial"> Interface eliminada: <i>{$interface}</i> <br />
  <br />
  <br />
A exclus&atilde;o da interface (<i>{$interface}</i>) eliminou automaticamente
os seguintes clientes: </font>
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
  <font size="2" face="arial">A exclus&atilde;o da interface eliminou automaticamente
  os seguintes IPs: </font>
  <ol>
    <font size="2" face="arial">
      <loop name="ips"> </loop name="ips">
      <loop name="ips"></loop name="ips">
      </font><font face="arial">
        <loop name="ips"></loop name="ips">
        </font>
  </ol>
  <ol>
    <font face="arial">
      <loop name="ips">
      <li> <font size="2">{$ipaddr}</font> </li>
      </loop name="ips">
      </font>
  </ol>
  <div align="center"><font size="2" face="arial"><br />
        <br />
      <a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces">voltar</a> </font> <font size="2" face="arial"></font> </div></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
