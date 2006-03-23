<table border="0" width="100%" bgcolor="#9F9F9F" height="100%">
 <tr>
  <td colspan=2 bgcolor="#9F9F9F">
  <!-- LOGO -->
  <font face="arial" size="+3"><b> &nbsp;MBM {versao_mbm}</b></font><hr size=1 color="#000000">
  </td>
 </tr>
 <tr>
  <td width="100" bgcolor="#9F9F9F" valign="top">
  <!-- MENU -->
  <font face="arial" size="-1">
<!--   [<a href="javascript:window.open('./estatisticas/{ipaddr}/{ipaddr}.html','conteudo');" target="conteudo">estatísticas</a>]
   [<a href="{SELF}?sessao=alteraSenha" target="conteudo">alterar senha</a>] 
   <hr size=1 color=#000000>-->
   [<a href="{SELF}?sessao=logout" target="_top">logout</a>]
  </font>
  </td>
  <td height="100%">
  <!-- CONTEUDO -->
  <iframe width="100%" height="100%" src= "./estatisticas/{ipaddr}/{ipaddr}.html" _src="about:blank" name="conteudo">
  </td>
 </tr>
</table>
