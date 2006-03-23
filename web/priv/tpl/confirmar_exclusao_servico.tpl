<br><br>
<font face="arial" size="4"><b>
<p align=center>Exclusão do Serviço</p>
</b></font> 
<hr size=1 width="500" color="#000000" align="center">
<table align=center width=500><tr><td>
<form method="post" action="{SELF}" onSubmit="return confirm('Confirma a exclusão do Serviço?')">
    <input type="hidden" name="sessao" value="{sessao}">
    <input type="hidden" name="oper" value="confirma">
    <input type="hidden" name="servico" value="{servico}">
    <font color="red" face="arial" size="2"><b>Atenção !!!</b></font> <br>
    <br>
    <font size="2" face="arial"> Os clientes abaixo tem controle de banda pelo 
    serviço selecionado (<i>{servico}</i>): </font>
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
  <font size="2" face="arial">A exclusão irá excluir a limitação 
    de banda do serviço (<i>{servico}</i>) nestes clientes.<br>
    <br>
    <input type="hidden" name="confirma" value="excluir">
    <input type="submit" name="submit" value="Confirmar exclusão do serviço">
    </font> <br>
    <br>
    <a href="{SELF}?sessao=listaServicos">voltar</a> 
</form>
</td></tr></table>