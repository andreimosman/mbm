{literal}
<style type="text/css">
<!--
.style7 {font-family: Arial, Helvetica, sans-serif}
.style9 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
}
-->
</style>

<style type="text/css">
<!--
.style5 {font-size: 12px; font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
.style7 {font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif; }
-->
</style>

<style type="text/css">
<!--
.style5 {	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style6 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
-->
</style>

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
            <font face="arial" size="4">ARP<br />
            </font></p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><form action="{$smarty.server.PHP_SELF}" method="get" >
                <input type="hidden" name="sessao" value="relatorio" />
				<input type="hidden" name="tipo" value="arp" />
                <p><span class="style9">IP:</span>
                  <input type="text" name="ip" value="{$ip}"  />
                    <input type="submit" name="Submit" value="Ok"  />
                    <br />
                    <font color="#666666" size="1" face="Verdana, Arial, Helvetica, sans-serif">digite <strong>-a</strong> para
                    listar toda a tabela arp</font></p>
              </form>
                {if count($arp)}
                <p align="center"><font size="2"><big><strong>{if $ip=="-a"}<font face="Arial, Helvetica, sans-serif" size="4" color="#000000">
                      TABELA ARP</font>{else}{$ip}{/if}
                        </string>
                </big></font></p>
                <table border="0" width="400">
                  <tr bgcolor="#F1F1F1">
                    <td bgcolor="#95AFBD"><span class="style5">IP</span></td>
                    <td bgcolor="#95AFBD"><span class="style5">MAC</span></td>
                    <td bgcolor="#95AFBD"><span class="style5">IFACE</span></td>
                  </tr>
                  {foreach item=v from=$arp}
  <tr>
    <td><p class="style7">{$v.addr}</p></td>
    <td><p class="style7">{$v.mac}</p></td>
    <td><p class="style7">{$v.iface}</p></td>
  </tr>
                  {/foreach}
                </table>
                {else} {if $ip} <br />
				  		<br />
				  		<p align="center"></p>
				  		<font size="1" color="#FF0000"><big><strong>
				  		<p>sem resposta para ip</p>
				  		{$ip}
				  		</string>
				  		</big></font>
				  		</p>
{/if} {/if}</td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
