  <br><br>
  <font face="arial" size="4" color="black"><b><p align=center>IPs</p></b></font><br>
  <p align=center>{$mensagem}</p><br>

  <table border="0" cellspacing="0" width="600" align="center">
    <tr>
      <td colspan=4 bgcolor="#BBBBBB" align="center"><font face="arial"><b>IP</b></font></td>
      <td colspan=4 bgcolor="#AAAAAA" align="center"><font face="arial"><b>CLIENTE</b></font></td>
    </tr>
    <tr bgcolor="#AAAAAA">
      <td bgcolor="#BBBBBB"><font face="arial" size="-1"><b>IP</b></font></td>
      <td bgcolor="#BBBBBB"><font face="arial" size="-1"><b>UP</b></font></td>
      <td bgcolor="#BBBBBB"><font face="arial" size="-1"><b>DOWN</b></font></td>
      <td bgcolor="#BBBBBB"><font face="arial" size="-1"><b>&nbsp;</b></font></td>
      <td bgcolor="#AAAAAA"><font face="arial" size="-1"><b>USER</b></font></td>
      <td bgcolor="#AAAAAA"><font face="arial" size="-1"><b>MAC</b></font></td>
      <td bgcolor="#AAAAAA"><font face="arial" size="-1"><b>STATUS</b></font></td>
      <td bgcolor="#AAAAAA"><font face="arial" size="-1"><b>&nbsp;</b></font></td>
    </tr>
    <loop name="lista_IPs">
    <tr>
      <td bgcolor="{$bgcolorI}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoIP&ipaddr={$ipaddr}"><font face="arial" size="-1">{$ipaddr}</font></a></td>
      <td bgcolor="{$bgcolorI}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoIP&ipaddr={$ipaddr}"><font face="arial" size="-1" color="#FF0000"><b>{banda_up}{tp_up}<font color="008800">{banda_alt_up}</font></b></a></td>
      <td bgcolor="{$bgcolorI}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoIP&ipaddr={$ipaddr}"><font face="arial" size="-1" color="#FF0000"><b>{banda_down}{tp_down}<font color="008800">{banda_alt_down}</font></b></a></td>
      <!-- Oper do IP -->
      <td bgcolor="{$bgcolorI}"><a href="javascript:janelaEstatisticas('{dir}');"><img src="imagens/estatisticas.gif" border=0 width="16" height="16" ALT="[stats]"></a>{operI}</td>
      <td bgcolor="{$bgcolorC}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoCliente&username={cliente}"><font face="arial" size="-1">{cliente}</font></a></td>
      <td bgcolor="{$bgcolorC}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoCliente&username={cliente}"><font face="arial" size="-1">{mac}</font></a></td>
      <td bgcolor="{$bgcolorC}"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoCliente&username={cliente}"><font face="arial" size="-1" color="{cor_status}">{strstatus}</font></a><font face="arial" size="-1" color="{cor_status}">{st_nao_ativado}</font></td>
      <!-- Oper do cliente -->
      <td bgcolor="{$bgcolorC}">{operC}</td>
      <!--<td><a href="{$smarty.server.PHP_SELF}?sessao=excluirCliente&username={cliente}"><img border="0" src="imagens/lixo.gif" width="15" height="16" alt="Excluir!!!"></a></td>-->
    </tr>
    {lynx_hr} </loop name="lista_IPs">
  </table>
  <font color="#FF0000" face="arial">{$nenhum}</font> </center><br><br>
<p align=center><a href="{$smarty.server.PHP_SELF}?sessao=listaIPs">voltar</a></p>