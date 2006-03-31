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
          <font size="4" face="arial"><img src="imagens/ip2.gif" width="400" height="50" /></font>
          <br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><form action="{$smarty.server.PHP_SELF}" method="post" name="form" id="form" onsubmit="return checaFormulario();">
                <div align="center">
                  <input type="hidden" name="sessao" value="{$sessao}" />
                  <input type="hidden" name="oper" value="{$oper}" />
                  <input type="hidden" name="ip_orig" value="{$ip_orig}" />
                  <font face="arial" size="-1" color="#990000"><b>{$sErro}</b></font> <font face="arial" size="-1" color="#000066"><b>{$sMensagem}</b></font>
                  <table border="0" width="500" cellpadding="1" bgcolor="#000000">
                    <tr bgcolor="#ffffff">
                      <td><font face="arial" size="-1"><b>IP ($host/net):</b></font>
                          <input type="text" name="ipaddr" value="{$ipaddr}" maxlength="18" />
                      </td>
                    </tr>
                    <tr brcolor="#FFFFF">
                      <td><table border="1" cellspacing="0" width="100%" bgcolor="#000000">
                          <tr bgcolor="#990000" align="center">
                            <td colspan="2" bgcolor="#003366"><font color="#FFFFFF" size="-1" face="arial"><b> --
                                  BANDA EM HOR&Aacute;RIO COMERCIAL -- </b></font></td>
                          </tr>
                          <tr bgcolor="#A0A0A0" align="center">
                            <td width="50%" bgcolor="#EEEEEE"><font face="arial" size="-1"><b>UPLOAD</b></td>
                            <td width="50%" bgcolor="#EEEEEE"><font face="arial" size="-1"><b>DOWNLOAD</b></td>
                          </tr>
                          <tr>
                            <td><table border="0" bgcolor="#ffffff" width="100%">
                                <tr>
                                  <td><font face="arial" size="-1"><b>Int:</b></font></td>
                                  <td align="left">{$ife_select}</td>
                                </tr>
                                <tr>
                                  <td><font face="arial" size="-1"><b>Banda:</b></font></td>
                                  <td align="left"><input type="text" size="4" name="banda_up" value="{$banda_up}" />
                                    {$tp_bu_select}</td>
                                </tr>
                            </table></td>
                            <td><table border="0" bgcolor="#ffffff" width="100%">
                                <tr>
                                  <td><font face="arial" size="-1"><b>Int:</b></font></td>
                                  <td align="left">{$ifi_select}</td>
                                </tr>
                                <tr>
                                  <td><font face="arial" size="-1"><b>Banda:</b></font></td>
                                  <td align="left"><input type="text" size="4" name="banda_down" value="{$banda_down}" />
                                    {$tp_bd_select}</td>
                                </tr>
                            </table></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr brcolor="#FFFFF">
                      <td><table border="1" cellspacing="0" width="100%" bgcolor="#000000">
                          <tr bgcolor="#009900" align="center">
                            <td colspan="2" bgcolor="#95AFBD"><font color="#FFFFFF" size="-1" face="arial"><b> --
                                  BANDA FORA DO HOR&Aacute;RIO COMERCIAL (OPCIONAL)
                                  -- </b></font></td>
                          </tr>
                          <tr bgcolor="#A0A0A0" align="center">
                            <td width="50%" bgcolor="#EEEEEE"><font face="arial" size="-1"><b>UPLOAD</b></td>
                            <td width="50%" bgcolor="#EEEEEE"><font face="arial" size="-1"><b>DOWNLOAD</b></td>
                          </tr>
                          <tr>
                            <td><table border="0" bgcolor="#ffffff" width="100%">
                                <tr>
                                  <td><font face="arial" size="-1"><b>Banda:</b></font></td>
                                  <td align="left"><input type="text" size="4" name="banda_up_alt" value="{$banda_up_alt}" />
                                    {$tp_bua_select}</td>
                                </tr>
                            </table></td>
                            <td><table border="0" bgcolor="#ffffff" width="100%">
                                <tr>
                                  <td><font face="arial" size="-1"><b>Banda:</b></font></td>
                                  <td align="left"><input type="text" size="4" name="banda_down_alt" value="{$banda_down_alt}" />
                                    {$tp_bda_select}</td>
                                </tr>
                            </table></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr align="center" bgcolor="#FFFFFF">
                      <td><input type="submit" name="submit" value="{$submit}" />
                      </td>
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
