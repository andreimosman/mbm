<br><br>
<font face="arial" size="4"><b>
<div align="center">Exclusão de Interface</div>
</b></font> 
<hr size=1 width="500" color="#000000" align="center">
<table align=center width=500><tr><td>
<font color="red" face="arial" size="2"> <b>Exclusão realizada 
  com sucesso !!!</b> </font><br>
  <br>
  <font size="2" face="arial"> Interface eliminada: <i>{interface}</i> <br>
  <br>
  <br>
  A exclusão da interface (<i>{interface}</i>) eliminou automaticamente os seguintes 
  clientes: </font>
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
<font size="2" face="arial">A exclusão da interface eliminou 
  automaticamente os seguintes IPs: </font>
  <ol>
    <font size="2" face="arial"><loop name="ips"> </loop name="ips"><loop name="ips"></loop name="ips"></font><font face="arial"><loop name="ips"></loop name="ips"></font>
  </ol>
<ol>
  <font face="arial"><loop name="ips">
  <li>
    <font size="2">{ipaddr}</font>
  </li>
  </loop name="ips"></font> 
</ol>
<font size="2" face="arial"><br>
  <br>
  <a href="{SELF}?sessao=listaInterfaces">voltar</a> </font>
<font size="2" face="arial"></font> 
</td></tr></table>