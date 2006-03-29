{literal}
<style type="text/css">
<!--
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #000000;
}

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
          <font size="4" face="arial">IP na Interface {$interface} </font>
          <br />
          <a href="{$smarty.server.PHP_SELF}?sessao=configurarIPinterface&amp;interface=rl1&amp;oper=cadastrar">Adicionar novo IP</a> <br />
          </p>
		  {foreach item=a from=$ips}
          <table width="400" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <td width="370"><span class="style2">{$a.ipaddr}</span></td>
              <td width="30" align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=configurarIPinterface&oper=excluiIpInterface&net={$a.ipaddr}&interface={$interface}" onclick="return confirm('Você tem certeza que quer excluir este IP da interface?')"><img src="imagens/lixeira.gif" width="16" height="16" border="0" /></a></td>
            </tr>
            <tr>
              <td colspan="2" bgcolor="#999999"><img src="imagens/pixel.gif" width="150" height="1" /></td>
              </tr>
          </table>
		  {/foreach}
          <p>&nbsp; </p>
          <p><a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces">voltar</a></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
