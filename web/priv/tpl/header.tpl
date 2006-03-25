<html>

<head>
<meta http-equiv="Content-Language" content="pt-br">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>MBM {$versao_mbm} :: Mosman Bandwidth Manager</title>
<script language="JavaScript">

{literal}
function mmLoadMenus() {
  if (window.mm_menu_0323122536_0) return;
  window.mm_menu_0323122536_0 = new Menu("root",161,18,"Arial, Helvetica, sans-serif",12,"#000000","#D6E2EB","#D6E2EB","#739CBB","left","middle",3,0,1000,-5,7,true,false,true,0,true,true);
  mm_menu_0323122536_0.addMenuItem("Alterar&nbsp;Senha","location='index.php?sessao=alterarSenha'");
  mm_menu_0323122536_0.addMenuItem("Listar&nbsp;Administradores","location='index.php?sessao=Admin&oper=admin'");
   mm_menu_0323122536_0.hideOnMouseOut=true;
   mm_menu_0323122536_0.bgColor='#555555';
   mm_menu_0323122536_0.menuBorder=1;
   mm_menu_0323122536_0.menuLiteBgColor='#FFFFFF';
   mm_menu_0323122536_0.menuBorderBgColor='#777777';

  window.mm_menu_0324141349_0 = new Menu("root",83,18,"Arial, Helvetica, sans-serif",12,"#000000","#D6E2EB","#D6E2EB","#739CBB","left","middle",3,0,1000,-5,7,true,false,true,0,true,true);
  mm_menu_0324141349_0.addMenuItem("Interfaces","location='index.php?sessao=listaInterfaces'");
  mm_menu_0324141349_0.addMenuItem("POPs","location='index.php?sessao=POP'");
   mm_menu_0324141349_0.hideOnMouseOut=true;
   mm_menu_0324141349_0.bgColor='#555555';
   mm_menu_0324141349_0.menuBorder=1;
   mm_menu_0324141349_0.menuLiteBgColor='#FFFFFF';
   mm_menu_0324141349_0.menuBorderBgColor='#777777';

mm_menu_0324141349_0.writeMenus();
} // mmLoadMenus()

{/literal}
</script>
<script language="JavaScript" src="mm_menu.js"></script>
{literal}
<script language="JavaScript" src="mm_menu.js"></script>
{/literal}
</head>

<body topmargin="0" leftmargin="0" link="#000000" vlink="#000000" alink="#000000" bgcolor="#FFFFFF">
<script language="JavaScript1.2">mmLoadMenus();</script>
<tr>
  <td width="100%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td colspan="2" background="imagens/fundo_top.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="209"><img src="imagens/logo.gif" width="209" height="45"></td>
          <td align="center" valign="bottom"><img src="imagens/titulo.gif" width="214" height="26"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces"></a></font></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td width="44%"><table width="560" border="0" cellpadding="0" cellspacing="0" background="imagens/fundo_barra.gif">
        <tr>
          <td align="center" width="10">&nbsp;</td>
          <td align="center" width="50"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{$smarty.server.PHP_SELF}?sessao=home">Home</a></font></td>
          <td align="center" width="3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">.</font></td>
          <td align="center" width="100"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="javascript:;" name="link2" id="link2" onMouseOver="MM_showMenu(window.mm_menu_0324141349_0,0,19,null,'link2')" onMouseOut="MM_startTimeout();">Configura&ccedil;&otilde;es</a></font></td>
          <td align="center" width="3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">.</font></td>
          <td align="center" width="50"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{$smarty.server.PHP_SELF}?sessao=listaIPs">Ips</a></font></td>
          <td align="center" width="3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">.</font></td>
          <td align="center" width=100><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{$smarty.server.PHP_SELF}?sessao=suporte">PPPoE
                Status</a></font></td>
          <td align="center" width=3><font size="1" face="Verdana, Arial, Helvetica, sans-serif">.</font></td>
          <td align="center" width=140><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{$smarty.server.PHP_SELF}?sessao=atualizarSistema">Atualizar
                Sistema</a></font></td>
          <td align="center" width=3><font size="1" face="Verdana, Arial, Helvetica, sans-serif">.</font></td>
          <td align="center" width=100><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="javascript:;" name="link1" id="link1" onMouseOver="MM_showMenu(window.mm_menu_0323122536_0,0,19,null,'link1')" onMouseOut="MM_startTimeout();">Administradores</a></font></td>
          <td align="center" width=3><font size="1" face="Verdana, Arial, Helvetica, sans-serif">.</font></td>
          <td align="center" width=70><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="{$smarty.server.PHP_SELF}?sessao=logout">LogOut</a></font></td>
          <td>&nbsp;</td>
          <td align="right" width=5><img src="imagens/barra_lado.gif" width="5" height="20"></td>
        </tr>
      </table></td>
      <td width="56%" align="right"><font face="arial" size="2">admin: <b>{$userAdmin}</b> </font></td>
    </tr>
  </table>
