<?
	/**
	 * Classe para registrar as modificações do sistema
	 * Autor: Andrei de Oliveira Mosman
	 * mosman@mosman.com.br / andreimosman@hotmail.com
	 */

	class logger {
	   function registra($bd,$uid,$tipoMensagem,$mensagem="") {
	      $sSQL  = "INSERT INTO ";
	      $sSQL .= "   lgtb_log(uid,ipaddr,tipo_mensagem,mensagem) ";
	      $sSQL .= "VALUES ( ";
	      $sSQL .= "'".$uid."',";
	      $sSQL .= "'".$_SERVER['REMOTE_ADDR']."',";
	      $sSQL .= "'".$tipoMensagem."',";
	      $sSQL .= "'".$mensagem."'";
	      $sSQL .= ")";
	      $bd->consulta($sSQL,false);
	   }
	}

?>