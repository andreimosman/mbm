<?
	/* Cria um campo do tipo select <SELECT */
	function criaListaSelect($nome, $aDados, $selecionado = null, $itemzero = 1 )
	{
		$retorno =  "<SELECT name='$nome'>\n";
		
		if($itemzero) $retorno .= "<OPTION VALUE=''></OPTION>\n";
		for($x=0;$x<count($aDados);$x++)
		{
			$valor = $aDados[$x]["id"];
			$texto = $aDados[$x]["nome"];
			$chk = "";
			if( $selecionado != null )
			{
				if( strtolower( $selecionado ) == strtolower( $valor ) )
				{
					$chk = " SELECTED ";
				}

			}
			$retorno .= "<OPTION VALUE='$valor' $chk>$texto</OPTION>\n";
		}
		$retorno .= "</SELECT>\n";
		return( $retorno );
	}

	/* Lista de Estados */
	$lsEstados[0]["id"] = "AC";
	$lsEstados[0]["nome"] = "Acre";
	$lsEstados[1]["id"] = "AL";
	$lsEstados[1]["nome"] = "Alagoas";
	$lsEstados[2]["id"] = "AM";
	$lsEstados[2]["nome"] = "Amazonas";
	$lsEstados[3]["id"] = "AP";
	$lsEstados[3]["nome"] = "Amapá";
	$lsEstados[4]["id"] = "BA";
	$lsEstados[4]["nome"] = "Bahia";
	$lsEstados[5]["id"] = "CE";
	$lsEstados[5]["nome"] = "Ceará";
	$lsEstados[6]["id"] = "DF";
	$lsEstados[6]["nome"] = "Distrito Federal";
	$lsEstados[7]["id"] = "ES";
	$lsEstados[7]["nome"] = "Espírito Santo";
	$lsEstados[8]["id"] = "GO";
	$lsEstados[8]["nome"] = "Goiás";
	$lsEstados[9]["id"] = "MA";
	$lsEstados[9]["nome"] = "Maranhão";
	$lsEstados[10]["id"] = "MT";
	$lsEstados[10]["nome"] = "Mato Grosso";
	$lsEstados[11]["id"] = "MS";
	$lsEstados[11]["nome"] = "Mato Grosso do Sul";
	$lsEstados[12]["id"] = "MG";
	$lsEstados[12]["nome"] = "Minas Gerais";
	$lsEstados[13]["id"] = "PA";
	$lsEstados[13]["nome"] = "Pará";
	$lsEstados[14]["id"] = "PB";
	$lsEstados[14]["nome"] = "Paraíba";
	$lsEstados[15]["id"] = "PR";
	$lsEstados[15]["nome"] = "Paraná";
	$lsEstados[16]["id"] = "PE";
	$lsEstados[16]["nome"] = "Pernambuco";
	$lsEstados[17]["id"] = "RJ";
	$lsEstados[17]["nome"] = "Rio de Janeiro";
	$lsEstados[18]["id"] = "RN";
	$lsEstados[18]["nome"] = "Rio Grande do Norte";
	$lsEstados[19]["id"] = "RS";
	$lsEstados[19]["nome"] = "Rio Grande do Sul";
	$lsEstados[20]["id"] = "RO";
	$lsEstados[20]["nome"] = "Rondônia";
	$lsEstados[21]["id"] = "RR";
	$lsEstados[21]["nome"] = "Rorâima";
	$lsEstados[22]["id"] = "SC";
	$lsEstados[22]["nome"] = "Santa Catarina";
	$lsEstados[23]["id"] = "SP";
	$lsEstados[23]["nome"] = "São Paulo";
	$lsEstados[24]["id"] = "SE";
	$lsEstados[24]["nome"] = "Sergipe";
	$lsEstados[25]["id"] = "TO";
	$lsEstados[25]["nome"] = "Tocantins";

?>
