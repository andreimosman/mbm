<?
	/*
	 * Biblioteca intermediaria de acesso ao SQL
	 * algumas fun��es �teis ficam aqui :)
	 */

	function obtemRegistros($sSQL)
	{
		global $bd;
		$bd->consulta( $sSQL );
		return( $bd->geraMatrizResultado() );
	}

?>
