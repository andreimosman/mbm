<?

	/* Arquivo de template */
	$sArqTemplate = $sDirTemplate."/altera_senha.tpl";

	
	$acao = @$_REQUEST["acao"];
	
	
	$sSQL  = " SELECT ";
	$sSQL .= "   login, senha ";
	$sSQL .= " FROM ";
	$sSQL .= "   ustb_admin ";
	$sSQL .= " WHERE ";
	$sSQL .= "   login = '".$sessLogin."' ";
	
	//echo "SQL: $sSQL <br>";
	
	$logado = $bd->obtemRegistros( $sSQL );
	
	$username = $logado[0]["login"];
	$senha = $logado[0]["senha"];
	//echo "USER: $username <br>";
	//echo "PASS: $senha <br>";
	
	if ($acao && $acao == "alt"){
	
		$sSQL  = "UPDATE ";
		$sSQL .= " ustb_admin ";
		$sSQL .= "SET ";
		$sSQL .= " login = '".$sessLogin."', ";
		$sSQL .= " senha = '".$_REQUEST["senha"]."' ";
		$sSQL .= "WHERE login = '".$sessLogin."' ";
		
		$bd->consulta($sSQL,false);
		
		$sArqTemplate = $sDirTemplate."/senha_alterada.tpl";
		
	
	}



	$tplVars = "username,senha,sessao,oper";



?>
