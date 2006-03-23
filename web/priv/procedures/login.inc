<?
	require_once( $PATHS["lib"] . "/midlib_sql.inc" );
	require_once( $PATHS["lib"] . "/functions_cadastro.inc" );

	/* Faz o login no banco de dados ou mostra a box de login */
	$sErroLogin = "";

	$arqBoxLogin = $sDirTemplate."/login.tpl";

	if( $sessao == "fazlogin" )
	{
		$sessLogin = "";
		$sessSenha = "";
		if( !$login || !$senha )
		{
			$sErroLogin = "Você precisa entrar com o usuario e a senha";
		} else {
			// Valida o usuario
			if( verificaUsuarioSenha($login,$senha) )
			{
				// Usuario e senha OK :)) Fazer o login :)
				session_register("sessLogin");
				session_register("sessSenha");

				$sessLogin = $login;
				$sessSenha = $senha;

				$arqBoxLogin = $sDirTemplate."/logado.tpl";
			} else {
				$sErroLogin = "Usuário invalido ou senha incorreta";
			}
		}
	} else if ($sessao == "logout" ) {
		$sessLogin = "";
		$sessSenha = "";

		session_unregister("sessLogin");
		session_unregister("sessSenha");

	} else {

		if( $sessLogin && $sessSenha )
		{
			/* Exibir Box do Usuário Logado */
			$arqBoxLogin = $sDirTemplate."/logado.tpl";
		} else {
			/* Exibir Box para Login */
		}

	}

	/* Gerando o HTML */
	$pgTPL->load_file("login", $arqBoxLogin );
	$pgTPL->register("login","imgdir");
	$imgdir = "/imagens";
	$BOXLOGIN = $pgTPL->pget("login","imgdir,sErroLogin,sessLogin");
?>