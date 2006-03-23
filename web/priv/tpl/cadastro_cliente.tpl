<script language="JavaScript1.2">
function checarString(str) {
   var expressaoRegular=/(^[a-zA-Z]+$)|((^[a-zA-Z]+)([\d|\-|\_]*$))|((^[a-zA-Z]+)([\d|\-|\_]*)([a-zA-Z]*$))/;
   return( expressaoRegular.test(str) );
}

function checarMAC(str) {
   var arr=str.split(":");
   if( str == '' ) return( true );

   var i;

   if( arr.length != 6 ) return( false );

   var expressaoRegular=/((^\d?)|(^[a-fA-F]?))((\d?$)|([a-fA-F]?$))/;

   for(i=0;i<arr.length;i++) {
      if( ! expressaoRegular.test(arr[i]) ) return( false );
   }

   return( true );
}

function checarData(str) {

   // Permitido data vazia
   if( str == '' ) return( true );

   if( str.length != 10 ) return( false );
   
   var arr=str.split("/");
   if(arr.length != 3) return( false );
   
   // Testa se o usuário entrou apenas com números
   var numRegEx=/^(\d+)$/;
   if( !numRegEx.test(arr[0]) || !numRegEx.test(arr[1]) || !numRegEx.test(arr[2]) ) return( false );
      
   var dia=parseInt(arr[0]);
   var mes=parseInt(arr[1]);
   var ano=parseInt(arr[2]);
      
   // O mês não é válido
   if( mes < 1 || mes > 12 ) return( false );
   
   var numDias = 0;
   if( mes == 2 ) {
      numDias = (   (ano % 4 == 0) && ( (!(ano % 100 == 0)) || (ano % 400 == 0))) ? 29 : 28;      
   } else if( mes == 4 || mes == 6 || mes == 9 || mes == 11 ) {
      numDias = 30;
   } else {
      numDias = 31;
   }
   
   // O dia não é válido
   if( dia > numDias ) return( false );
   
   return(true);
   
}

function checarValorBanda(num) {
   var expressaoRegular=/(^\d+$)/; // O campo não pode ser vazio
   return( expressaoRegular.test(num) );
}

function checaFormulario() {
   if( !checarString( form.username.value ) ) {
      window.alert("O campo 'Username' deve começar com uma letra e pode conter letras, números, '-' e '_' !!!");
      form.username.focus();
      return false;
   }

   if( !checarMAC( form.mac.value ) ) {
      window.alert("O campo 'MAC' deve estar no formato 'FF:FF:FF:FF:FF:FF' ou estar vazio.");
      form.mac.focus();
      return(false);
   }
   
   if( !checarData( form.dt_ativacao.value ) ) {
      window.alert("O campo 'Data da Ativação' deve ser preenchido no formato 'dd/mm/aaaa' ou estar vazio.");
      form.dt_ativacao.focus();
      return(false);
   }

   return true;
}
</script>
<link href="estilo.css" rel="stylesheet" type="text/css" />

