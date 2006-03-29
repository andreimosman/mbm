
{literal}
<style type="text/css">
<!--
.style1 {color: #003399}
.style2 {color: #CC0000}
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
            <font face="arial" size="4">Suporte PPPoE </font><br />
</p>
          <table border="0" cellspacing="1" width="500" height="200" align="center" bgcolor="#00000">
            <tr height="100%">
              <td><table border="0" width="500" height="100%" bgcolor="#FFFFFF">
                  <tr height="100%">
                    <td width="100%" height="100%" valign="top"><font face="arial" size="+1" color="green"><b></font><font face="arial" size="+1"><span class="style1">USU&Aacute;RIOS
                        ONLINE</span></font><font face="arial" size="+1" color="green"><b></font>
                        <hr size="1" />
                        <iframe src="{$smarty.server.PHP_SELF}?sessao=suporte&amp;subsessao=online" name="online" width="100%" height="180" id="online"></iframe></td>
                  </tr>
              </table></td>
            </tr>
          </table>
          <hr size="1" width="500" color="#000000" align="center" />
          <table border="0" cellspacing="1" width="500" height="200" align="center" bgcolor="#00000">
            <tr>
              <td><table border="0" width="500" height="100%" bgcolor="#FFFFFF">
                  <tr height="100%">
                    <td width="100%" height="100%" valign="top"><font face="arial" size="+1" color="red"><b></font><font face="arial" size="+1"><span class="style2">USU&Aacute;RIOS
                        SEM CONEX&Atilde;O<b></span></font>
                        <hr size="1" />
                        <iframe src="{$smarty.server.PHP_SELF}?sessao=suporte&amp;subsessao=semcon" name="online" width="100%" height="180" id="online"></iframe></td>
                  </tr>
              </table></td>
            </tr>
          </table>
          <p></p>
        </center>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
