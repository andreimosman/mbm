{literal}
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
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
        <td align="center"><center>
          <p><br />
            <img src="imagens/clientes.gif" width="400" height="50" /><br />
          </p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><form action="{$smarty.server.PHP_SELF}" method="post" name="form" id="form" onsubmit="return checaFormulario();">
                <div align="center">
                  <input type="hidden" name="sessao" value="{$sessao}" />
                  <input type="hidden" name="oper" value="{$oper}" />
                  <input type="hidden" name="us_orig" value="{$us_orig}" />
                  <font face="arial" size="-1" color="#CC0000"><b>{$sErro}</b></font> <font face="arial" size="-1" color="#000066"><b>{$sMensagem}</b></font>
                  <table border="0" width="600">
                    <tr>
                      <td width="140"><font face="arial" size="-1"><b>Username:</b></font></td>
                      <td colspan="3" align="left"><input name="username" type="text" value="{$username}" size="40" maxlength="15" /></td>
                    </tr>
                    <tr>
                      <td width="140"><font face="arial" size="-1"><b>Senha:</b></font></td>
                      <td colspan="3" align="left"><input type="text" name="senha" value="{$senha}" maxlength="15" /></td>
                    </tr>
                    <tr>
                      <td width="140"><font face="arial" size="-1"><b>Host PPPoE:</b></font></td>
                      <td colspan="3" align="left">{$pppoe_select}</td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>IP:</b></font></td>
                      <td colspan="3" align="left"><font face="arial" size="-1" color="red"><b>{$ip_select}</b></font></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>MAC:</b></font></td>
                      <td colspan="3" align="left"><input type="text" name="mac" value="{$mac}" maxlength="17" /></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Status:</b></font></td>
                      <td colspan="3" align="left"><input type="radio" name='status' value='A' class="checkbox2" {$status_ck1} />
                          <font face="arial" size="-1" color="#009900">Ativo</font>
                          <input type="radio" name='status' value='B' class="checkbox2" {$status_ck2} />
                          <font face="arial" size="-1" color="#990000">Bloqueado</font></td>
                    </tr>
                    <tr>
                      <td><span class="style1">POP</span></td>
                      <td colspan="3" align="left"><label>
                        <select name="pop">
                          <option value=""></option>
                          
		  {foreach item=a from=$ls_pop }
            
                          <option value="{$a.id_pop}" {if $a.id_pop==$pop}SELECTED{/if}>{$a.nome_pop}</option>
                          
          {/foreach}
		  
                        </select>
                      </label></td>
                    </tr>
                    <tr>
                      <td colspan="4"><hr size="1" /></td>
                    </tr>
                    <!-- DADOS CADASTRAIS: In&iacute;cio -->
                    <tr>
                      <td><font face="arial" size="-1"><b>Nome/Razao Social:</b></font></td>
                      <td colspan="3" align="left"><input name="nome_razao" type="text" value="{$nome_razao}" size="50" maxlength="50" /></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Pessoa:</b></font></td>
                      <td colspan="3" align="left"><font face="arial" size="-1">
                        <input type="radio" name='tp_pessoa' value='F' class="checkbox2" {$tp_pessoa_ck1} />
                        F&iacute;sica
                        <input type="radio" name='tp_pessoa' value='J' class="checkbox2" {$tp_pessoa_ck2} />
                        Jur&iacute;dica</font></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>CPF/CNPJ:</b></font></td>
                      <td align="left"><input type="text" name="cpf_cnpj" value="{$cpf_cnpj}" maxlength="25" /></td>
                      <td align="left"><font face="arial" size="-1"><b>RG/IE:</b></font></td>
                      <td align="left"><input type="text" name="rg_ie" value="{$rg_ie}" maxlength="25" /></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Endere&ccedil;o:</b></font></td>
                      <td align="left"><input type="text" name="logradouro" value="{$logradouro}" maxlength="25" />
                        n&ordm;
                        <input type="text" name="numero" value="{$numero}" maxlength="8" size="4" /></td>
                      <td align="left"><font face="arial" size="-1"><b>Complemento:</b></font></td>
                      <td align="left"><input type="text" name="complemento" value="{$complemento}" maxlength="20" size="8" /></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Bairro:</b></font></td>
                      <td align="left"><input type="text" name="bairro" value="{$bairro}" maxlength="25" /></td>
                      <td align="left">&nbsp;</td>
                      <td align="left">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Cidade:</b></font></td>
                      <td align="left"><input type="text" name="cidade" value="{$cidade}" maxlength="25" /></td>
                      <td align="left"><font face="arial" size="-1"><b>UF:</b></font></td>
                      <td align="left">{$uf_select}</td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>CEP:</b></font></td>
                      <td colspan="3" align="left"><input type="text" name="cep" value="{$cep}" maxlength="9" size="9" /></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Fone:</b></font></td>
                      <td colspan="3" align="left"><input type="text" name="fone" value="{$fone}" maxlength="20" /></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Data da Ativa&ccedil;&atilde;o:</b></font></td>
                      <td colspan="3" align="left"><input type="text" name="dt_ativacao" value="{$dt_ativacao}" maxlength="10" />
                          <small> (dd/mm/aaaa)</small></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Resp. T&eacute;cnico:</b></font></td>
                      <td colspan="3" align="left"><input type="text" name="resp_tecnico" value="{$resp_tecnico}" maxlength="25" /></td>
                    </tr>
                    <tr>
                      <td><font face="arial" size="-1"><b>Email:</b></font></td>
                      <td colspan="3" align="left"><input type="text" name="email" value="{$email}" maxlength="255" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="3" align="left">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><font face="arial" size="-1"><b>Observa&ccedil;&otilde;es:</b></font></td>
                      <td align="left"><font face="arial" size="-1">
                          <textarea name="observacoes" cols="40" rows="10">{$observacoes}</textarea></td>
                      <td colspan="2" align="left" valign="top"><table width="300" border="0" cellspacing="2" cellpadding="2">
                          <tr>
                            <td align="right"><font face="arial" size="-1"><b>Comodato:</b></font></td>
                            <td><font face="arial" size="-1">
                              <input type="radio" name='flg_comodato' value='t' class="checkbox2" {$flg_comodato_ck1} />
                              Sim
                              <input type="radio" name='flg_comodato' value='f' class="checkbox2" {$flg_comodato_ck2} />
                              N&atilde;o</font></td>
                          </tr>
                          <tr>
                            <td align="right"><font face="arial" size="-1"><b>ISP
                                  ou Gateway:</b></font></td>
                            <td><font face="arial" size="-1">
                              <input type="radio" name='flg_gw_isp' value='t' class="checkbox2" {$flg_gw_isp_ck1} />
                              Sim
                              <input type="radio" name='flg_gw_isp' value='f' class="checkbox2" {$flg_gw_isp_ck2} />
                              N&atilde;o</font></td>
                          </tr>
                          <tr>
                            <td align="right"><font face="arial" size="-1"><b>Conex&atilde;o
                                  via:</b></font></td>
                            <td><font face="arial" size="-1">
                              <input type="radio" name='tipo_conexao' value='R' class="checkbox2" {$tipo_conexao_ck1} />
                              R&aacute;dio
                              <input type="radio" name='tipo_conexao' value='C' class="checkbox2" {$tipo_conexao_ck2} />
                              Cabo</font></td>
                          </tr>
                      </table></td>
                    </tr>
                    <!-- DADOS CADASTRAIS: Fim -->
                    <tr>
                      <td colspan="4"><hr size="1" /></td>
                    </tr>
                    <tr>
                      <td align="right">&nbsp;</td>
                      <td colspan="3" align="left"><input type="submit" name="submit" value="{$submit}" /></td>
                    </tr>
                  </table>
                </div>
              </form></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
