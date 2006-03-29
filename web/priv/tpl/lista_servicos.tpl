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
            <font face="arial" size="4">Servi&ccedil;os<br />
            </font></p>
          <table width="600" border="0" cellspacing="5" cellpadding="0">
            <tr>
              <td align="center"><div align="center"><a href="{$smarty.server.PHP_SELF}?sessao=cadastroServico"><font face="arial" size="-1">para
                      cadastrar um servi&ccedil;o clique aqui</font></a> </div>
                <hr size="1" width="500" color="#000000" align="center" />
                <div align="center">
                  <table border="0" cellspacing="0" width="500">
                    <tr bgcolor="#AAAAAA">
                      <td bgcolor="#95AFBD"><font face="arial"><b>servi&ccedil;o</b></font></td>
                      <td bgcolor="#95AFBD"><font face="arial"><b>porta</b></font></td>
                      <td bgcolor="#95AFBD">&nbsp;</td>
                    </tr>
                    <loop name="lista_servicos">
                      <tr bgcolor="{$bgcolor}">
                        <td><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoServico&servico={$servico}"><font face="arial" size="-1">{$servico}</font></td>
                        <td><a href="{$smarty.server.PHP_SELF}?sessao=alteracaoServico&servico={$servico}"><font face="arial" size="-1">{porta}</font></td>
                        <td><a href="{$smarty.server.PHP_SELF}?sessao=excluirServico&amp;servico={$servico}"><img border="0" src="imagens/lixo.gif" width="15" height="16" alt="Excluir!!!" /></a></td>
                      </tr>
                    </loop name="lista_servicos">
                  </table>
                  <font color="#FF0000" face="arial">{$nenhum}</font>
                  </center>
                </div>
                <div align="center"></div></td></tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
