{literal}
<script language="JavaScript1.2">

function checa(){

			var frm = document.dados;

			var csenha, cconfsenha, erro;

			csenha=frm.senha.value;
			cconfsenha=frm.confsenha.value;


			if (csenha=="" || cconfsenha=="" || csenha != cconfsenha){
			window.alert("Os campos Senha e Confirmação são Obrigatórios e devem conter o mesmo valor");
			erro = "1";
			return false;
			}


	return true;
}

</script>
<style type="text/css">
<!--
.style6 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
.style7 {	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #003399;
}
-->
</style>
{/literal}

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="148" align="left" valign="top">{include file ='menu_left.tpl'}</td>
    <td align="center" valign="middle"><table width="600" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><table width="500" border="0" align="center" cellpadding="0" cellspacing="2">
          <tr>
            <td align="center"><font face="Arial, Helvetica, sans-serif"><strong> Altera&ccedil;&atilde;o
                  de Senha</strong><br />
              Usu&aacute;rio: {$userAdmin}</font></td>
          </tr>
          <tr>
            <td><hr size="1" width="500" color="#000000" align="center" /></td>
          </tr>
          <tr>
            <td></tr></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><form action="{$smarty.server.PHP_SELF}" method="post" name="dados" id="dados" onsubmit="return checa(this)">
                <input type="hidden" name="sessao" value="alterarSenha" />
                <input type="hidden" name="acao" value="alt" />
                <table width="60%" border="0" align="center" cellpadding="3" cellspacing="2">
                  <tr>
                    <td><font size="2" face="Arial, Helvetica, sans-serif">Nova
                        Senha:</font></td>
                    <td><input name="senha" type="password" id="senha" size="20" /></td>
                  </tr>
                  <tr>
                    <td><font size="2" face="Arial, Helvetica, sans-serif">Confirme
                        Nova Senha:</font></td>
                    <td><input name="confsenha" type="password" id="confsenha" size="20" /></td>
                  </tr>
                  <tr align="center">
                    <td colspan="2"><input type="submit" name="Submit" value="Alterar Senha" /></td>
                  </tr>
                </table>
            </form></td>
          </tr>
        </table>        </td>
      </tr>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
