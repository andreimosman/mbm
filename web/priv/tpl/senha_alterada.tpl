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
	  <tr><td><img src="images/admin.gif" /></td></tr>
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
            <td><p align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#003366"><b>SENHA ALTERADA COM SUCESSO!!!</b></font></p></td>
          </tr>
        </table>        </td>
      </tr>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
