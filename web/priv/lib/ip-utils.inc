<?
   /**
    * ip-utils.inc
    * Funções para validação de IPs
    * CopyRight(c) Andrei de Oliveira Mosman (mosman@mosman.com.br)
    * Todos os Direitos Reservados
    */
   
   /**
    * Retorna "" caso o endereço da rede esteja OK ou o endereço de rede corrigido.
    */
   function enderecoRede($ip) {
      // Não é endereço de rede, e sim IP.
      if(!strstr($ip,"/") ) return "";
      
      $arrEnd = explode("/", $ip);
      
      // Deve conter exatamente uma barra.
      if( count($arrEnd) != 2 ) return "";
      
      // Eh host
      if( $arrEnd[1] == 32 ) return "";
      
      $arrIP = explode(".", $arrEnd[0]);
      
      $binIP = "";
      
      for($x=0;$x<count($arrIP);$x++) {
         $bin = decbin($arrIP[$x]);
         $binIP .= str_repeat("0", 8-strlen($bin)).$bin;
      }
      
      $binMask = str_repeat("1", $arrEnd[1]) . str_repeat("0", 32-$arrEnd[1] );
      
      $ipRede = $binIP & $binMask;
      
      // Controi o novo endereço
      $parte1 = bindec( substr( $ipRede, 0, 8 ) );
      $parte2 = bindec( substr( $ipRede, 8, 8 ) );
      $parte3 = bindec( substr( $ipRede, 16, 8 ) );
      $parte4 = bindec( substr( $ipRede, 24, 8 ) );
      
      $endRede = "$parte1.$parte2.$parte3.$parte4"."/".$arrEnd[1];
      
      if( $endRede == $ip ) return "";

      // Retorna o endereço corrigido.
      return( $endRede );
      
   }
?>