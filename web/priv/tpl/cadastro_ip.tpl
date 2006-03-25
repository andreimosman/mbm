<script language="JavaScript1.2">
{literal}
function checarString(str) {
   var expressaoRegular=/(^[a-zA-Z]+$)|((^[a-zA-Z]+)([\d|\-|\_]*$))|((^[a-zA-Z]+)([\d|\-|\_]*)([a-zA-Z]*$))/;
   return( expressaoRegular.test(str) );
}

function checarIP(ip) {
   var expressaoRegularIP=/(^\d+)\.(\d+)\.(\d+)\.(\d+$)/;
   var expressaoRegularREDE=/(^\d+)\.(\d+)\.(\d+)\.(\d+)\/(\d+$)/;
   var ehRede = expressaoRegularREDE.test(ip);
   var ehIP = expressaoRegularIP.test(ip)

   if( ehIP ) {
      var arrIP = ip.split(".");
      var x=0;
      for(x=0;x<arrIP.length;x++) {
         if( arrIP[x].length > 3 ) {
            return false;
         }
      }
      return true;
   }

   if( !ehIP && !ehRede ) return false;

   var arrRede = ip.split("/");
   // Testar a parte do IP
   if( !checarIP(arrRede[0]) ) return false;

   var bitsMask = parseInt(arrRede[1]);
   if( bitsMask > 32 || bitsMask < 0 ) return false;

   return true;
}

function checarValorBanda(num,tp) {
   var expressaoRegular=/(^\d+$)/; // O campo não pode ser vazio
   if( !expressaoRegular.test(num) ) return false;

   var banda = parseInt( num ) * ( tp == "" ? 1: (tp == "K" ? 1024:1024^2) );
   return( banda > 6144 || banda == 0 );
}

