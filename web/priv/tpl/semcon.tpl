<head>
<meta http-equiv="refresh" content=30>
</head>

<div align="center"><font face="arial" size="2"><b>Usuarios sem conexao nos últimos 
  {$numdias} dias</b></font> </div>
<hr size=1 color="#000000" align="center">
<div align="center">
  <table border="0" cellspacing="0" width="100%">
    <tr bgcolor="#AAAAAA"> 
      <td><font face="arial"><b>ip</b></font></td>
      <td><font face="arial"><b>usr</b></font></td>
      <td><font face="arial"><b>resp</b></font></td>
      <td><font face="arial"><b>fone</b></font></td>
    </tr>
    <loop name="lista_semcon"> 
    <tr bgcolor="{$bgcolor}"> 
      <td><font face="arial" size=-2>{$ipaddr}</font></td>
      <td><font face="arial" size=-2>{$username}</font></td>
      <td><font face="arial" size=-2>{$resp_tecnico}</font></td>
      <td><font face="arial" size=-2>{$fone}</font></td>
    </tr>
    </loop name="lista_semcon"> 
  </table>
  <font color="#FF0000" face="arial">{$nenhum}</font> </div>
