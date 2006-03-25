<?
   /**
    * home.inc
    * Home do site
    * CopyRight(c) 2002 - Mosman Soluções
    * Autor; Andrei de Oliveira Mosman
    * Email: mosman@mosman.com.br / andreimosman@hotmail.com
    */
   $userAdmin = $_SESSION["sessLogin"];
   
   $tplVars = "SELF,versao_mbm,userAdmin";
   $versao_mbm = $MBM["versao"];

   $SELF = $PHP_SELF;
   $sArqTemplate = "home.tpl";

?>
