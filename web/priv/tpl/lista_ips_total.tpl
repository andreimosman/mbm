<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<p>&nbsp;</p>
<p align="center"><font size="3"><strong><font size="4" face="Arial, Helvetica, sans-serif">IPs</font></strong></font><br />
    <font size="3" face="Verdana, Arial, Helvetica, sans-serif">Lista Completa</font></p>
<table width="600" border="0" align="center" cellspacing="0">
    <tr> 
      <td colspan=4 bgcolor="#BBBBBB" align="center"><font face="arial"><b>IP</b></font></td>
      <td colspan=4 bgcolor="#AAAAAA" align="center"><font face="arial"><b>CLIENTE</b></font></td>
    </tr>
    <tr bgcolor="#AAAAAA"> 
      <td bgcolor="#BBBBBB"><font face="arial" size="-1"><b>IP</b></font></td>
      <td bgcolor="#BBBBBB"><font face="arial" size="-1"><b>UP</b></font></td>
      <td bgcolor="#BBBBBB"><font face="arial" size="-1"><b>DOWN</b></font></td>
      <td bgcolor="#BBBBBB"><font face="arial" size="-1"><b>&nbsp;</b></font></td>
      <td bgcolor="#AAAAAA"><font face="arial" size="-1"><b>USER</b></font></td>
      <td bgcolor="#AAAAAA"><font face="arial" size="-1"><b>MAC</b></font></td>
      <td bgcolor="#AAAAAA"><font face="arial" size="-1"><b>STATUS</b></font></td>
      <td bgcolor="#AAAAAA"><font face="arial" size="-1"><b>&nbsp;</b></font></td>
    </tr>
    <loop name="lista_IPs"> 
    <tr> 
      <td bgcolor="{bgcolorI}"><a href="{SELF}?sessao=alteracaoIP&ipaddr={ipaddr}"><font face="arial" size="-1">{ipaddr}</font></a></td>
      <td bgcolor="{bgcolorI}"><a href="{SELF}?sessao=alteracaoIP&ipaddr={ipaddr}"><font face="arial" size="-1" color="#FF0000"><b>{banda_up}{tp_up}<font color="008800">{banda_alt_up}</font></b></a></td>
      <td bgcolor="{bgcolorI}"><a href="{SELF}?sessao=alteracaoIP&ipaddr={ipaddr}"><font face="arial" size="-1" color="#FF0000"><b>{banda_down}{tp_down}<font color="008800">{banda_alt_down}</font></b></a></td>
      <!-- Oper do IP -->
      <td bgcolor="{bgcolorI}"><a href="javascript:janelaEstatisticas('{dir}');"><img src="imagens/estatisticas.gif" border=0 width="16" height="16" ALT="[stats]"></a>{operI}</td>
      <td bgcolor="{bgcolorC}"><a href="{SELF}?sessao=alteracaoCliente&username={cliente}"><font face="arial" size="-1">{cliente}</font></a></td>
      <td bgcolor="{bgcolorC}"><a href="{SELF}?sessao=alteracaoCliente&username={cliente}"><font face="arial" size="-1">{mac}</font></a></td>
      <td bgcolor="{bgcolorC}"><a href="{SELF}?sessao=alteracaoCliente&username={cliente}"><font face="arial" size="-1" color="{cor_status}">{strstatus}</font></a><font face="arial" size="-1" color="{cor_status}">{st_nao_ativado}</font></td>
      <!-- Oper do cliente -->
      <td bgcolor="{bgcolorC}">{operC}</td>
      <!--<td><a href="{SELF}?sessao=excluirCliente&username={cliente}"><img border="0" src="imagens/lixo.gif" width="15" height="16" alt="Excluir!!!"></a></td>-->
    </tr>
    {lynx_hr} </loop name="lista_IPs"> 
</table>
<div align="center"><font color="#FF0000" face="arial">{nenhum}</font> 
  </center> 
</div>
</body>
</html>
