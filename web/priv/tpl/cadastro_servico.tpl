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
          <font size="4" face="arial">Servi&ccedil;o</font>
          <br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><form action="{$smarty.server.PHP_SELF}" method="post" name="form" id="form" onsubmit="return checaFormulario();">
                <div align="center">
                  <input type="hidden" name="sessao" value="{$sessao}" />
                  <input type="hidden" name="oper" value="{$oper}" />
                  <input type="hidden" name="sv_orig" value="{$sv_orig}" />
                  <input type="hidden" name="pt_orig" value="{$pt_orig}" />
                  <font face="arial" size="-1" color="#FF0000"><b>{$sErro}</b></font> <font face="arial" size="-1" color="#0000FF"><b>{$sMensagem}</b></font>
                  <table border="0">
                    <tr>
                      <td><font face="arial" size="-1"><b>Servico:</b></font></td>
                      <td align="left"><input type="text" name="servico" value="{$servico}" maxlength="15" /></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Porta:</b></font></td>
                      <td align="left"><input type="text" name="porta" value="{$porta}" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td align="left"><input type="submit" name="submit" value="{$submit}" /></td>
                    </tr>
                  </table>
                </div>
              </form></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
