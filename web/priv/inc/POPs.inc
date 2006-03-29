<?
	
	$subsessao = @$_REQUEST["subsessao"];
	$acao = @$_REQUEST["acao"];
	$userAdmin = $_SESSION["sessLogin"];
	
	
	if (!$subsessao){
	$sSQL  = "SELECT ";
	$sSQL .= "id_pop, nome_pop ";
	$sSQL .= "FROM ";
	$sSQL .= "bmtb_pop ";
	$sSQL .= "ORDER BY nome_pop ASC";
	
	$ls_pop = $bd->obtemRegistros( $sSQL );
	$tplVars .= ",ls_pop,userAdmin";
	$sArqTemplate = "lista_pop.tpl";
	
	
	}else if ($subsessao == "cadastro"){
	
		$oper = @$_REQUEST["oper"];
		$acao = @$_REQUEST["acao"];
		$id_pop = @$_REQUEST["id_pop"];
		
			
		if ($id_pop){
			
			$enviando = true;
			
		}else{
			
			$enviando = false;
			$msg = "Cadastrar";
			$tplVars .= ",msg,userAdmin";
			$sArqTemplate = "cadastra_pop.tpl";

		
		}
		
		if ($id_pop && !$acao){
		//ECHO "ALTERANDO POP";
			$sSQL  = "SELECT ";
			$sSQL .= "id_pop, nome_pop ";
			$sSQL .= "FROM ";
			$sSQL .= "bmtb_pop ";
			$sSQL .= "WHERE ";
			$sSQL .= "id_pop = '".$_REQUEST["id_pop"]."' ";

			$ls_pop = $bd->obtemRegistros( $sSQL );
			
			$id_pop = $ls_pop[0]["id_pop"];
			$nome_pop = $ls_pop[0]["nome_pop"];
			//echo "id: $id_pop <br>";
			//echo "nome: $nome_pop <br>";
			
			$titulo = "Alterar";
			$tplVars .= ",ls_pop,titulo,id_pop,nome_pop,userAdmin";
			$sArqTemplate = "altera_pop.tpl";
			
		
		}else if ($id_pop && $acao){	
			
			
			if($acao == "alt"){
			//echo "ALTERANDO POP agora de verdade";
				$sSQL  = "UPDATE ";
				$sSQL .= "bmtb_pop ";
				$sSQL .= "SET nome_pop = '".$_REQUEST["nome_pop"]."' ";
				$sSQL .= "WHERE id_pop = '".$_REQUEST["id_pop"]."' ";
				
				$bd->consulta($sSQL,false);
				
				$mensagem = "POP alterada com sucesso";
				$tplVars .= ",mensagem,userAdmin";
				$sArqTemplate = "pop_ok.tpl";
				return;
			
			}else if (!$acao){
			
				$titulo = "Cadastrar";
				$tplVars .= ",titulo";
				$sArqTemplate = "cadastra_pop.tpl";
				
			}	
		
		}else if (!$id_pop && $acao == "cad"){
		//echo "INSERINDO NOVO POP";
				$sSQL  = "INSERT INTO ";
				$sSQL .= "bmtb_pop ";
				$sSQL .= "(nome_pop) ";
				$sSQL .= "VALUES";
				$sSQL .= "('".$_REQUEST["nome_pop"]."') ";
							
				$bd->consulta($sSQL,false);
							
				$mensagem = "POP cadastrada com sucesso";
				$tplVars .= ",mensagem,userAdmin";
				$sArqTemplate = "pop_ok.tpl";
			
		
		}
	

	
	}else if ($subsessao == "excluir"){
	
		$sSQL  = "UPDATE ";
		$sSQL .= " bmtb_cliente ";
		$sSQL .= "SET ";
		$sSQL .= "pop = NULL ";
		$sSQL .= "WHERE ";
		$sSQL .= "pop = '".$_REQUEST["id_pop"]."' ";
		
		$bd->consulta($sSQL,false);
	
		$sSQL  = "DELETE FROM ";
		$sSQL .= "bmtb_pop ";
		$sSQL .= "WHERE ";
		$sSQL .= "id_pop = '".$_REQUEST["id_pop"]."' ";
		
		$bd->consulta($sSQL,false);

		$sSQL  = "SELECT ";
		$sSQL .= "id_pop, nome_pop ";
		$sSQL .= "FROM ";
		$sSQL .= "bmtb_pop ";

		$ls_pop = $bd->obtemRegistros( $sSQL );



		$tplVars .= ",ls_pop,userAdmin";
		$sArqTemplate = "lista_pop.tpl";


		
	
	}
	
	





?>