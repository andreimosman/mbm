
{literal}
<style type="text/css">
<!--
.style10 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
}
.style13 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; }
-->
</style>

<style type="text/css">
<!--
.style5 {font-family: Arial, Helvetica, sans-serif; font-weight: bold; font-size: 12px; }
.style8 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
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
          <p><img src="imagens/relatorios.gif" alt=" " width="400" height="50" /><br />
            <br />
            <font face="arial" size="4">Gr&aacute;ficos de Consumo </font><br />
          </p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td bgcolor="#003366"><table width="350" border="0" cellspacing="1" cellpadding="0">
                      <tr>
                        <td align="center"><strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif">Escolha
                              o POP abaixo </font></strong></td>
                      </tr>
                      <tr>
                        <td align="center" valign="middle" bgcolor="#D6E2EB"><form id="form1" name="form1" method="post" action="{$smarty.server.PHP_SELF}">
                            <table width="350" border="0" cellspacing="1" cellpadding="0">
                              <tr>
                                <td width="325" align="center" valign="middle">
                                <select name="id_pop" >
                                  <option value="T">Todos</option>
								  {foreach item=id from=$pop}
                                  <option value="{$id.id_pop}">{$id.nome_pop}</option>
								  {/foreach}
								</select>
                                <input name="sessao" type="hidden" id="sessao" value="relatorio" />
                                <input name="tipo" type="hidden" id="tipo" value="grafico" />
                                <input type="hidden" name="SELF" value="{$smarty.server.PHP_SELF}" /></td>
                                <td width="90" align="center" valign="middle">
                                  <input type="submit" name="Submit" value="OK" />                                </td>
                              </tr>

                            </table>
                        </form></td>
                      </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td align="center">&nbsp;</td>
            </tr>
            <tr>
              <td align="center">
              
              {if $graf || $graf != "" }
			  <table width="300" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="200" bgcolor="#95AFBD"><span class="style10">Username</span></td>
                  <td width="100" bgcolor="#95AFBD"><span class="style10">Ip</span></td>
                </tr>

                <tr>
                  <td colspan="2">
				  {foreach item=a from=$graf}
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="200"><span class="style13">{$a.username}</span></td>
                      <td width="100"><span class="style13">{$a.ipaddr}</span></td>
                    </tr>
                    <tr>
                      <td height="1" colspan="2" bgcolor="#999999"></td>
                      </tr>
                  </table>
				  {/foreach}
				  </td>
                  </tr>
              </table>
			  {/if}
			  </td>
            </tr>
          </table>
          </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
