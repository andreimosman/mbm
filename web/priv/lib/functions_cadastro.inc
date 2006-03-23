<?

	/*
	 * Arquivos de funções referentes ao sistema de cadastros "catb_"
	 */

	function obtemEstados()
	{
		$sConsulta = "SELECT id_estado as ID, NOME FROM catb_estado ORDER BY nome";
		return( obtemRegistros($sConsulta) );
	}

	function obtemProfissoes()
	{
		$sConsulta = "SELECT id_profissao as ID, NOME FROM catb_profissao ORDER BY nome";
		return( obtemRegistros($sConsulta) );
	}

	function obtemFaixasRenda()
	{
		$sConsulta = "SELECT id_faixa_renda as ID, NOME FROM catb_faixa_renda ORDER BY nome";
		return( obtemRegistros($sConsulta) );
	}

	function obtemEscolaridades()
	{
		$sConsulta = "SELECT id_escolaridade as ID, NOME FROM catb_escolaridade ORDER BY nome";
		return( obtemRegistros($sConsulta) );
	}

	function obtemPreferenciasSexuais()
	{
		$sConsulta = "SELECT id_preferencia_sexual as ID, NOME FROM catb_preferencia_sexual ORDER BY nome";
		return( obtemRegistros($sConsulta) );
	}

	function obtemPraticaEsportes()
	{
		$sConsulta = "SELECT id_pratica_esportes as ID, NOME FROM catb_pratica_esportes ORDER BY sexo";
		return( obtemRegistros($sConsulta) );
	}

	function obtemListaFotosDe()
	{
		$retorno = array();
		$retorno[0]["id"]="M";
		$retorno[0]["nome"]="Homens";
		$retorno[1]["id"]="F";
		$retorno[1]["nome"]="Mulheres";
		return($retorno);
	}

	function obtemListaFotosFaixaIdade()
	{
		$retorno = array();
		$retorno[0]["id"]="1";
		$retorno[0]["nome"]="com até 21 anos";
		$retorno[1]["id"]="2";
		$retorno[1]["nome"]="de 22 a 30";
		$retorno[2]["id"]="3";
		$retorno[2]["nome"]="de 31 a 40";
		$retorno[3]["id"]="4";
		$retorno[3]["nome"]="acima de 40";

		return($retorno);
	}


	function obtemSexos()
	{
		$retorno = array();
		$retorno[0]["id"]="M";
		$retorno[0]["nome"]="Masculino";
		$retorno[1]["id"]="F";
		$retorno[1]["nome"]="Feminino";
		return($retorno);
	}

	/* Verifica se o usuário já existe no banco de dados */
	function usuarioExiste($user)
	{
		$sConsulta = "SELECT username FROM ustb_usuario WHERE username='$user'";

		return( count(obtemRegistros($sConsulta))>0 );
	}

	/* Verifica se o usuário existe no banco de dados e se a senha entrada é a deste */
	function verificaUsuarioSenha($user,$pass)
	{
		$retorno = false;

		$sConsulta = "SELECT username,senha FROM ustb_usuario WHERE username='$user'";

		$registros = obtemRegistros($sConsulta);

		if(count($registros) > 0)
		{
			// echo "Registros > 0<br>";
			$u = $registros[0]["username"];
			$s = $registros[0]["senha"];
			// echo "$u / $s<br>";
			if( trim($user) == trim($u) && trim($pass) == trim($s) )
			{
				$retorno = true;
			}
		}

		return($retorno);

	}

	/*
	 * Lista de caracteres inválidos
	 */
	function listaCaracteresInvalidos()
	{
	   return( "$@ *%+;/\\|<>#!&\",'`~()áéíóúÁÉÍÓÚÄËÏÖÜäëïöüıİÿàèìòùÀÈÌÒÙãõÃÕâêîôûÂÊÎÔÛñÑ®ş«»´¬¨¦¿çÇµ©æÆß§ğĞøØ¶°¡³¤£€¼½¾‘’¥×÷" );
	}


	/*
	 * Verifica se o username é válido (não contém espaços, etc...)
	 * retorna uma String contendo o motivo do erro (caso exista) ou null;
	 */
	function verificaUsername($user)
	{
		$sRetorno = "";

		$caracteresInvalidos = listaCaracteresInvalidos();
		$tamListaCaracteres = strlen($caracteresInvalidos);

		$caracteresEncontrados = "";

		for($x=0;$x<$tamListaCaracteres;$x++)
		{

			$caractere = substr($caracteresInvalidos,$x, 1);


			/* Se encontrou o caracter inválido dentro da string */
			if( strstr($user,$caractere) )
			{
				if( !strstr($caracteresEncontrados,$caractere) )
				{
					$caracteresEncontrados .= $caractere;
				}
			}

		}

		if( strlen($caracteresEncontrados)>0 )
		{
			//$chrs = str_replace($caracteresEncontrados, "\s", "<i>espaco</i>");
			$chrs = $caracteresEncontrados;
			$sRetorno = "O username digitado possui caracteres inválidos: ".$chrs;
		}


		return($sRetorno);
	}

	function numeroDeFotosDoUsuario($nomeUsuario)
	{
		$iRetorno = 0;
		if( strlen( $nomeUsuario ) > 0 )
		{
			$sConsulta = "SELECT count(*) as num_regs from mxtb_foto_usuario where username='".AddSlashes($nomeUsuario)."'";
			$registros = obtemRegistros($sConsulta);
			$iRetorno = (int) $registros[0]["num_regs"];
		}

		return($iRetorno);
	}

	function obtemNaoOcasionalmenteSim()
	{
		$retorno = array();
		$retorno[0]["id"]="N";
		$retorno[0]["nome"]="Não";
		$retorno[1]["id"]="O";
		$retorno[1]["nome"]="Ocasionalmente";
		$retorno[2]["id"]="S";
		$retorno[2]["nome"]="Sim";
		return($retorno);
	}

	function obtemFotoAleatoria($arrayUsuariosVotados, $sexo = "", $faixa = "" )
	{
		$sNotIn = "";
		$sSexoAnd = "";
		if($sexo)
		{
			$sSexoAnd = " AND ca.sexo = '$sexo' ";
		}

		if( count( $arrayUsuariosVotados ) > 0 )
		{
			$sNotIn = "AND fu.id_foto NOT IN(";

			$numUsr = count( $arrayUsuariosVotados );
			for($x=0;$x<$numUsr;$x++)
			{
				if($x!=0)
				{
					$sNotIn .=",";
				}
				$sNotIn .= "'" . $arrayUsuariosVotados[$x] ."'";
			}

			$sNotIn .= ")";
		}


		$sConsulta = "
						SELECT
						   fu.id_foto as id_foto, u.username as username, f.comentario as extensao
						FROM
						   mxtb_foto_usuario fu, ustb_usuario u, catb_cadastro ca, mxtb_foto f
						WHERE
						   fu.username = u.username
						   AND ca.username = u.username
						   AND f.id_foto = fu.id_foto
						   AND fu.status = 'OK'
						   $sNotIn
						   $sSexoAnd
						ORDER BY
							random()
						LIMIT 1

					 ";
		$arrResultado = obtemRegistros($sConsulta);

		$sRetorno = $arrResultado[0];

		return($sRetorno);

	}

	function obtemUsuarioFoto($id_foto)
	{
		/* */
		$sConsulta = "
						SELECT
						   fu.username as usuario, f.comentario as extensao
						FROM
						   mxtb_foto_usuario fu, mxtb_foto f
						WHERE
						   fu.id_foto = f.id_foto
						   AND f.id_foto = '$id_foto'
					 ";
		$arrRetorno = obtemRegistros($sConsulta);
		return( $arrRetorno[0] );
	}

	function obtemInfoVotos($id_foto,$ano_mes)
	{
		$sConsulta = "SELECT id_foto,num_votos,trunc(media,2) as media from mxtb_voto WHERE id_foto = '$id_foto' AND mes_ano = '$ano_mes'";
		$aResultado = obtemRegistros($sConsulta);
		return($aResultado[0]);
	}

?>
