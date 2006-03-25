<script language="JavaScript1.2">
{literal}
function checarString(str) {
   var expressaoRegular=/(^[a-zA-Z]+$)|((^[a-zA-Z]+)([\d|\-|\_]*$))|((^[a-zA-Z]+)([\d|\-|\_]*)([a-zA-Z]*$))/;
   return( expressaoRegular.test(str) );
}

function checarValorBanda(num) {
   var expressaoRegular=/(^\d+$)/; // O campo não pode ser vazio
   return( expressaoRegular.test(num) );
}

function checaFormulario() {
   if( !checarString( form.interface.value ) ) {
      window.alert("O campo Interface deve começar com uma letra e pode conter letras, números, '-' e '_' !!!");
      form.interface.focus();
      return false;
   }

   if( !checarValorBanda( form.banda.value ) ) {
      window.alert("A banda requer um valor numérico");
      form.banda.focus();
      return false;
   }

   return true;
}
{/literal}
</script>
<br><br><div align="center"><font face="arial" size="4"><b>Interface</b></font> </div>
<hr size=1 width="500" color="#000000" align="center">
<form name="form" method="post" action="{$smarty.server.PHP_SELF}" onSubmit="return checaFormulario();">
  <div align="center">
    <input type="hidden" name="sessao" value="{$sessao}">
    <input type="hidden" name="oper" value="{$oper}">
    <input type="hidden" name="if_orig" value="{$if_orig}">
    <font face="arial" size="-1" color="#990000"><b>{$sErro}</b></font> <font face="arial" size="-1" color="#000099"><b>{$sMensagem}</b></font>
    <table border=0 width="500">
      <tr>
        <td><font face="arial" size="-1"><b>Interface:</b></font></td>
        <td align="left"> <input type="text" name="interface" value="{$interface}" size="4" maxlength="4">
          {$tp_if_select}</td>
      </tr>
      <tr>
        <td><font face="arial" size="-1"><b>Banda</b></font></td>
        <td align="left"> <input type="text" name="banda" value="{$banda}" size="4" maxlength="4">
          {$tp_banda_select}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="left"><input type="submit" name="submit" value="{$submit}"></td>
      </tr>
    </table>
  </div>
</form>
<div align="center"><br>
  <br><font face="arial" size="2">
  <a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces">voltar</a> </div>
