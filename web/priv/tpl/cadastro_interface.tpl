<script language="JavaScript">
{literal}

function verificaTipoPop() {
   formulario.id_pop_ap.disabled = formulario.tipo.value != "CL";
}

{/literal}
</script>
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
            <br />
              <img src="imagens/interfaces2.gif" width="400" height="50" />              <br />
</p>
          <form action="{$smarty.server.PHP_SELF}" method="post" name="form" id="form" onsubmit="return checaFormulario();">
            <div align="center">
              <input type="hidden" name="sessao" value="{$sessao}" />
              <input type="hidden" name="oper" value="{$oper}" />
              <input type="hidden" name="if_orig" value="{$if_orig}" />
              <font face="arial" size="-1" color="#990000"><b>{$sErro}</b></font> <font face="arial" size="-1" color="#000099"><b>{$sMensagem}</b></font>
              <table border="0" width="500">
                <tr>
                  <td width="111"><font face="arial" size="-1"><b>Interface:</b></font></td>
                  <td width="379" align="left"><input type="text" name="interface" value="{$interface}" size="4" maxlength="4" />
                    {$tp_if_select}</td>
                </tr>
                <tr>
                  <td><font face="arial" size="-1"><b>Banda:</b></font></td>
                  <td align="left"><input type="text" name="banda" value="{$banda}" size="4" maxlength="4" />
                    {$tp_banda_select}</td>
                </tr>
                <tr>
                  <td><font face="arial" size="-1"><b>Observa&ccedil;&atilde;o:</b></font></td>
                  <td align="left"><label>
                    <textarea name="observacao" cols="40" rows="5" id="observacao">{$observacao}</textarea>
                  </label></td>
                </tr>
                <tr>
                  <td><font face="arial" size="-1"><b>Habilitar NAT?</b></font> : </td>
                  <td align="left"><label>
                    <select name="nat" id="nat">
                      <option value="f" {if $nat == "f"}SELECTED{/if}>N&atilde;o</option>
                      <option value="t" {if $nat == "t"}SELECTED{/if}>Sim</option>
                    </select>
                  </label></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="left"><input type="submit" name="submit" value="{$submit}" /></td>
                </tr>
              </table>
            </div>
          </form>
          <p><a href="{$smarty.server.PHP_SELF}?sessao=listaInterfaces">voltar</a></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
