<style type="text/css">
{literal}
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
{/literal}
</style>
<link href="estilo.css" rel="stylesheet" type="text/css" />

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="209"><img src="imagens/logo.gif" width="209" height="45" /></td>
            <td align="center" valign="bottom" background="imagens/fundo_top.gif"><img src="imagens/titulo.gif" width="214" height="26" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="100%" align="center" valign="middle"><form method="post" action="{$smarty.server.PHP_SELF}">
          <br />
          <br />
          <p align="center"><font face="arial" size="-1" color="#FF0000">{$sErro}</font> </p>
          <table width="200" border="0" align="center">
            <tr>
              <td colspan="2" bgcolor="#FFFFFF"><img src="imagens/login.gif" width="250" height="30" /></td>
            </tr>
            <tr>
              <td align="right"><font face="arial" size="-1">username:</font></td>
              <td><input name="login" type="text" value="{$login}" size="30" /></td>
            </tr>
            <tr>
              <td align="right"><font face="arial" size="-1">senha:</font></td>
              <td><input name="senha" type="password" size="30" /></td>
            </tr>
            <tr>
              <td align="right">&nbsp;</td>
              <td><input type="submit" name="sessao" value="login" /></td>
            </tr>
          </table>
        </form>
          <br />
          <br />
          </p></td>
      </tr>
    </table></td>
  </tr>
</table>
