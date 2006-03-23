<?

	class bancodedados {
		/* Informações de conexão */
		var $iConexao = 0;
		var $sUser = "";
		var $sPass = "";
		var $sHost = "";
		var $sBase = "";
		var $bPcon = true;
		
		/* Erro */
		var $sErro = "";

		/* Informações de Resultado */
		var $resultado = 0;
		var $iNumLinhas = 0;

		/* navegando no resultado */
		var $iPonteiro = 0;		/* Ponteiro não inicializado */

		/***********| Funções de Conexão |***********/
		function conecta( $u, $s, $h, $b, $p = true )
		{

			$this->sUser = $u;
			$this->sPass = $s;
			$this->sHost = $h;
			$this->sBase = $b;

			if( $this->bPcon )
			{
				$this->iConexao = mysql_pconnect( $h, $u, $s );
			} else {
				$this->iConexao = mysql_connect( $h, $u, $s );
			}
			mysql_selectdb($b,$this->iConexao);
		}

		/* Não usada para pConnect */
		function desconecta()
		{
			if( $this->iConexao )
			{
				mysql_close( $this->iConexao );
			}
		}

		/*********************************************/

		function consulta( $sConsulta, $sRetorna = true )
		{
			$this->sErro = "";
			$this->resultado = mysql_query( $sConsulta, $this->iConexao );

			if( !$this->resultado )
			{
				$this->sErro = mysql_error($this->iConexao);
				$this->iNumLinhas = 0;
			} else {
				if( $sRetorna )
					$this->iNumLinhas = mysql_num_rows($this->resultado);
				else
					$this->iNumLinhas = mysql_affected_rows($this->iConexao);
			}
			$this->iPonteiro = 0;
		}

		/* Retorna o registro atual ou null */
		function obtemProxima()
		{

			$retorno = "";
			// echo "Ponteiro: " . $this->iPonteiro . " | NumLinhas: "  . $this->iNumLinhas . "\n";
			if( $this->iPonteiro >= $this->iNumLinhas )
			{
				/* Não há o que ser retornado */
				$retorno = null;
				// echo "<br>oP: null<br>\n";
			} else {
				/* Fazendo o fetch e posicionando o ponteiro no registro seguinte */
				if( $this->iPonteiro <= ($this->iNumLinhas-1) )
				{
					$tmpReg = mysql_fetch_array( $this->resultado ); 
					$this->iPonteiro++;

					/* Processando o registro de retorno... */
					$retorno = $tmpReg;
				} else {
					$retorno = null;
				}
			}
			return($retorno);
		}

		function geraMatrizResultado()
		{
			$retorno = array();
			$tmpReg = $this->obtemProxima();
			//echo "R: $tmpReg \n";
			//echo "C: ".count($tmpReg)."\n";
			$x=0;
			while( $tmpReg != null ) // $this->iPonteiro < $this->iNumLinhas )  // != null
			{
				// echo "<br>gMR: tmpReg not null<br>\n";

				$retorno[$x++] = $tmpReg;
				$tmpReg = $this->obtemProxima();
				
			}
			return($retorno);
		}

		function obtemRegistros($sSQL)
		{
			$this->consulta( $sSQL );
			return( $this->geraMatrizResultado());
		}
		/* Retorna o ultimo ID de um Insert */
		function obtemID() {
		   return( mysql_insert_id(  ) );
		}


	}

?>
