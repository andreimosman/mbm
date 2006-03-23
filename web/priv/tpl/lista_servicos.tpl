<br><br><div align="center"><font face="arial" size="4"><b>Serviços</b></font> </div>
<hr size=1 width="500" color="#000000" align="center">
<div align="center"><a href="{SELF}?sessao=cadastroServico"><font face="arial" size="-1">para 
  cadastrar um serviço clique aqui</font></a> </div>
<hr size=1 width="500" color="#000000" align="center">
<div align="center">
  <table border="0" cellspacing="0" width="500">
    <tr bgcolor="#AAAAAA"> 
      <td><font face="arial"><b>serviço</b></font></td>
      <td><font face="arial"><b>porta</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <loop name="lista_servicos"> 
    <tr bgcolor="{bgcolor}"> 
      <td><a href="{SELF}?sessao=alteracaoServico&servico={servico}"><font face="arial" size="-1">{servico}</font></td>
      <td><a href="{SELF}?sessao=alteracaoServico&servico={servico}"><font face="arial" size="-1">{porta}</font></td>
      <td><a href="{SELF}?sessao=excluirServico&servico={servico}"><img border="0" src="imagens/lixo.gif" width="15" height="16" alt="Excluir!!!"></a></td>
    </tr>
    </loop name="lista_servicos"> 
  </table>
  <font color="#FF0000" face="arial">{nenhum}</font> </center> </div>
