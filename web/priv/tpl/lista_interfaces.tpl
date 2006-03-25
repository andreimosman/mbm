<br><br><div align="center"><font face="arial" size="4"><b>Interface</b></font> </div>
<hr size=1 width="500" color="#000000" align="center">
<div align="center"><a href="{$smarty.server.PHP_SELF}?sessao=cadastroInterface"><font face="arial" size="-1">para
  cadastrar uma interface clique aqui</font></a> </div>
<hr size=1 width="500" color="#000000" align="center">
<div align="center">
  <table border="0" cellspacing="0" width="500">
    <tr bgcolor="#AAAAAA">
      <td><font face="arial"><b>if</b></font></td>
      <td><font face="arial"><b>E/S</b></font></td>
      <td><font face="arial"><b>banda</b></font></td>
      <td>&nbsp;</td>
    </tr>
    {foreach item=a from=$lista_interfaces}
    <tr bgcolor="{$bgcolor}">
      <td><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoInterface&interface={$a.interface}"><font face="arial" size="-1">{$a.interface}</font></td>
      <td><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoInterface&interface={$a.interface}"><font face="arial" size="-1">{$a.tp_interface}</font></td>
      <td><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoInterface&interface={$a.interface}"><font face="arial" size="-1">{$a.banda}{$a.tp_banda}</font></td>
      <td> <a href="{$smarty.server.PHP_SELF}?sessao=excluirInterface&interface={$a.interface}"><img border="0" src="imagens/lixo.gif" width="15" height="16" alt="Excluir!!!"></a></td>
    </tr>
    {/foreach}
  </table>
  <font color="#FF0000" face="arial">{$nenhum}</font> </div>
