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
              <td align="center"><font color="red" face="arial" size="2"><b>Exclus&atilde;o
                    realizada com sucesso !!!</b> </font> <br />
  <br />
  <font size="2" face="arial"> Servi&ccedil;o eliminado: <i>{$servico}</i> <br />
  <br />
  <br />
A exclus&atilde;o eliminou automaticamente a limita&ccedil;&atilde;o de banda
do servi&ccedil;o (<i>{$servico}</i>) nos seguintes clientes: </font>
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
  <br />
  <br />
  <font face="arial" size="2"> <a href="{$smarty.server.PHP_SELF}?sessao=listaServicos">voltar</a> </font> <font face="arial" size="2">&nbsp;</font> </td>
            </tr>
          </table>
          <p></p>
        </center>          </td>
      </tr>
    </table></td>
  </tr>
</table>
