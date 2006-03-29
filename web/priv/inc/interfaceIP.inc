<?
    $sessao = @$_REQUEST["sessao"];
    $userAdmin = $_SESSION["sessLogin"];
    $interface = @$_REQUEST["interface"];
    $ipaddr = @$_REQUEST["ipaddr"];
    $mascara = @$_REQUEST["mascara"];
    $mask = null;
    $oper = @$_REQUEST["oper"];
    
    $sSQL  = "SELECT * FROM bmtb_interface_ips WHERE interface = '$interface' ";
    
    $ips = $bd->obtemRegistros($sSQL);
    
    
    $tplVars .= ",userAdmin,interface,sessao,ips";
	$sArqTemplate = "interface_ip_lista.tpl";
	
	if($oper == "cadastrar"){
	
		$tplVars .= ",userAdmin,interface,ipaddr,mascara,sessao,mensagem";
		$sArqTemplate = "cadastro_interface_ip.tpl";

	
		if ($ipaddr){

			//@list($ip,$mask) = explode('/',$ipaddr);
			
			$ip = @$_REQUEST["ipaddr"] . @$_REQUEST["mascara"];
			//$mask = @$_REQUEST["mascara"];
			

			/*if($mask){

				$sSQL  = "INSERT INTO ";
				$sSQL .= "bmtb_interface_ips ";
				$sSQL .= "(interface,ipaddr,mascara) ";
				$sSQL .= " VALUES ";
				$sSQL .= "('".$interface."', '$ip', netmask('$ipaddr')) ";

				$bd->consulta($sSQL,false);

			}*/


			if ($mascara && $mascara != ""){
				
				$sSQL  = "INSERT INTO ";
				$sSQL .= "bmtb_interface_ips ";
				$sSQL .= "(interface,ipaddr,mascara) ";
				$sSQL .= " VALUES ";
				$sSQL .= "('".$interface."','$ip',null) ";
	
				$bd->consulta($sSQL,false);
				
			} else {
				
					
				
				
			}

			$mensagem = "IP cadastrado com sucesso na interface. ";
			$tplVars .= ",userAdmin,interface,ipaddr,mascara,sessao,mensagem";
			$sArqTemplate = "cadastro_interface_ip.tpl";


		}
		
		
	} else if ($oper == "excluiIpInterface"){
	
			$sSQL  = "DELETE FROM ";
			$sSQL .= "bmtb_interface_ips ";
			$sSQL .= "WHERE ";
			$sSQL .= "ipaddr = '".$_REQUEST["net"]."' AND ";
			$sSQL .= "interface = '".$_REQUEST["interface"]."' ";
			
			$bd->consulta($sSQL,false);

			$mensagem = "IP deletado com sucesso da interface. ";
			$tplVars .= ",userAdmin,interface,sessao";
			$sArqTemplate = "interface_ip_lista.tpl";
	
	
	
	}
























?>