<br><br>
<p align=center><font face="arial" size="4"><b>Exclus�o de IP</b></font></p> 
<hr size=1 width="500" color="#000000" align="center">
<form method="post" action="{SELF}" onSubmit="return confirm('Confirma a exclus�o do IP e do cliente anexado?')">
  <table align=center width=500><tr><td>
    <input type="hidden" name="sessao" value="{sessao}">
    <input type="hidden" name="oper" value="confirma">
    <input type="hidden" name="ip" value="{ip}">
    <font color="red" face="arial" size="2"> <b>Aten��o !!!</b> </font> <br>
    <br><font face="arial" size="2">
    A remo��o do IP (<i>{ip}</i>) implicar� na exclus�o autom�tica do seguinte 
    cliente: 
    <ol>
      <loop name="clientes"> 
      <li>{username}</li>
      </loop name="clientes"> 
    </ol>
    <br>
    <br>
    <br>
    <input type="hidden" name="confirma" value="excluir">
    <input type="submit" name="submit" value="Confirma Exclus�o do IP">
  
</form>
<br>
  <br>
  <a href="{SELF}?sessao=listaIPs">voltar</a><br>
  <br></font>
  </td></tr></table>