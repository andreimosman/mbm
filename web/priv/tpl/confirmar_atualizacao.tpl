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
          <font size="4" face="arial">Atualizar Sistema </font>
          <br />
</p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><form method="post" action="{$smarty.server.PHP_SELF}" onsubmit="return confirm('Confirma as Atualiza&ccedil;&otilde;es do sistema?')">
                <input type="hidden" name="sessao" value="{$sessao}" />
                <input type="hidden" name="oper" value="confirma" />
                <font color="#CC0000" face="arial" size="2"> <b>Aten&ccedil;&atilde;o
                !!!</b> </font><br />
                <br />
                <font face="arial" size="2"> A atualiza&ccedil;&atilde;o do sistema
                consiste em:
                <ol>
                  <li>Realizar backups das configura&ccedil;&otilde;es atuais.</li>
                  <li>Gerar novas configura&ccedil;&otilde;es.</li>
                  <li>Reiniciar as regras do PF</li>
                  <li>Atualizar a tabela de MAC vs IP.</li>
                  <li>Reiniciar o servi&ccedil;o de controle de banda.</li>
                  <li>Atualizar informa&ccedil;&otilde;es do MRTG.</li>
                </ol>
                Informa&ccedil;&otilde;es cadastradas erroneamente podem comprometer
                o funcionamento do servi&ccedil;o.<br />
      <br />
      <input type="hidden" name="confirma" value="atualizar" />
      <input type="submit" name="submit" value="Confirmar Atualiza&ccedil;&atilde;o" />
              </form></td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
