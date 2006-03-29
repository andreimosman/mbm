<head>
<meta http-equiv="refresh" content=30>
</head>

<div align="center"><font face="arial" size="2"><b>Usuarios conectados no momento</b></font> 
</div>
<hr size=1 color="#000000" align="center">
<div align="center">
  <table border="0" cellspacing="0" width="100%">
    <tr bgcolor="#AAAAAA"> 
      <td bgcolor="#95AFBD"><font face="arial"><b>nas</b></font></td>
      <td bgcolor="#95AFBD"><font face="arial"><b>ip</b></font></td>
      <td bgcolor="#95AFBD"><font face="arial"><b>usr</b></font></td>
      <td bgcolor="#95AFBD"><font face="arial"><b>login</b></font></td>
    </tr>
    <loop name="lista_online"> 
    <tr bgcolor="{$bgcolor}"> 
      <td><font face="arial" size=-2>{$nas}</font></td>
      <td><font face="arial" size=-2>{$ipaddr}</font></td>
      <td><font face="arial" size=-2>{$username}</font></td>
      <td><font face="arial" size=-2>{$login}</font></td>
    </tr>
    </loop name="lista_online"> 
  </table>
  <font color="#FF0000" face="arial">{$nenhum}</font> </div>
