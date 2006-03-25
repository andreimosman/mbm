<script language="JavaScript1.2">
{literal}
function checa(){

			var  csenha, cconfsenha, erro;

			csenha=document.dados.senha.value;
			cconfsenha=document.dados.confsenha.value;

			if (csenha=="" || cconfsenha==""){
			msg = msg + "Os campos Senha e Confirmação são Obrigatórios . \n";
			erro = 1;
			}

			if (csenha != cconfsenha) {
				msg = msg + "Os campos Senha e Confirmação devem conter o mesmo conteúdo.\n";
				erro = 1;
			}

			if (erro == 1){
				alert(msg);
				return false;
			}

	return true;
}

{/literal}
</script>
<br><br>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="2">
  <tr>
    <td align="center"><font face="Arial, Helvetica, sans-serif"><strong>Altera&ccedil;&atilde;o
      de Senha</strong><br>Usuário: {$userAdmin}</font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
<font face="arial"><p align="center"><b>SENHA ALTERADA COM SUCESSO!!!</b></p></font>

    </td>
  </tr>
</table>