function checaFormulario() {
   if( !checarIP( form.ipaddr.value ) ) {
      window.alert("O campo 'IP' deve estar no formato 'XXX.XXX.XXX.XXX' ou 'XXX.XXX.XXX.XXX/YY' onde X é um número de 0 a 9 e YY é um número entre zero e 32 !!!");
      form.ipaddr.focus();
      return false;
   }

   if( !checarValorBanda( form.banda_up.value, form.tipo_banda_up.value ) ) {
      window.alert("O campo 'Banda de Upload' deve ser numérico. Utilize 0 para bloquear o IP ou uma banda superior a 6Kbps.");
      form.banda_up.focus();
      return false;
   }

   if( !checarValorBanda( form.banda_down.value, form.tipo_banda_down.value ) ) {
      window.alert("O campo 'Banda de Download' deve ser numérico. Utilize 0 para bloquear o IP ou uma banda superior a 6Kbps.");
      form.banda_down.focus();
      return false;
   }
   //if( !checarValorBanda( form.banda_down_alt.value, form.tipo_banda_down_alt.value ) ) {
   //   window.alert("O campo 'Banda de Download Alternativo' deve ser numérico e superior a 6Kbps, ou VAZIO.");
   //   form.banda_down.focus();
   //   return false;
   //}
   //if( !checarValorBanda( form.banda_up_alt.value, form.tipo_banda_up_alt.value ) ) {
   //   window.alert("O campo 'Banda de Upload Alternativo' deve ser numérico e superior a 6Kbps, ou VAZIO.");
   //   form.banda_down.focus();
   //   return false;
   //}
   if (form.banda_down_alt.value != "" || form.banda_up_alt.value != ""){

 	  if (form.banda_down_alt.value == 0 || form.banda_down_alt.value < 6 ){
 	  		window.alert("O valor de Banda de Download Alternativo deve ser maior que 6Kbps ou VAZIO");
 	  		form.banda_down_alt.focus();
 	  		return false;
 	  }

 	  if (form.banda_up_alt.value == 0 || form.banda_up_alt.value < 6){
 	  		window.alert("O valor de Banda de Upload Alternativo deve ser maior que 6Kbps ou VAZIO");
 	  		form.banda_up_alt.focus();
 	  		return false;
 	  }

   }
   if( (parseInt( form.banda_down.value ) == 0 || parseInt( form.banda_up.value ) == 0) && parseInt( form.banda_up.value) != parseInt(form.banda_down.value) ) {
      window.alert("Para bloquear o IP utilize 0 nas bandas de download e upload respectivamente.");
      window.banda_down.focus();
      return false;
   }


   return true;
}
{/literal}
</script>
<div align="center"><font face="arial" size="4"><b>IP</b></font> </div>
<hr size=1 width="500" color="#000000" align="center">
<form method="post" action="{$smarty.server.PHP_SELF}" name="form" onSubmit="return checaFormulario();">
  <div align="center">
    <input type="hidden" name="sessao" value="{$sessao}">
    <input type="hidden" name="oper" value="{$oper}">
    <input type="hidden" name="ip_orig" value="{$ip_orig}">
    <font face="arial" size="-1" color="#990000"><b>{$sErro}</b></font> <font face="arial" size="-1" color="#000066"><b>{$sMensagem}</b></font>
    <table border=0 width="500" cellpadding=1 bgcolor="#000000">
      <tr bgcolor="#ffffff">
        <td> <font face="arial" size="-1"><b>IP ($host/net):</b></font> <input type="text" name="ipaddr" value="{$ipaddr}" maxlength="18">
        </td>
      </tr>
      <tr brcolor="#FFFFF">
        <td> <table border=1 cellspacing=0 width="100%" bgcolor="#000000">
            <tr bgcolor="#990000" align="center">
              <td colspan=2><font color="#FFFFFF" size="-1" face="arial"><b> --
                BANDA EM HORÁRIO COMERCIAL -- </b></font></td>
            </tr>
            <tr bgcolor="#A0A0A0" align="center">
              <td width="50%"><font face="arial" size="-1"><b>UPLOAD</b></td>
              <td width="50%"><font face="arial" size="-1"><b>DOWNLOAD</b></td>
            </tr>
            <tr>
              <td> <table border=0 bgcolor="#ffffff" width="100%">
                  <tr>
                    <td><font face="arial" size="-1"><b>Int:</b></font></td>
                    <td align="left">{$ife_select}</td>
                  </tr>
                  <tr>
                    <td><font face="arial" size="-1"><b>Banda:</b></font></td>
                    <td align="left"><input type="text" size=4 name="banda_up" value="{$banda_up}">
                      {$tp_bu_select}</td>
                  </tr>
                </table></td>
              <td> <table border=0 bgcolor="#ffffff" width="100%">
                  <tr>
                    <td><font face="arial" size="-1"><b>Int:</b></font></td>
                    <td align="left">{$ifi_select}</td>
                  </tr>
                  <tr>
                    <td><font face="arial" size="-1"><b>Banda:</b></font></td>
                    <td align="left"><input type="text" size=4 name="banda_down" value="{$banda_down}">
                      {$tp_bd_select}</td>
                  </tr>
                </table></td>
            </tr>
          </table></td>
      </tr>
      <tr brcolor="#FFFFF">
        <td> <table border=1 cellspacing=0 width="100%" bgcolor="#000000">
            <tr bgcolor="#009900" align="center">
              <td colspan=2><font color="#FFFFFF" size="-1" face="arial"><b> --
                BANDA FORA DO HORÁRIO COMERCIAL (OPCIONAL) -- </b></font></td>
            </tr>
            <tr bgcolor="#A0A0A0" align="center">
              <td width="50%"><font face="arial" size="-1"><b>UPLOAD</b></td>
              <td width="50%"><font face="arial" size="-1"><b>DOWNLOAD</b></td>
            </tr>
            <tr>
              <td> <table border=0 bgcolor="#ffffff" width="100%">
                  <tr>
                    <td><font face="arial" size="-1"><b>Banda:</b></font></td>
                    <td align="left"><input type="text" size=4 name="banda_up_alt" value="{$banda_up_alt}">
                      {$tp_bua_select}</td>
                  </tr>
                </table></td>
              <td> <table border=0 bgcolor="#ffffff" width="100%">
                  <tr>
                    <td><font face="arial" size="-1"><b>Banda:</b></font></td>
                    <td align="left"><input type="text" size=4 name="banda_down_alt" value="{$banda_down_alt}">
                      {$tp_bda_select}</td>
                  </tr>
                </table></td>
            </tr>
          </table></td>
      </tr>
      <tr align="center" bgcolor="#FFFFFF">
        <td> <input type="submit" name="submit" value="{$submit}"> </td>
      </tr>
    </table>
  </div>
</form>
<div align="center"><br>
  <br><font face="arial" size="2">
  <a href="{$smarty.server.PHP_SELF}?sessao=listaIPs">voltar</a> </div>
