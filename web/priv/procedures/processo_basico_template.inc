<?

	/* Carrega o template com o conteudo */
	//$pgTPL->load_file("base", $sArqTemplate );


	/* Parseia os loops enviados */
	for($zz=0;$zz<count($asParseLoop);$zz++)
	{
		$loop = $asParseLoop[$zz];
		//$pgTPL->parse_loop("conteudo", $sToParse );
		$pgTPL->atribui($loop,$$loop);
	}

	$SELF = $PHP_SELF;
	$tplVars .= ",sErro,sMensagem,SELF,sessao";
	
	
	$vars = explode(",",$tplVars);
	
	for($zz=0;$zz<count($vars);$zz++) {
	   $pgTPL->atribui($vars[$zz],@$$vars[$zz]);
	}
	
	
	
	//$pgTPL->register("base", $tplVars);
	//$pgTPL->parse("base");
	
	//echo "PARSING LOOPS:".count($tplLoops)."<BR>";

	for($x=0;$x<count($tplLoops);$x++) {
	   //$pgTPL->parse_loop("base",$tplLoops[$x]);
	    
		$loop = $tplLoops[$x];
		//echo "l: [$loop]/".count($$loop)." <br>\n";
		$pgTPL->atribui($loop,$$loop);
	}
?>
