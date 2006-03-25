<br><br>
<p align=center><font face="arial" size="4"><b>Exclusão de Interface</b></font></p>
<hr size=1 width="500" color="#000000" align="center">
<table align=center width=500><tr><td>
<form method="post" action="{$smarty.server.PHP_SELF}" onSubmit="return confirm('Deseja realmente excluir esta Interface e todos os clientes anexados nela?')">
    <input type="hidden" name="sessao" value="{$sessao}">
    <input type="hidden" name="oper" value="confirma">
    <input type="hidden" name="interface" value="{$interface}">
    <font face="Arial" size="2"> <b>Atenção !!!</b><br>
    <br>
    A exclusão da interface (<i>{$interface}</i>) irá eliminar automaticamente
    os seguintes clientes: </font>
    <ol>
      <loop name="clientes">
      <li><font size="2" face="Arial">{$username}</font></li>
      </loop name="clientes">
    </ol>
    <font size="2" face="Arial">A exclusão da interface irá eliminar automaticamente
    os seguintes IPs: </font>
    <ol>
      <loop name="ips">
      <li><font size="2" face="Arial">{$ipaddr}</font></li>
      </loop name="ips">
    </ol>
    <br>
    <input type="hidden" name="confirma" value="excluir">
    <input type="submit" name="submit" value="Confirmar Exclusão de Interface">
  </form>
<br>
  <br>
  <a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces">voltar</a> </font>
</td></tr></table>
