<font face="arial" size="4"><b>
<div align="center">Exclusão de Serviço</div>
</b></font> 
<hr size=1 width="500" color="#000000" align="center">
<table align=center width=500><tr><td>
<font color="red" face="arial" size="2"> <b>Exclusão realizada 
  com sucesso !!!</b> </font> <br>
  <br>
  <font size="2" face="arial"> Serviço eliminado: <i>{servico}</i> <br>
  <br>
  <br>
  A exclusão eliminou automaticamente a limitação de banda do serviço (<i>{servico}</i>) 
  nos seguintes clientes: </font>
  <ol>
    <font size="2" face="arial"><loop name="clientes"> </loop name="clientes"><loop name="clientes"></loop name="clientes"></font><font face="arial"><loop name="clientes"></loop name="clientes"></font>
  </ol>
<ol>
  <font face="arial"><loop name="clientes">
  <li>
    <font size="2">{username}</font>
  </li>
  </loop name="clientes"></font> 
</ol>
<br>
  <br>
  <font face="arial" size="2"> <a href="{SELF}?sessao=listaServicos">voltar</a> 
  </font>
<font face="arial" size="2"></font> 
</td></tr></table>