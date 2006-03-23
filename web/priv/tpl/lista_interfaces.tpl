<br><br><div align="center"><font face="arial" size="4"><b>Interface</b></font> </div>
<hr size=1 width="500" color="#000000" align="center">
<div align="center"><a href="{SELF}?sessao=cadastroInterface"><font face="arial" size="-1">para 
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
    <loop name="lista_interfaces"> 
    <tr bgcolor="{bgcolor}"> 
      <td><a href="{SELF}?sessao=alteracaoInterface&interface={interface}"><font face="arial" size="-1">{interface}</font></td>
      <td><a href="{SELF}?sessao=alteracaoInterface&interface={interface}"><font face="arial" size="-1">{tp_interface}</font></td>
      <td><a href="{SELF}?sessao=alteracaoInterface&interface={interface}"><font face="arial" size="-1">{banda}{tp_banda}</font></td>
      <td> <a href="{SELF}?sessao=excluirInterface&interface={interface}"><img border="0" src="imagens/lixo.gif" width="15" height="16" alt="Excluir!!!"></a></td>
    </tr>
    </loop name="lista_interfaces"> 
  </table>
  <font color="#FF0000" face="arial">{nenhum}</font> </div>
