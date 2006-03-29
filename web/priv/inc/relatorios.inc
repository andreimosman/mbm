<?
	$subsessao = @$_REQUEST["subsessao"];
	$acao = @$_REQUEST["acao"];
	$userAdmin = $_SESSION["sessLogin"];
	$tipo = @$_REQUEST["tipo"];



	if ($tipo == "usuario_bloq"){
	
		$sSQL = "SELECT a.username,a.ipaddr,a.status,b.username,b.fone FROM bmtb_cliente a, bmtb_cliente_info b WHERE a.status = 'B' AND a.username = b.username ORDER BY a.username ASC ";
	
		$bloqueados = $bd->obtemRegistros($sSQL);
		
		$tplLoops[] = "bloqueados";
	
		$tplVars .= ",subsessao,acao,userAdmin,tipo,bloqueados";
		
		$sArqTemplate = "relatorio_bloqueados.tpl";
	
	
	} else if ($tipo == "cargaPOP"){
	
		$sSQL  = "SELECT ";
		$sSQL .= "   p.id_pop,p.nome, ";
		$sSQL .= "   CASE WHEN ";
		$sSQL .= "      cli_pop.clientes_associados is null ";
		$sSQL .= "   THEN ";
		$sSQL .= "      0 ";
		$sSQL .= "   ELSE ";
		$sSQL .= "      cli_pop.clientes_associados ";
		$sSQL .= "   END as clientes_associados, ";
		$sSQL .= "   cli_pop.carga_up,cli_pop.carga_down ";
		$sSQL .= "FROM ";
		$sSQL .= "   bmtb_pop p LEFT OUTER JOIN ";
		$sSQL .= "   ( ";
		$sSQL .= "  SELECT ";
		$sSQL .= "     pop.id_pop,count(cbl.pop) as clientes_associados,sum(banda_up) as carga_up, sum(banda_down) as carga_down  ";
		$sSQL .= "  FROM ";
		$sSQL .= "     bmtb_cliente cbl, ";
		$sSQL .= "     bmtb_pop pop ";
		$sSQL .= "  WHERE ";
		$sSQL .= "     cbl.pop = pop.id_pop ";
		$sSQL .= "  GROUP BY ";
		$sSQL .= "     pop.id_pop ";
		$sSQL .= "   ) cli_pop ON( p.id_pop = cli_pop.id_pop)  ";
		$sSQL .= "ORDER BY ";
		$sSQL .= "   p.nome ";

		
		echo "QUERY POP: $sSQL <br>\n";
		
		$carga = $bd->obtemRegistros($sSQL);
		
		$banda_upload = "";
		$banda_download = "";
		
		for($x=0;$x<count($carga);$x++) {
		
		$banda_upload += $carga[$x]["banda_up"];
		$banda_download += $carga[$x]["banda_down"];

		}
		echo "BU: $banda_upload <br>";
		echo "BD: $banda_download<br>";
		
		$tplVars .= ",subsessao,userAdmin,tipo,carga,banda_up,banda_down";
		$sArqTemplate = "relatorio_cargapop.tpl";


	}else if ($tipo == "grafico"){
	
		$id_pop = @$_REQUEST["id_pop"];
		
		
		
		$sSQL  = "SELECT * FROM ";
		$sSQL .= "bmtb_pop ";
		$sSQL .= "ORDER BY nome_pop ASC";
		
		$pop = $bd->obtemRegistros($sSQL);
		
		$tplVars .=",userAdmin,tipo,pop";
		$sArqTemplate = "relatorio_grafico.tpl";
		
		if ($id_pop){
		
			$sSQL  = "SELECT ";
			$sSQL .= "p.id_pop, p.nome_pop, c.username, c.ipaddr, c.pop ";
			$sSQL .= "FROM ";
			$sSQL .= "bmtb_pop p, bmtb_cliente c ";
			$sSQL .= "WHERE ";
			$sSQL .= "c.pop = p.id_pop  ";
			
			
			if ($id_pop != "T"){
			
				$sSQL .= "AND c.pop = '".$id_pop."'  ";
							
			} 
			
		$sSQL .= "ORDER BY c.username ASC";
			
		$graf = $bd->obtemRegistros($sSQL);
		$tplVars .= ",userAdmin,id_pop,graf";
		$sArqTemplate = "relatorio_grafico.tpl";
		
		}
			
		
			
			
			
			
		
		
		
		
		
	} else if ($tipo == "arp"){
	
	
				$sArqTemplate = "arp.tpl";
				
				$ip = @$_REQUEST["ip"];
				
				$arp=array();
				
				if( $ip ) {
					// Recebeu IP faz a consulta do ARP
					if( $ip == "-a" ) {
						$cmd = "arp -an";
						$fd = popen($cmd,"r");
						
					} else {
						$cmd = "/sbin/ping -c 1 '" . $ip . "' 2>&1 > /dev/null";
						system($cmd);
						
						$cmd = "/usr/sbin/arp -an |grep '(" . $ip . ")' 2>&1 "; 
						$fd = popen($cmd,"r");
						
					}
					
					if( $fd ) {
						while(!feof($fd)) {
						
						   $linha = fgets($fd,4096);
						   //echo $linha;
						   chop($linha);
						   
							if( $linha ) {
								// SPLIT
								@list($shit,$addr,$at,$mac,$on,$on,$iface) = preg_split('/[\s]+/',$linha);
	
								//echo "shit: $shit<br>\n";
								//echo "addr: $addr<br>\n";
								//echo "mac: $mac<br>\n";
								//echo "iface: $iface<br>\n";
								
								if( strstr($mac,"incomplete")) {
									$mac = "ARP Não Enviado";
									$iface = "N/A";
								}
								
								$arp[] = array("addr" => $addr, "mac" => $mac , "iface" => $iface);
								
							}
						   
						   
						   
						}
	
						pclose($fd);
					}
					
				}
				$tplVars .= ",userAdmin,id_pop,ip,arp";
					
	
	}






























?>