<?
	/*
	 * Classe de Acesso ao Banco de Dados :)
	 */


	class bancodedados {
		/* Informações de conexão */
		var $iConexao = 0;
		var $sUser = "";
		var $sPass = "";
		var $sHost = "";
		var $sBase = "";
		var $bPcon = true;

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
			$sConn = "host=$h dbname=$b user=$u password=$p";
			if( $this->bPcon )
			{
				$this->iConexao = pg_pconnect( $sConn );
			} else {
				$this->iConexao = pg_Connect( $sConn );
			}
		}

		/* Não usada para pConnect */
		function desconecta()
		{
			if( $this->iConexao )
			{
				pg_Close( $this->iConexao );
			}
		}

		/*********************************************/

		function consulta( $sConsulta, $sRetorna = true )
		{
			$this->resultado = pg_exec( $this->iConexao, $sConsulta );

			if( !$this->resultado )
			{
				$this->iNumLinhas = 0;
			} else {
				$this->iNumLinhas = pg_numrows($this->resultado);
			}
			$this->iPonteiro = 0;
		}

		/* Retorna o registro atual ou null */
		function obtemProxima()
		{

			$retorno = "";
			if( $this->iPonteiro >= $this->iNumLinhas )
			{
				/* Não há o que ser retornado */
				$retorno = null;
				// echo "<br>oP: null<br>\n";
			} else {
				/* Fazendo o fetch e posicionando o ponteiro no registro seguinte */
				if( $this->iPonteiro <= ($this->iNumLinhas-1) )
				{
					$tmpReg = pg_fetch_array( $this->resultado, $this->iPonteiro++ );

					/* Processando o registro de retorno... */
					// echo "<br>oP: array<br>\n";
					$retorno = $tmpReg;
				} else {
					// echo "<br>oP: null 2<br>\n";
					$retorno = null;
				}
			}
			return($retorno);
		}

		function geraMatrizResultado()
		{
			$retorno = array();
			$tmpReg = $this->obtemProxima();
			while( $tmpReg != null )
			{
				// echo "<br>gMR: tmpReg not null<br>\n";
				$retorno[] = $tmpReg;
				$tmpReg = $this->obtemProxima();
			}
			return($retorno);
		}

		function obtemRegistros($sSQL)
		{
			consulta( $sSQL );
			return( geraMatrizResultado() );
		}


	}

?>
