<script language="JavaScript1.2">
{literal}
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
{/literal}
</script>

<table width="500" border="0" align="center" cellpadding="0" cellspacing="2">
  <tr>
    <td align="center"><font face="Arial, Helvetica, sans-serif"><strong><br><br>Altera&ccedil;&atilde;o
      de Senha</strong><br>Usuário: {$userAdmin}</font></td>
      <tr><td><hr size=1 width="500" color="#000000" align="center"></td></tr>

  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><form name="dados" method="post" action="{$smarty.server.PHP_SELF}" onSubmit="return checa(this)">
    <input type="hidden" name="sessao" value="alterarSenha">
	<input type="hidden" name="acao" value="alt">
        <table width="60%" border="0" align="center" cellpadding="3" cellspacing="2">
          <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif">Nova Senha:</font></td>
            <td><input name="senha" type="password" id="senha" size="20"></td>
          </tr>
          <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif">Confirme Nova
              Senha:</font></td>
            <td><input name="confsenha" type="password" id="confsenha" size="20"></td>
          </tr>
          <tr align="center">
            <td colspan="2"><input type="submit" name="Submit" value="Alterar Senha"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>