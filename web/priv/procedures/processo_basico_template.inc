<?

	/* Carrega o template com o conteudo */
	$pgTPL->load_file("base", $sArqTemplate );


	/* Parseia os loops enviados */
	for($zz=0;$zz<count($asParseLoop);$zz++)
	{
		$sToParse = $asParseLoop[$zz];
		$pgTPL->parse_loop("conteudo", $sToParse );
	}
	$SELF = $PHP_SELF;
	$tplVars .= ",sErro,sMensagem,SELF,sessao";
	
	$pgTPL->register("base", $tplVars);
	$pgTPL->parse("base");

	for($x=0;$x<count($tplLoops);$x++) {
	   $pgTPL->parse_loop("base",$tplLoops[$x]);
	}
?>
