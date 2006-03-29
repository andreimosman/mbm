{literal}
<style type="text/css">
<!--
.style5 {font-family: Arial, Helvetica, sans-serif; font-weight: bold; font-size: 12px; }
.style8 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
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
            <font face="arial" size="4">Carga por POP </font><br />
          </p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><table width="500" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="125" height="20" bgcolor="#95AFBD"><span class="style5">id
                      - Nome</span></td>
                  <td width="125" bgcolor="#95AFBD"><span class="style5">Banda
                      Download </span></td>
                  <td width="150" bgcolor="#95AFBD"><span class="style5">Banda
                      Upload </span></td>
                  <td width="100" bgcolor="#95AFBD"><div align="center"><span class="style5">A&ccedil;&otilde;es</span></div></td>
                </tr>
                <tr>
                  <td colspan="4"> {foreach item=a from=$carga}
                    <table width="500" border="0" cellspacing="1" cellpadding="0">
                        <tr>
                          <td width="124"><span class="style8"> {$a.nome_pop}</span></td>
                          <td width="125"><span class="style8">{$banda_down}</span></td>
                          <td width="150"><span class="style8">{$banda_up}</span></td>
                          <td width="100"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td align="center" valign="middle"><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoCliente&amp;username={$a.username}"></a></td>
                                </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td colspan="4" bgcolor="#999999"><img src="imagens/pixel.gif" alt="." width="150" height="1" /></td>
                        </tr>
                      </table>
                    {/foreach} </td>
                </tr>
              </table></td>
            </tr>
          </table>
          </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
