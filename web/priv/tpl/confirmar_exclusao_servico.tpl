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
            <font face="arial" size="4">Exclus&atilde;o de Servi&ccedil;os </font><br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><form method="post" action="{$smarty.server.PHP_SELF}" onsubmit="return confirm('Confirma a exclus&atilde;o do Servi&ccedil;o?')">
                <input type="hidden" name="sessao" value="{$sessao}" />
                <input type="hidden" name="oper" value="confirma" />
                <input type="hidden" name="servico" value="{$servico}" />
                <font color="red" face="arial" size="2"><b>Aten&ccedil;&atilde;o
                !!!</b></font> <br />
                <br />
                <font size="2" face="arial"> Os clientes abaixo tem controle
                de banda pelo servi&ccedil;o selecionado (<i>{$servico}</i>): </font>
                <ol>
                  <font size="2" face="arial">
                    <loop name="clientes"> </loop name="clientes">
                    <loop name="clientes"></loop name="clientes">
                    </font><font face="arial">
                      <loop name="clientes"></loop name="clientes">
                      </font>
                </ol>
                <ol>
                  <font face="arial">
                    <loop name="clientes">
                    <li> <font size="2">{$username}</font> </li>
                    </loop name="clientes">
                    </font>
                </ol>
                <font size="2" face="arial">A exclus&atilde;o ir&aacute; excluir
                a limita&ccedil;&atilde;o de banda do servi&ccedil;o (<i>{$servico}</i>)
                nestes clientes.<br />
      <br />
      <input type="hidden" name="confirma" value="excluir" />
      <input type="submit" name="submit" value="Confirmar exclus&atilde;o do servi&ccedil;o" />
                </font> <br />
                <br />
                <a href="{$smarty.server.PHP_SELF}?sessao=listaServicos">voltar</a>
              </form></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
