<?

	/*
	 * index.php
	 * Arquivo principal do sistema do MBM.
	 *-----------------------------------------------*
	 * CopyRight(c) Mosman Consultoria.
	 * Author: Andrei Mosman
	 * consultoria@mosman.com.br
	 */


	/* arquivo contendo as informações do path */
	require_once( "paths.inc" );

	/* configuracoes */
	require_once( $PATHS["etc"] . "/config.inc" );
	$versao_mbm = $MBM["versao"];


	/* Bibliotecas utilizadas */
	require_once( $PATHS["lib"] . "/classe_bancodedados.inc" );
	require_once( $PATHS["lib"] . "/class_template.inc" );
	require_once( $PATHS["lib"] . "/classe_logger.inc" );
	
	$logger = new logger;

	/* Procedimento iniciais utilizados */
	require_once( $PATHS["procedures"] . "/conecta_bd.inc" );
	

	// Definicoes basicas	
	$sessao = @$_GET['sessao'];
	$asParseLoop = array();
	
	
	
	
	$pgTPL = new template;
	$sDirTemplate = $PATHS["tpl"];
	$sArqTemplate = "";

	$tplLoops = array();
	$tplVars = "";

	$headerAlternativo = "";
	$footerAlternativo = "";

	$usarTemplates = 1;

	session_start();
	
	// Pega o nome do arquivo que está sendo chamado
	$tmpArr = explode("/",$PHP_SELF);
	$arquivoPHP = $tmpArr[count($tmpArr)-1];
	
	session_register("sessLogin");
	session_register("sessUID");
	session_register("sessTipoLogin");
	session_register("sessTipoConta");
	session_register("sessIPCli");

	//$arqCerto = ($arquivoPHP == "index.php" || $arquivoPHP = "") ? "C" : "A" ;
       $arqCerto = "A";
	 //echo "arqCerto: $arqCerto / sessTipoLogin: $sessTipoLogin <br>\n";
	 //echo "sessLogin: $sessLogin <br>\n";
	 //echo "arquivoPHP: $arquivoPHP<br>\n";
	 //echo "SELF: $SELF <br>\n";
	 //echo "PHP_SELF: $PHP_SELF <br>\n";

	if( $sessTipoLogin != $arqCerto && $sessLogin) {
		$sessao = "logout";
	}

	// Login do tipo cliente ou do tipo admin
	$sessTipoLogin = $arqCerto;

	if( $sessao == "login" ) {
	   // Verifica o usuario e a senha de acordo com o php que está sendo chamado
	   
	   if( $sessTipoLogin == "A" ) {
	      // Procedimentos de Login - Interface do Administrador
	      // echo "Interface do Administrador";
	      if( !trim($login) || !trim($senha) ) {
	         $sErro = "TODOS os campos são obrigatórios!!!";
	      } else {

	         $sSQL  = "SELECT ";
	         $sSQL .= "   uid,login,senha,tipo_conta ";
	         $sSQL .= "FROM ";
	         $sSQL .= "   ustb_admin ";
	         $sSQL .= "WHERE ";
	         $sSQL .= "   login = '".$login."' ";
	         $sSQL .= "   AND senha = '".$senha."' ";
	         
	         $resultado = $bd->obtemRegistros($sSQL);
	         //echo "SQL LOGIN: $sSQL <br>\n";
		 unset($sSQL);
	      
	         if( !count($resultado) ) {
	            $sErro = "Usuário inválido ou senha incorreta !!";
	         } else {
	            $sessLogin = $login;
	            $sessUID = $resultado[0]["uid"];
	            $sessTipoConta = $resultado[0]["tipo_conta"];
	            $logger->registra($bd,$sessUID,"LOGIN");
	            
	         }
	         unset($resultado);
	      }

	   } else {
	      // Procedimentos de Login - Interface do Cliente
	      if( !trim($login) || !trim($senha) ) {
	         $sErro = "TODOS os campos são obrigatórios!!!";
	      } else {
	      
	         $sSQL  = "SELECT ";
	         $sSQL .= "   username,senha,ipaddr ";
	         $sSQL .= "FROM ";
	         $sSQL .= "   bmtb_cliente ";
	         $sSQL .= "WHERE ";
	         $sSQL .= "   username ILIKE '".$login."' ";
	         $sSQL .= "   AND senha = '".$senha."' ";

	         $resultado = $bd->obtemRegistros($sSQL);
                 //echo "SQL LOGIN2: $sSQL <br>\n";
	         unset($sSQL);
	      
	         if( !count($resultado) ) {
	            $sErro = "Usuário inválido ou senha incorreta !!";
	         } else {
	            $sessLogin = $login;
	            $sessUID = $username;
	            $sessIPCli = $resultado[0]["ipaddr"]; // IP associado ao cliente
	         }
	         unset($resultado);
	      }

	   }

	}

	if( !$sessLogin || $sessao == "logout" ) {
	
	   // logout + tela de login
	   if($sessUID) $logger->registra($bd,$sessUID,"LOGOUT");
	   $sessLogin = "";
	   $sessUID = "";
	   $sessTipoLogin = "";
	   $sessTipoConta = "";
	   $sessIPCli = "";
	   $sArqTemplate = $PATHS["tpl"] . "/login.tpl";
	   $tplVars = "login";
	   $headerAlternativo = "vazio.tpl";
	   $footerAlternativo = "vazio.tpl";
	}
	
	
	if( $sessTipoLogin == "A") {
		// Interface do administrador
	

		// *************| Corpo do sistema |****************** //

		if( $sessao == "cadastroInterface" || $sessao == "alteracaoInterface" || $sessao == "listaInterfaces") {
			include( $PATHS["inc"] . "/cadastro_interface.inc" );
		} else if( $sessao == "cadastroServico" || $sessao == "alteracaoServico" || $sessao == "listaServicos") {
			include( $PATHS["inc"] . "/cadastro_servicos.inc" );
		} else if( $sessao == "cadastroIP" || $sessao == "alteracaoIP" || $sessao == "listaIPs") {
			include( $PATHS["inc"] . "/cadastro_ip.inc" );
		} else if( $sessao == "cadastroCliente" || $sessao == "alteracaoCliente" || $sessao == "listaClientes") {
			include( $PATHS["inc"] . "/cadastro_clientes.inc" );
		} else if( $sessao == "atualizarSistema" ) {
			include( $PATHS["inc"] . "/atualizar_configuracao.inc" );
		} else if( $sessao == "excluirInterface" || $sessao == "excluirServico" || $sessao == "excluirIP" || $sessao == "excluirCliente" ) {
			include( $PATHS["inc"] . "/excluir.inc" );
		} else if( $sessao == "suporte" ) {
			include( $PATHS["inc"] . "/suporte.inc" );
		} else if ( $sessao == "alterarSenha" ){
			include($PATHS["inc"] . "/admin.inc");
		} else if ($sessao == "pesquisaIPs"){
			include($PATHS["inc"] . "pesquisaIP.inc");
		} else {
			// include( $PATHS["inc"] . "/menu.inc" );
			include( $PATHS["inc"] . "/home.inc" );
		}
	} else if( $sessTipoLogin == "C" ) {
		// Interface do cliente
	        $headerAlternativo = "vazio.tpl"; // TODO: Colocar header do cliente aqui
	        $footerAlternativo = "vazio.tpl"; // TODO: Colocar footer do cliente aqui
	        
	        $ipaddr = $sessIPCli;

		if( $sessao == "login" ) {
		   // Redireciona o usuário para a página home
		   echo "<head><title>MBM - Estatísticas</title><meta http-equiv='refresh' content='0;$PHP_SELF?sessao=home'></head></script>";
		} else {
		   // Exibe a página home
		   $sArqTemplate = $PATHS["tpl"] . "/cliHome.tpl";
		}
		$tplVars .= "SELF,versao_mbm,ipaddr";
	}

	if( $usarTemplates ) {
		/* processa e exibe o(s) template(s) */
		$imgdir = "/imagens";
		if( $sArqTemplate ) require_once($PATHS["procedures"]."/processo_basico_template.inc");

		$tplVars .= "SELF,versao_mbm";


		/***************************************************/

		$pgTPL->load_file("header", ($headerAlternativo ? $sDirTemplate . "/" .$headerAlternativo : $sDirTemplate."/header.tpl") );
		$pgTPL->load_file("footer", ($footerAlternativo ? $sDirTemplate . "/" .$footerAlternativo : $sDirTemplate."/footer.tpl") );

		$pgTPL->register("header", $tplVars);
		$pgTPL->parse("header");
		$pgTPL->register("footer", $tplVars);
		$pgTPL->parse("footer");

		$pgTPL->print_file("header",$tplVars);

		/**
		 * Conteúdo (Gerado pelos includes)
		 */
		if( $sArqTemplate ) $pgTPL->print_file("base");

		$pgTPL->print_file("footer",$tplVars);
	}

	/* Procedimento finais utilizados */
	require_once( $PATHS["procedures"] . "/desconecta_bd.inc" );

?>