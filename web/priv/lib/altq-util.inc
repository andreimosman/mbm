<?

   /**
    * altq-util.inc
    * Funcoes utilizadas para manipular dados relevantes ao altqd.
    * Autor: Andrei de Oliveira Mosman (mosman@mosman.com.br)
    */

   function obtemAlvo( $ip ) {
      if( strstr( $ip, "/" ) ) {
         // É uma rede
         list( $endIP, $bitsMask ) = explode( "/", $ip, 2 );

         if( $bitsMask == 32 ) return $endIP;
         if( $bitsMask == 0 ) return "0.0.0.0 newmask 0x00000000";

         $Bmascara = str_repeat("1", $bitsMask ) . str_repeat( "0", 32 - $bitsMask );
         $Hmascara = "0x" . dechex( bindec( $Bmascara ) );
         return $endIP . " netmask " . $Hmascara;

      } else {
         return($ip);
      }
   }

   function bandaBPS( $banda, $tipoBanda ) {
      return( $banda * ($tipoBanda=='M'?1024^2:$tipoBanda=='K'?1024:1) );
   }

   function checaBandaSuficiente( $bandaLink, $tipoBandaLink, $arrBandaServicos ) {
      $bandaBits = bandaBPS( $bandaLink, $tipoBandaLink );
      
      $bandaSevicos = 0;
      for($x=0;$x<count($arrBandaServicos);$x++) $bandaServicos += bandaBPS( $arrBandaServicos[$x]["banda"], $arrBandaServicos[$x]["tipo_banda"]);
      
      return( $bandaBits > $bandaServicos );
   }

?>
