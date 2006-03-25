<?

	/*
	 * Rotina que efetua o cadastro no sistema
	 */

	/* bibliotecas utilizadas */
	require_once( $PATHS["lib"] . "/midlib_sql.inc" );
	require_once( $PATHS["lib"] . "/functions_cadastro.inc" );
	require_once( $PATHS["lib"] . "/functions_html.inc" );
	
	// REQUEST parametros - INICIO
	$faz_cadastro = @$_REQUEST["faz_cadastro"];
	$username = @$_REQUEST["username"];
	$desejo = @$_REQUEST["desejo"];
	$dtNasc = @$_REQUEST["$dtNasc"];
	$nome = @$_REQUEST["nome"];
	$senha = @$_REQUEST["senha"];
	$lembrete = @$_REQUEST["lembrete"];
	$sexo = @$_REQUEST["sexo"];
	$profissao = @$_REQUEST["profissao"];
	$renda = @$_REQUEST["renda"];
	$escolaridade = @$_REQUEST["escolaridade"];
	$cidade = @$_REQUEST["cidade"];
	$estado = @$_REQUEST["estado"];
	$cep = @$_REQUEST["cep"];
	$envia_foto = @$_REQUEST["envia_foto"];
	$usuario_foto = @$_REQUEST["usuario_foto"];
	$foto_type = @$_REQUEST["foto_type"];
	$userAdmin = $_SESSION["sessLogin"];
    
	
	
	// REQUEST parametros - FINAL
	
	

	/* Arquivo de template */
	$sArqTemplate = $sDirTemplate."/cadastro.tpl";

	$sErro = "";

	if($faz_cadastro)
	{
		$sessUltUserCad = "";
		/* converte o username para minusculo */
		$username = strtolower($username);

		/* Faz as validações */
		if( !usuarioExiste( $username ) )
		{
			$erroUsername = verificaUsername($username);
			$erroSenha = "";
			if( strlen($senha) < 5 )
			{
				if(strlen($senha) == 0)
				{
					$erroSenha = "A senha não pode ser vazia";
				} else {
					$erroSenha = "Sua senha deve conter pelo menos 5 caracteres";
				}
			} else if( $senha != $senha2 ) {
				$erroSenha = "A senha e a confirmação não conferem!";
			}

			if(!$erroUsername && !$erroSenha )
			{


				global $bd;

				/* Insere em ustb_usuario */
				$sConsulta = "
					INSERT INTO ustb_usuario(username,senha,uid,gid,gecos,home,lembrete)
					VALUES( '$username', '$senha', '65534', '65534', '$nome', '/eusouomaximo/usuarios/$username','$lembrete' )
				";
				$bd->consulta($sConsulta,false);

				/* Criar o diretório home do usuário */
				mkdir( "/eusouomaximo/usuarios/$username", 0700 );

				/* Insere em catb_cadastro */
				if($desejo=="sim")
				{
					$bRecebeEmail='true';
				} else {
					$bRecebeEmail='false';
				}
				$tmp = explode("/",$dtNasc);
				if(count($tmp)==3)
				{
					$date_para_insert = $tmp[2]."-".$tmp[1]."-".$tmp[0];
				} else {
					$date_para_insert = "";
				}

				$sConsulta = "
					INSERT INTO catb_cadastro(username,sexo,dt_nascimento,id_profissao,id_faixa_renda,
									id_escolaridade,cidade,id_estado,cep,receber_emails)
					VALUES( '$username','$sexo','$date_para_insert', $profissao,$renda,
							$escolaridade, '$cidade', '$estado', '$cep', '$bRecebeEmail' )
				";
				// echo "Consulta: $sConsulta<hr>";
				$bd->consulta($sConsulta,false);

				/* Configurando o ultimo usuário cadastrado por esta sessão */
				$sessUltUserCad = $username;

				$sArqTemplate = $sDirTemplate."/cadastro_ok.tpl";
			}

			$aErro = array();
			if($erroUsername)
			{
				$aErro[] = $erroUsername;
			}
			if( $erroSenha ) {
				$aErro[] = $erroSenha;
			}

			for($x=0;$x<count($aErro);$x++)
			{
				$sErro .= $aErro[$x]."<br>\n";
			}


		} else {
			$sErro = "O usuário já existe em nosso banco de dados";
		}

	} else {
		$sessUltUserCad = "";
	}
	if($envia_foto)
	{
		$msgOk = "";
		if( strlen( $usuario_foto ) > 0 ) {

			/* Diretório de fotos do usuário */
			$dir_foto_usuario = "/eusouomaximo/fotos/" . $usuario_foto;
			if (!file_exists($dir_foto_usuario) ) {

				mkdir( $dir_foto_usuario, 0700 );
			}

			/* Verificando as propriedades da foto */
			$split_tipo = explode( "/", $foto_type );
			if( $split_tipo[0] == "image" )
			{
				/* segundo o mime é uma imagem */
				$split_nome = explode(".", $foto_name );
				$i = ( count($split_nome)-1 );
				$extensao = strtolower( $split_nome[ $i  ] );

				if( $extensao != "jpg" && $extensao != "jpeg" && $extensao != "gif" )
				{
					$sErro = "(1)Este não é um arquivo de imagem.";
				} else {
					/* A extensão bate :) */
					if( $foto_size > (50 * 1024) )
					{
						$sErro = "(2)O arquivo enviado é grande demais. O tamanho maximo permitido é de 50k";
					} else {

						if( !usuarioExiste( $usuario_foto ) || numeroDeFotosDoUsuario($usuario_foto) > 0 )
						{
							// O carinha está se cadastrando, apenas uma foto por cadastro :)
							$sErro = "(4)Você não está autorizado a realizar esta operação";
						} else {
							// determinar id foto

							$iIdFoto = md5(uniqid($username.$foto_name.$foto_size));

							// Inserir em mxtb_foto
							$sConsulta = "insert into mxtb_foto( id_foto, comentario ) values( '$iIdFoto', '$extensao' )";
							$bd->consulta($sConsulta,false);

							// Vincular com o usuario
							$sConsulta = "insert into mxtb_foto_usuario( username, id_foto, comentario, status ) values( '$usuario_foto', '$iIdFoto', '$foto_name', 'AG' )";
							$bd->consulta($sConsulta,false);

							// Colocar o arquivo no lugar correto
							copy($foto, $dir_foto_usuario."/".$iIdFoto );

							$msgOk = "A foto foi enviada com sucesso. O arquivo será analizado e caso ele esteja de acordo com o termo de responsabilidade do usuário será publicado em até 48 horas.";
						}

					}
				}

			} else {
				$sErro = "(3)Este não é um arquivo de imagem.";
			}


		} else {
			/* Redirecionar para a home */
		}

		$sArqTemplate = $sDirTemplate."/cadastro_foto_ok.tpl";

	}



	if(!$iExibir)
	{
		$iExibir = 1;
	}

	if( $iExibir == 1 )
	{

		/* Coleta os dados enviados pelo formulario e gera as listBoxes */
		$listaEstados 		= criaListaSelect( "estado", obtemEstados(), $estado );
		$listaFaixas  		= criaListaSelect( "renda", obtemFaixasRenda(), $renda );
		$listaProfissoes 	= criaListaSelect( "profissao", obtemProfissoes(), $profissao );
		$listaEscolaridades = criaListaSelect( "escolaridade", obtemEscolaridades(), $escolaridade );
		$listaSexos			= criaListaSelect( "sexo", obtemSexos(), $sexo );
	} else if( $iExibir == 2 ){
		$listaFuma			= criaListaSelect( "fuma", obtemNaoOcasionalmenteSim(), $fuma );
		$listaBebe			= criaListaSelect( "bebe", obtemNaoOcasionalmenteSim(), $bebe );
	}


	if( $desejo )
	{
		$desejo_ck = " CHECKED ";
	} else {
		$desejo_ck = "";
	}

	$tplVars = "userAdmin,listaEstados,listaFaixas,listaProfissoes,listaEscolaridades,listaSexos,listaFuma,listaBebe,username,senha,senha1,nome,sexo,dtNasc,cidade,cep,foto,desejo_ck,lembrete,sErro,foto,foto_name,foto_size,foto_type,usuario_foto,msgOk";



?>
