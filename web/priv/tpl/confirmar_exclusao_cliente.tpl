<br><br>
<p align=center><font face="arial" size="4"><b>Exclus�o de Cliente</b></font></p> 
<hr size=1 width="500" color="#000000" align="center">
<table align=center width=500><tr><td>
<form method="post" action="{SELF}" onSubmit="return confirm('Deseja realmente excluir este cliente?')">
    <input type="hidden" name="sessao" value="{sessao}">
    <input type="hidden" name="oper" value="confirma">
    <input type="hidden" name="username" value="{username}">
    <font color="#CC0000" face="arial" size="2"> <b>Aten��o !!!</b></font><br>
    <br><font face="arial" size="2">
    Voc� deseja realmente excluir o cliente <i>{username}</i> ??? <br>
    <br>
    <br>
    <input type="hidden" name="confirma" value="excluir">
    <input type="submit" name="submit" value="Confirmar Exclus�o de Cliente">
</form>
<br>
  <br>
  <a href="{SELF}?sessao=listaIPs">voltar</a><br>
  <br></font>
</td></tr></table>