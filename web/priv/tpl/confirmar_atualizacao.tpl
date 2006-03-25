<br><br>
<table align="center" width=500>
<tr>
<td>
<font face="arial" size="4"><b>Atualizar Sistema</b></font> 

<hr size=1 width="500" color="#000000" align="center">
<form method="post" action="{$smarty.server.PHP_SELF}" onSubmit="return confirm('Confirma as Atualizações do sistema?')">
  
    <input type="hidden" name="sessao" value="{$sessao}">
    <input type="hidden" name="oper" value="confirma">
    <font color="#CC0000" face="arial" size="2"> <b>Atenção !!!</b> </font><br>
    <br><font face="arial" size="2">
    A atualização do sistema consiste em: 
    <ol>
      <li>Realizar backups das configurações atuais.</li>
      <li>Gerar novas configurações.</li>
      <li>Reiniciar as regras do PF</li>
      <li>Atualizar a tabela de MAC vs IP.</li>
      <li>Reiniciar o serviço de controle de banda.</li>
      <li>Atualizar informações do MRTG.</li>
    </ol>
    Informações cadastradas erroneamente podem comprometer o funcionamento do 
    serviço.<br>
    <br>
    <input type="hidden" name="confirma" value="atualizar">
    <input type="submit" name="submit" value="Confirmar Atualização">
  
</form>
</font>
</td>
</tr>
</table>