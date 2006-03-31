<?

	require_once( $PATHS["lib"] ."/redes.inc" );



    $sessao = @$_REQUEST["sessao"];
    $userAdmin = $_SESSION["sessLogin"];
    $interface = @$_REQUEST["interface"];
    $ipaddr = @$_REQUEST["ipaddr"];
    $mascara = @$_REQUEST["mascara"];
    $mask = null;
    $oper = @$_REQUEST["oper"];
    
    
    
    
    $sSQL  = "SELECT ip.interface, ip.ipaddr, netmask(ip.ipaddr), i.interface, i.tipo_interface, i.banda, i.tipo_banda, i.observacao, i.nat FROM bmtb_interface_ips ip, bmtb_interface i WHERE i.interface = '$interface'  AND i.interface = ip.interface";
    
    $ips = $bd->obtemRegistros($sSQL);
    
	@$tipo_interface = $ips[0]["tipo_interface"];
	@$banda = $ips[0]["banda"];
	@$tipo_banda = $ips[0]["tipo_banda"];
	@$observacao = $ips[0]["observacao"];
	@$nat = $ips[0]["nat"];
    
    
    
    $tplVars .= ",userAdmin,interface,sessao,ips,tipo_interface,banda;tipo_banda,observacao,nat";
	$sArqTemplate = "interface_ip_lista.tpl";
	
	if($oper == "cadastrar"){
	
		$tplVars .= ",userAdmin,interface,ipaddr,mascara,sessao,mensagem";
		$sArqTemplate = "cadastro_interface_ip.tpl";

	
		if ($ipaddr){

			//@list($ip,$mask) = explode('/',$ipaddr);
			
			$iptoinsert = @$_REQUEST["ipaddr"];// . @$_REQUEST["mascara"];
			@list( $ip,$bits ) = explode( "/", $iptoinsert );

			if( !$bits ) {
				$rede = new RedeIP($ip,@$_REQUEST["mascara"]);
				$iptoinsert = $ip . "/" . $rede->bitcount;
			}
			
			$sSQL  = "SELECT ipaddr from bmtb_interface_ips WHERE ipaddr = '$iptoinsert' ";
			$checa = $bd->obtemRegistros($sSQL);
			
			if (count($checa)){
				$erro = "O IP $iptoinsert já está cadastrado!";
				$tplVars .= ",userAdmin,interface,iptoinsert,mascara,sessao,mensagem,erro";
				$sArqTemplate = "cadastro_interface_ip.tpl";
				return;
			
			}
			
			
			

			$sSQL  = "INSERT INTO ";
			$sSQL .= "bmtb_interface_ips ";
			$sSQL .= "(interface,ipaddr) ";
			$sSQL .= " VALUES ";
			$sSQL .= "('$interface','$iptoinsert') ";

			//echo "SQL INSERÇÃO: $sSQL <br>\n";
	
			$bd->consulta($sSQL,false);

    		$sSQL  = "SELECT ip.interface, ip.ipaddr, netmask(ip.ipaddr), i.interface, i.tipo_interface, i.banda, i.tipo_banda, i.observacao, i.nat FROM bmtb_interface_ips ip, bmtb_interface i WHERE i.interface = '$interface'  AND i.interface = ip.interface";
    
    		$ips = $bd->obtemRegistros($sSQL);


			$mensagem = "IP cadastrado com sucesso na interface. ";
			$tplVars .= ",userAdmin,interface,ipaddr,mascara,sessao,mensagem";
			$sArqTemplate = "interface_ip_lista.tpl";


		}
		
		
	} else if ($oper == "excluiIpInterface"){
	
			$sSQL  = "DELETE FROM ";
			$sSQL .= "bmtb_interface_ips ";
			$sSQL .= "WHERE ";
			$sSQL .= "ipaddr = '".$_REQUEST["net"]."' AND ";
			$sSQL .= "interface = '".$_REQUEST["interface"]."' ";
			
			$bd->consulta($sSQL,false);
    		
   			$sSQL  = "SELECT ip.interface, ip.ipaddr, netmask(ip.ipaddr), i.interface, i.tipo_interface, i.banda, i.tipo_banda, i.observacao, i.nat FROM bmtb_interface_ips ip, bmtb_interface i WHERE i.interface = '$interface'  AND i.interface = ip.interface";
    
    		$ips = $bd->obtemRegistros($sSQL);

			$mensagem = "IP deletado com sucesso da interface. ";
			$tplVars .= ",userAdmin,interface,sessao";
			$sArqTemplate = "interface_ip_lista.tpl";
	
	
	
	}






















?>