<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
{literal}
<style type="text/css">

<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: bold;
	color: #003366;
}
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
-->

</style>
{/literal}
</head>

<body>
<table width="100" border="0" cellpadding="0" cellspacing="0" background="imagens/fundo_menu.gif">
  <tr>
    <td><table width="97%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="5">&nbsp;</td>
        <td><span class="style1">Configura&ccedil;&otilde;es</span></td>
      </tr>
      <tr>
        <td width="5">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="1" cellpadding="1">
          <tr>
            <td colspan="2"><img src="imagens/pixel.gif" width="1" height="5" /></td>
            </tr>
          <tr>
            <td width="6"><img src="imagens/gif_left.gif" width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=POP">POPs</a></td>
          </tr>
          <tr>
            <td width="6"><img src="imagens/gif_left.gif" alt=" " width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces">Interfaces</a></td>
          </tr>
          <tr>
            <td width="6"><img src="imagens/gif_left.gif" alt=" " width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=prefs">Prefer&ecirc;ncias</a></td>
          </tr>
          <tr>
            <td width="6"><img src="imagens/gif_left.gif" alt=" " width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=alterarSenha">Alterar Senha </a></td>
          </tr>
          <tr>
            <td width="6"><img src="imagens/gif_left.gif" alt=" " width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=Admin&amp;oper=admin">Administradores</a></td>
          </tr>
          <tr>
            <td width="6"><img src="imagens/gif_left.gif" alt=" " width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=Admin&amp;oper=backup">Backup/Restore</a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="5"><img src="imagens/pixel.gif" alt=" " width="1" height="1" /></td>
        <td bgcolor="#006699"><img src="imagens/pixel.gif" width="1" height="1" /></td>
      </tr>
      <tr>
        <td width="5">&nbsp;</td>
        <td class="style1">IPs</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="1" cellpadding="1">
          <tr>
            <td colspan="2"><img src="imagens/pixel.gif" alt=" " width="1" height="5" /></td>
            </tr>
          <tr>
            <td width="6"><img src="imagens/gif_left.gif" alt="." width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=cadastroIP">Novo IP/Rede </a></td>
          </tr>
          <tr>
            <td><img src="imagens/gif_left.gif" alt="." width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=listaIPs">Pesquisa</a></td>
          </tr>
          <tr>
            <td width="6"><img src="imagens/gif_left.gif" alt="." width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=listaIPs&amp;oper=tudo">Lista</a></td>
          </tr>
          <tr>
            <td width="6"><img src="imagens/gif_left.gif" alt="." width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=cadastroCliente">Habilitar Cliente </a></td>
          </tr>

        </table></td>
      </tr>
      <tr>
        <td><img src="imagens/pixel.gif" alt=" " width="1" height="1" /></td>
        <td bgcolor="#006699"><img src="imagens/pixel.gif" alt=" " width="1" height="1" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="style1">Relat&oacute;rios</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="center" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="1">
          <tr>
            <td colspan="2"><img src="imagens/pixel.gif" alt=" " width="1" height="5" /></td>
            </tr>
          <tr>
            <td width="6" height="6"><img src="imagens/gif_left.gif" alt="." width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=relatorio&amp;tipo=usuario_bloq">Clientes Bloqueados </a></td>
          </tr>
          <tr>
            <td><img src="imagens/gif_left.gif" alt="." width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=relatorio&amp;tipo=grafico">Gr&aacute;ficos de Consumo </a></td>
          </tr>
          <tr>
            <td><img src="imagens/gif_left.gif" alt="." width="6" height="6" /></td>
            <td height="6"><a href="{$smarty.server.PHP_SELF}?sessao=relatorio&amp;tipo=arp">Tabela ARP </a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="imagens/fim_menu.gif" width="148" height="6" /></td>
  </tr>
</table>
</body>
</html>
