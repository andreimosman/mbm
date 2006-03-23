<script language="JavaScript1.2">
function checarString(str) {
   var expressaoRegular=/(^[a-zA-Z]+$)|((^[a-zA-Z]+)([\d|\-|\_]*$))|((^[a-zA-Z]+)([\d|\-|\_]*)([a-zA-Z]*$))/;
   return( expressaoRegular.test(str) );
}

function checarValorBanda(num) {
   var expressaoRegular=/(^\d+$)/; // O campo não pode ser vazio
   return( expressaoRegular.test(num) );
}

function checaFormulario() {
   if( !checarString( form.servico.value ) ) {
      window.alert("O campo 'Serviço' deve começar com uma letra e pode conter letras, números, '-' e '_' !!!");
      form.servico.focus();
      return false;
   }

   return true;
}
</script>
<div align="center"><font face="arial" size="4"><b>Serviços</b></font> </div>
<hr size=1 width="500" color="#000000" align="center">
<form method="post" action="{SELF}" name="form" onSubmit="return checaFormulario();">
  <div align="center">
    <input type="hidden" name="sessao" value="{sessao}">
    <input type="hidden" name="oper" value="{oper}">
    <input type="hidden" name="sv_orig" value="{sv_orig}">
    <input type="hidden" name="pt_orig" value="{pt_orig}">
    <font face="arial" size="-1" color="#FF0000"><b>{sErro}</b></font> <font face="arial" size="-1" color="#0000FF"><b>{sMensagem}</b></font> 
    <table border=0>
      <tr> 
        <td><font face="arial" size="-1"><b>Servico:</b></font></td>
        <td align="left"><input type="text" name="servico" value="{servico}" maxlength="15"></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Porta:</b></font></td>
        <td align="left"><input type="text" name="porta" value="{porta}"></td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
        <td align="left"><input type="submit" name="submit" value="{submit}"></td>
      </tr>
    </table>
  </div>
</form>
<div align="center"><br>
  <br><font face="arial" size="2">
  <a href="{SELF}?sessao=listaServicos">voltar</a> </div>
