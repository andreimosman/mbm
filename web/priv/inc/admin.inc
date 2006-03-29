<?

	/* Arquivo de template */
	$sArqTemplate = "altera_senha.tpl";

	
	$acao = @$_REQUEST["acao"];
	$sessLogin = @$_SESSION["sessLogin"];
	$oper = @$_REQUEST["oper"];
	$userAdmin = $_SESSION["sessLogin"];
	$uid = @$_REQUEST["uid"];
	
	$tplVars .= ",userAdmin";
	
if (!$oper){	
	
	$sSQL  = " SELECT ";
	$sSQL .= "   login, senha ";
	$sSQL .= " FROM ";
	$sSQL .= "   ustb_admin ";
	$sSQL .= " WHERE ";
	$sSQL .= "   login = '".$sessLogin."' ";
	
	//echo "SQL: $sSQL <br>";
	
	$logado = $bd->obtemRegistros( $sSQL );
	
	$userAdmin = $logado[0]["login"];
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
		
		$sArqTemplate = "senha_alterada.tpl";
		
	
	}

}else if ($oper == "admin"){
	
	$sessTipoConta = $_SESSION["sessTipoConta"];
	//echo "Nivel: $sessTipoConta <br>";
	
	if ($sessTipoConta != "/"){
		$mensagem = "Você não tem Privilégio para<br>acessar esta Sessão";
		$priv = "nao";
		$tplVars .= ",mensagem,priv";
		$sArqTemplate = "cadastra_usuarios_ok.tpl";
		return;
		
	} else if ($sessTipoConta == "/"){


		$login = @$_REQUEST["login"];
		$subsessao = @$_REQUEST["subsessao"];
		$acao = @$_REQUEST["acao"];
		
	
	
		$sSQL  = "SELECT ";
		$sSQL .= "uid, login, senha, tipo_conta ";
		$sSQL .= "FROM ";
		$sSQL .= "ustb_admin ";
		$sSQL .= "WHERE status = 't' ";
		$sSQL .= "ORDER BY login ASC";

		$ls_usuarios = $bd->obtemRegistros( $sSQL );
		//echo "sql: $sSQL <br>";

		$tplLoops[] = "ls_usuarios";

		$tplVars .= ",userAdmin,sessao,oper,msg,tipo_conta";
		$sArqTemplate = "lista_usuarios.tpl";
		
	if ($subsessao == "cadastrar"){
	
	
		if (!$login){
		$msg = "Cadastrar";
		}else{
		$msg = "Alterar";
		}
		/*if (!$uid){
		$acao = "cad";
		$msg = "Cadastrar";
		}else{
		$acao = "alt";
		$msg = "Alterar";
		}*/
		
		$tplVars .= ",msg";
		if (!$login ){
			
			$msg = "Cadastrar";
			$sArqTemplate = "cadastra_usuarios.tpl";
		
		}else if ( $login && !$acao){
		//echo "SÓ SELECT<BR>";
			
			$sSQL  = "SELECT ";
			$sSQL .= "uid, login, senha, tipo_conta ";
			$sSQL .= "FROM ";
			$sSQL .= "ustb_admin ";
			$sSQL .= "WHERE login = '".$_REQUEST["login"]."' ";
			
			$ls_usuario = $bd->obtemRegistros( $sSQL );
		
			$uid = $ls_usuario[0]["uid"];
			$login = $ls_usuario[0]["login"]; 
			$senha = $ls_usuario[0]["senha"];
			$tipo_conta = $ls_usuario[0]["tipo_conta"];
		
			$tplVars .= ",login,senha,uid,tipo_conta";
			//echo "Tipo: $tipo_conta";
			
			$sArqTemplate = "altera_usuarios.tpl";
		
			
		}else if ($login && $acao){
		//echo "RECEBEU LOGIN E ACAO<BR>";
		
			if ($acao == "cad"){
			//ECHO "ACAO = CAD<BR>";

				$sSQL  = "INSERT INTO ";
				$sSQL .= " ustb_admin ";
				$sSQL .= " (login,senha,tipo_conta,status) ";
				$sSQL .= " VALUES ";
				$sSQL .= " ('".$_REQUEST["login"]."','".$_REQUEST["senha"]."','".$_REQUEST["tipo_conta"]."','t') ";
				//echo "";
				
				$mensagem = "Usuário cadastrado com Sucesso!";
				$bd->consulta($sSQL,false);
				//$msg = "Cadastrar";

				$tplVars .= ",msg,mensagem,login,senha,tipo_conta,senha,subsessao,acao";
				$sArqTemplate = "cadastra_usuarios_ok.tpl";
				return;

			} else if ($acao == "alt"){
			//ECHO "ACAO = ALT<BR>";
				$sSQL  = "UPDATE ";
				$sSQL .= "  ustb_admin ";
				$sSQL .= "SET ";
				$sSQL .= " senha ='".$_REQUEST["senha"]."', ";
				$sSQL .= " tipo_conta ='".$_REQUEST["tipo_conta"]."' ";
				$sSQL .= "WHERE ";
				$sSQL .= "uid = '".$_REQUEST["uid"]."' ";

				$mensagem = "Usuário alterado com Sucesso!";
				$bd->consulta($sSQL,false);
				//$msg = "Alterar";
				$tplVars .= ",msg,mensagem,login,senha,tipo_conta,senha,subsessao,acao";
				$sArqTemplate = "cadastra_usuarios_ok.tpl";


			}

		}
	}
	

			

	}	
}else if ($oper == "excluir"){

	$sSQL  = "UPDATE ";
	$sSQL .= " ustb_admin ";
	$sSQL .= "SET ";
	$sSQL .= " status = 'f' ";
	$sSQL .= "WHERE ";
	$sSQL .= " uid = '".$_REQUEST["uid"]."' ";
	

	$mensagem = "Usuário Excluido com Sucesso!";
	$bd->consulta($sSQL,false);
	$tplVars .= ",mensagem";
	$sArqTemplate = "cadastra_usuarios_ok.tpl";

	
	


}

	



?>
