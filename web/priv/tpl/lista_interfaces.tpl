{literal}
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
.style2 {color: #FFFFFF}
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
            <br />
              <img src="imagens/interfaces2.gif" alt=" " width="400" height="50" />              <br />
            <a href="{$smarty.server.PHP_SELF}?sessao=cadastroInterface"><font face="arial" size="-1">para
            cadastrar uma interface clique aqui</font></a></p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><div align="center"><a href="{$smarty.server.PHP_SELF}?sessao=cadastroInterface"></a> </div>
                <div align="center">
                  <table width="500" border="0" cellpadding="2" cellspacing="1">
                    <tr bgcolor="#AAAAAA">
                      <td bgcolor="#003366"><strong><font face="arial" color="white" size="2">Interface</font></strong></td>
                      <td bgcolor="#003366"><strong><font face="arial" color="white" size="2">E/S</font></strong></td>
                      <td bgcolor="#003366"><strong><font face="arial" color="white" size="2">Banda</font></strong></td>
                      <td colspan="2" bgcolor="#003366">&nbsp;</td>
                      </tr>
                    {foreach item=a from=$lista_interfaces}
                    <tr bgcolor="{$bgcolor}">
                      <td><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoInterface&interface={$a.interface}"><font face="arial" size="-1">{$a.interface}</font></td>
                      <td><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoInterface&interface={$a.interface}"><font face="arial" size="-1">{$a.tp_interface}</font></td>
                      <td><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoInterface&interface={$a.interface}"><font face="arial" size="-1">{$a.banda}{$a.tp_banda}</font></td>
                      <td align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=excluirInterface&amp;interface={$a.interface}"><img border="0" src="imagens/lixo.gif" width="15" height="16" alt="Excluir!!!" /></a></td>
                      <td align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=configurarIPinterface&interface={$a.interface}"><img src="imagens/ip.gif" alt="Configurar IPs na Interface {$a.interface} !!!" width="16" height="16" border="0" /></a></td>
                    </tr>
                    {/foreach}
                  </table>
                  <font color="#FF0000" face="arial">{$nenhum}</font> </div></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