<div align="center"><font face="arial" size="4"><b>Cliente</b></font> </div>
<hr size=1 width="500" color="#000000" align="center">
<form method="post" action="{SELF}" name="form" onSubmit="return checaFormulario();">
  <div align="center">
    <input type="hidden" name="sessao" value="{sessao}">
    <input type="hidden" name="oper" value="{oper}">
    <input type="hidden" name="us_orig" value="{us_orig}">
    <font face="arial" size="-1" color="#CC0000"><b>{sErro}</b></font> <font face="arial" size="-1" color="#000066"><b>{sMensagem}</b></font> 
    <table border=0 width="600">
      <tr> 
        <td width="140"><font face="arial" size="-1"><b>Username:</b></font></td>
        <td colspan="3" align="left"><input name="username" type="text" value="{username}" size="40" maxlength="15"></td>
      </tr>
      <tr> 
        <td width="140"><font face="arial" size="-1"><b>Senha:</b></font></td>
        <td colspan="3" align="left"><input type="text" name="senha" value="{senha}" maxlength="15"></td>
      </tr>
      <tr> 
        <td width="140"><font face="arial" size="-1"><b>Host PPPoE:</b></font></td>
        <td colspan="3" align="left">{pppoe_select}</td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>IP:</b></font></td>
        <td colspan="3" align="left">{ip_select}</td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>MAC:</b></font></td>
        <td colspan="3" align="left"><input type="text" name="mac" value="{mac}" maxlength="17"></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Status:</b></font></td>
        <td colspan="3" align="left"><input type="radio" name='status' value='A' class="checkbox" {status_ck1}>
          <font face="arial" size="-1" color="#009900">Ativo</font> <input type="radio" name='status' value='B' class="checkbox" {status_ck2}>
          <font face="arial" size="-1" color="#990000">Bloqueado</font></td>
      </tr>
      <tr> 
        <td colspan="4"><hr size=1></td>
      </tr>
      <!-- DADOS CADASTRAIS: Início -->
      <tr> 
        <td><font face="arial" size="-1"><b>Nome/Razao Social:</b></font></td>
        <td colspan="3" align="left"><input name="nome_razao" type="text" value="{nome_razao}" size="50" maxlength="50"></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Pessoa:</b></font></td>
        <td colspan="3" align="left"><font face="arial" size="-1">
          <input type="radio" name='tp_pessoa' value='F' class="checkbox" {tp_pessoa_ck1}>
          Física 
          <input type="radio" name='tp_pessoa' value='J' class="checkbox" {tp_pessoa_ck2}>
          Jurídica</font></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>CPF/CNPJ:</b></font></td>
        <td align="left"><input type="text" name="cpf_cnpj" value="{cpf_cnpj}" maxlength="25"></td>
        <td align="left"><font face="arial" size="-1"><b>RG/IE:</b></font></td>
        <td align="left"><input type="text" name="rg_ie" value="{rg_ie}" maxlength="25" /></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Endereço:</b></font></td>
        <td align="left"><input type="text" name="logradouro" value="{logradouro}" maxlength="25">
          nº <input type="text" name="numero" value="{numero}" maxlength="8" size=4>
          - 
          <input type="text" name="complemento" value="{complemento}" maxlength="20" size=8></td>
        <td align="left"><font face="arial" size="-1"><b>Bairro:</b></font></td>
        <td align="left"><input type="text" name="bairro" value="{bairro}" maxlength="25" /></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Cidade:</b></font></td>
        <td align="left"><input type="text" name="cidade" value="{cidade}" maxlength="25"></td>
        <td align="left"><font face="arial" size="-1"><b>UF:</b></font></td>
        <td align="left">{uf_select}</td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>CEP:</b></font></td>
        <td colspan="3" align="left"><input type="text" name="cep" value="{cep}" maxlength="9" size=9></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Fone:</b></font></td>
        <td colspan="3" align="left"><input type="text" name="fone" value="{fone}" maxlength="20"></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Data da Ativação:</b></font></td>
        <td colspan="3" align="left"><input type="text" name="dt_ativacao" value="{dt_ativacao}" maxlength="10"> 
          <small> (dd/mm/aaaa)</small></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Resp. Técnico:</b></font></td>
        <td colspan="3" align="left"><input type="text" name="resp_tecnico" value="{resp_tecnico}" maxlength="25"></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Email:</b></font></td>
        <td colspan="3" align="left"><input type="text" name="email" value="{email}" maxlength="255"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="3" align="left">&nbsp;</td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Comodato:</b></font></td>
        <td colspan="3" align="left"><font face="arial" size="-1">
          <input type="radio" name='flg_comodato' value='t' class="checkbox" {flg_comodato_ck1}>
          Sim 
          <input type="radio" name='flg_comodato' value='f' class="checkbox" {flg_comodato_ck2}>
          Não</font></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>ISP ou Gateway:</b></font></td>
        <td colspan="3" align="left"><font face="arial" size="-1">
          <input type="radio" name='flg_gw_isp' value='t' class="checkbox" {flg_gw_isp_ck1}>
          Sim 
          <input type="radio" name='flg_gw_isp' value='f' class="checkbox" {flg_gw_isp_ck2}>
          Não</font></td>
      </tr>
      <tr> 
        <td><font face="arial" size="-1"><b>Conexão via:</b></font></td>
        <td colspan="3" align="left"><font face="arial" size="-1">
          <input type="radio" name='tipo_conexao' value='R' class="checkbox" {tipo_conexao_ck1}>
          Rádio 
          <input type="radio" name='tipo_conexao' value='C' class="checkbox" {tipo_conexao_ck2}>
          Cabo</font></td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td colspan="3" align="left">&nbsp;</td>
      </tr>
      <tr> 
        <td valign="top"><font face="arial" size="-1"><b>Observações:</b></font></td>
        <td colspan="3" align="left"><font face="arial" size="-1">
          <textarea name="observacoes" cols=60 rows=10>{observacoes}</textarea></td>
      </tr>
      <!-- DADOS CADASTRAIS: Fim -->
      <tr> 
        <td colspan="4"><hr size=1></td>
      </tr>
      <!--tr>
      <td colspan="2">

         <table border="0" cellspacing="0" width="500" align="center">
            <tr bgcolor="#AAAAAA">
               <td width="10"><font face="arial"><b>&nbsp;</b></font></td>
               <td><font face="arial"><b>serviço</b></font></td>
               <td><font face="arial"><b>up</b></font></td>
               <td><font face="arial"><b>down</b></font></td>
            </tr>
<loop name="lista_servicos">
            <tr bgcolor="{bgcolor}">
               <td width="10"><input type="checkbox" name="servicos[]" value="{servico}" {ck}></td>
               <td><font face="arial" size="-1">{servico} ({porta})</font></td>
               <td><font face="arial" size="-1"><input type="text" name="banda_up[{servico}]" value="{be}" size="4" maxlength="4">{tp_bu_select}</font></font></td>
               <td><font face="arial" size="-1"><input type="text" name="banda_down[{servico}]" value="{bs}" size="4" maxlength="4">{tp_bd_select}</font></td>
            </tr>
</loop name="lista_servicos">

         </table>
      </td>
   </tr-->
      <tr> 
        <td align="right">&nbsp;</td>
        <td colspan="3" align="left"><input type="submit" name="submit" value="{submit}"></td>
      </tr>
    </table>
  </div>
</form>
<div align="center"><br>
  <br><font face="arial" size="2">
  <a href="{SELF}?sessao=listaIPs">voltar</a> </div>
