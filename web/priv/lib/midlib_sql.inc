<?
	/*
	 * Biblioteca intermediaria de acesso ao SQL
	 * algumas funções úteis ficam aqui :)
	 */

	function obtemRegistros($sSQL)
	{
		global $bd;
		$bd->consulta( $sSQL );
		return( $bd->geraMatrizResultado() );
	}

?>
