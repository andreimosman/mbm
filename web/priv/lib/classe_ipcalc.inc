<?
	/**
	 * Classe para calcular IPs
	 * Autor: Andrei de Oliveira Mosman
	 * mosman@mosman.com.br / andreimosman@hotmail.com
	 */

	class ipCalc {
		var $endereco  = "";
		var $bitsMask  = 0;
		var $netmask   = "";
		var $network   = "";
		var $broadcast = "";
		var $minHost   = "";
		var $maxHost   = "";
		var $numHosts  = 0;
		
		/**
		 * Cria uma netmask à partir do número de bits da máscara
		 * Grava a netMask em $this->netmask e os bits da máscara em 
		 * $this->bitsMask. 
		 * retorna false no caso de erro.
		 */
		function criaNetmask($bm) {
		   $bm = (int) $bm;
		   if( $bm < 0 || $bm > 32 ) return false;
		   $this->bitsMask = $bm;
		   $this->netmask = str_pad( str_repeat("1", $bm), 32, "0", STR_PAD_RIGHT );
		   return(true);
		}
		
		/**
		 * Cria o número de bits da máscara à partir de uma netmask;
		 * Grava a netMask em $this->netmask e os bits da máscara em 
		 * $this->bitsMask. 
		 * retorna false no caso de erro.
		 */		
		function criaBitsMask($mascara) {
		   // Se a string conter mais de 15 caracteres não é válida
		   if( str_len($mascara) > 15 ) return false;

		   $elementos = explode(".",$mascara);
		   
		   // Se o treco tiver mais de 3 pontos (".") não é uma máscara válida
		   if( count($elementos != 4 ) return false;
		   
		   $regexVerifica = "^(d+)$";
		   
		   // flag para indicar que já encontrou um zero, isso significa que todos os 
		   // elementos devem ser zero;
		   encontroZero = 0;
		   
		   $strBits = "";

		   for($x=0;$x<4;$x++) {
		      if( str_len( $elementos[$x] ) > 3 ) return false;
		      if( !preg_match( $regexVerifica, $elementos[$x] ) ) return false;
		      
		      $binario = str_pad( decbin( (int) $elementos[$x] ), 8, "0", STR_PAD_LEFT );
		      
		      // Depois de encontrado um zero não pode haver mais uns ("1")
		      
		      if( $depoisDoZero && strstr( $elementos, "1" ) return false;
		      $depoisDoZero = strstr( $elementos[$x], "0" );
		      if( $depoisDoZero ) $encontrouZero = 1;
		      if( strstr($depoisDoZero, "1") ) return false;
		      
		      $strBits .= substr( $elementos[$x], 0, 8 - strlen( $depoisDoZero ) );
		   }
		   
		   $this->netmask = $mascara;
		   $this->bitsMask = strlen( $strBits );
		   
		   return true;
		}
	}

?>
