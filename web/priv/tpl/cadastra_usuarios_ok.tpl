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
            <font face="arial" size="4"><img src="imagens/admin.gif" alt=" " width="400" height="50" /><br />
            </font><font face="arial" class="style6">{if !$priv || $priv=="sim"}<a href="{$smarty.server.PHP_SELF}?sessao=Admin&amp;oper=admin">voltar
            para lista</a>{/if}</font><br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><span class="style7">{$mensagem}</span></td>
            </tr>
          </table>
          <p></p>
        </center>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
