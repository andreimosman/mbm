{literal}
<style type="text/css">
<!--
.style2 {font-size: 10px}
-->
</style>

<style type="text/css">
<!--
.style3 {font-size: 10px}
.style5 {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>

<style type="text/css">
<!--
.style1 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

.style3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }

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
              <img src="imagens/interfaces2.gif" alt=" " width="400" height="50" /><br />
          <font size="4" face="arial">Cadastro de IP <br />
          </font><font face="arial"><span class="style5">Interface: 
          {$interface} </span></font>
          <br />
          <font face="verdana" color="black" size="2">Caso entre no campo ip os bits de rede (ex: /30)<br>
          deixe o campo mascara
          em branco.</font></p>
          <form action="{$smarty.server.PHP_SELF}" method="post" name="form" id="form">
            <div align="center">
              <input name="oper" type="hidden" id="oper" value="cadastrar" />
              <input type="hidden" name="sessao" value="{$sessao}" />
              <input name="interface" type="hidden" id="interface" value="{$interface}" />
              <font face="arial" size="-1" color="#000099"><b>{$mensagem}</b></font>
              <font face="arial" size="-1" color="red"><b>{$erro}</b></font>
              <table border="0" width="400">
                <tr>
                  <td><font face="arial" size="-1"><b>IP:</b></font></td>
                  <td align="left"><span class="style3">
                    <input name="ipaddr" type="text" id="ipaddr" value="{$ipaddr}" size="25" />
                    ex. 192.168.0.1 </span></td>
                </tr>
                <tr>
                  <td><strong><font size="-1" face="arial">M&aacute;scara:</font></strong></td>
                  <td align="left"><span class="style3">
                    <input name="mascara" type="text" id="mascara" value="{$mascara}" size="25" />
                    ex. 255.255.255.0 </span></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="left"><input type="submit" name="submit" value="Cadastrar" /></td>
                </tr>
              </table>
            </div>
          </form>
          <p><a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces">voltar</a></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
