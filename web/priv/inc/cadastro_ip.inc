<?
   /**
    * cadastro_ip.inc
    * Administração dos IPs
    * CopyRight(c) 2002 - Mosman Soluções
    * Autor; Andrei de Oliveira Mosman
    * Email: mosman@mosman.com.br / andreimosman@hotmail.com
    */

   $oldTplVars = $tplVars;

   // Variáveis do formulário
   $tplVars = "SELF,ipaddr,interface_externa,interface_interna,ip_orig,banda_down,tipo_banda_down,banda_up,tipo_banda_up,banda_down_alt,banda_up_alt";
   // Variáveis de exibição
   $tplVars .= ",tp_bua_select,tp_bda_select,tp_bd_select,tp_bu_select,ifi_select,ife_select,submit";
   // Identifica a operação que eu está sendo executada (via hidden)
   $tplVars .= ",oper";


   $sArqTemplate = $sDirTemplate."/cadastro_ip.tpl";
   
   $registroEncontrado = 0;
   $bExibirListagem = 0;

   
   $nenhum = "";
   $desc_filtro = "";
   
   function existeIP($numip,$ipOrig="") {
      global $bd;
 
      $query = "SELECT ".
              "   ipaddr ".
              "FROM ".
              "   bmtb_ip ".
              "WHERE ".
              "   ipaddr = '".AddSlashes($numip)."' ";
      if($servOrig) {
         $query .= "   AND ipaddr != '".AddSlashes($ipOrig) . "' ";
      }
      
      $resultado = $bd->obtemRegistros( $query );
      
      return( count($resultado) );
      
   }
   

   if( $sessao=="listaIPs" ) {
      $bExibirListagem = 1;
   }
   if( $sessao=="alteracaoIP" && !$oper ) {
      if( !$ipaddr ) {
         // Exibir listagem das IPs
         $bExibirListagem = 1;
         
      } else {
         // Consultar a IP no banco de dados
/**
         $sSQL = "SELECT ".
                 "   ipaddr, interface_interna, interface_externa, banda_up,tipo_banda_up,banda_down,tipo_banda_down ".
                 "FROM ".
                 "   bmtb_ip ".
                 "WHERE ".
                 "   ipaddr = '".AddSlashes(trim($ipaddr))."' ";
*/
         $sSQL  = "SELECT  ";
         $sSQL .= "   i.ipaddr,  ";
         $sSQL .= "   i.interface_interna, i.interface_externa,  ";
         $sSQL .= "   i.banda_up,i.tipo_banda_up,i.banda_down, ";
         $sSQL .= "   i.tipo_banda_down, ";
         $sSQL .= "   ia.banda_up as banda_up_alt, ";
         $sSQL .= "   ia.tipo_banda_up as tipo_banda_up_alt, ";
         $sSQL .= "   ia.banda_down as banda_down_alt, ";
         $sSQL .= "   ia.tipo_banda_down as tipo_banda_down_alt ";
         $sSQL .= "FROM  ";
         $sSQL .= "   bmtb_ip i LEFT OUTER JOIN bmtb_ip_alternativo ia USING(ipaddr) ";
         $sSQL .= "WHERE  ";
         $sSQL .= "   i.ipaddr = '".AddSlashes(trim($ipaddr))."'  ";
         
         
         $aResultado = $bd->obtemRegistros( $sSQL );
         
         $registroEncontrado = count($aResultado);
         
         for($x=0;$x<count($aResultado);$x++) {
            while (list ($variavel, $valor) = each ($aResultado[$x])) {
	        $$variavel = $valor;
            }
         }
         
         if( $banda_up_alt == 0 ) $banda_up_alt = '';
         if( $banda_down_alt == 0 ) $banda_down_alt = '';
         
         
         $ip_orig = $ipaddr;
      }
   }
   require_once($PATHS["lib"]."/altq-util.inc");
   // Passar oldip... somente na alteração.
   function erroBanda($ip,$banda_up,$tipo_banda_up,$banda_down,$tipo_banda_down) {
      global $bd;

      // Obtem a informação da banda utilizada por este IP
      $sSQL .= "SELECT ";
      $sSQL .= "   c.username, cs.banda_up, cs.tipo_banda_up, cs.banda_down, cs.tipo_banda_down ";
      $sSQL .= "FROM ";
      $sSQL .= "   bmtb_ip ip, bmtb_cliente c, bmtb_cliente_servico cs ";
      $sSQL .= "WHERE ";
      $sSQL .= "   c.ipaddr = ip.ipaddr ";
      $sSQL .= "   AND cs.username = c.username ";
      $sSQL .= "   AND ip.ipaddr='".$ip."'";

      $lsSvc = $bd->obtemRegistros($sSQL);
      
      if( !count($lsSvc) ) return "";
      
      $bandaUP = bandaBPS( $banda_up, $tipo_banda_up );
      $bandaDOWN = bandaBPS( $banda_down, $tipo_banda_down );
      
      if( ($bandaUP > 0 && $bandaUP < 6144) || ($bandaDOWN > 0 && $bandaDOWN < 6144) ) {
         return "Você não pode alocar uma banda inferior a 6k !!!";
      }

      $bsUP = 0;
      $bsDOWN = 0;
      for($x=0;$x<count($lsSvc);$x++) {
         $bsUP+= bandaBPS($lsSvc[$x]["banda_up"], $lsSvc[$x]["tipo_banda_up"]);
         $bsDOWN+= bandaBPS($lsSvc[$x]["banda_down"],$lsSvc[$x]["tipo_banda_down"]);
      }
      
      if( $bandaUP < $bsUP || $bandaDOWN < $bsDOWN ) {
         return "A banda total alocada para o ip é menor que a banda alocada para os servicos do cliente associado a este ip (".$lsSvc[0]["username"].") !!!";
      }
      
      return "";
   }

   require_once($PATHS["lib"]."/functions_html.inc");

   $lsTipo = array();
   //$lsTipo[0]["id"] = "";
   //$lsTipo[0]["nome"] = "bps";
   $lsTipo[0]["id"] = "K";
   $lsTipo[0]["nome"] = "Kbps";
   $lsTipo[1]["id"] = "M";
   $lsTipo[1]["nome"] = "Mbps";
   
   $tp_bu_select = criaListaSelect("tipo_banda_up", $lsTipo, $tipo_banda_up,0);
   $tp_bd_select = criaListaSelect("tipo_banda_down", $lsTipo, $tipo_banda_down,0);

   // Banda Alternativa
   $tp_bua_select = criaListaSelect("tipo_banda_up_alt", $lsTipo, $tipo_banda_up_alt,0);
   $tp_bda_select = criaListaSelect("tipo_banda_down_alt", $lsTipo, $tipo_banda_down_alt,0);

   
   // Interfaces:
   
   $lsIntEntrada = $bd->obtemRegistros( "SELECT interface as id, interface as nome FROM bmtb_interface WHERE tipo_interface = 'E' ORDER BY interface" );
   $lsIntSaida   = $bd->obtemRegistros( "SELECT interface as id, interface as nome FROM bmtb_interface WHERE tipo_interface = 'I' ORDER BY interface" );
   
   $ife_select = criaListaSelect("interface_externa", $lsIntEntrada, $interface_externa);
   $ifi_select = criaListaSelect("interface_interna", $lsIntSaida, $interface_interna);

   require_once($PATHS["lib"]."/ip-utils.inc");

   if($oper == "efetuaCadastro") {
      /*******************************
       * Inicio da rotina de cadastro
       *******************************/
      // Tenta inserir no banco, caso contrário reporta o erro.
      
      $camposEsquecidos = array();
      
      // Verifica os campos obrigatórios
      if( !$ipaddr ) $camposEsquecidos[] = "IP";
      if( !$interface_interna ) $camposEsquecidos[] = "Interface de Saída";
      if( !$interface_externa ) $camposEsquecidos[] = "Interface de Entrada";
      //if( !$banda_up ) $camposEsquecidos[] = "Banda de Entrada";
      //if( !$banda_down ) $camposEsquecidos[] = "Banda de Saida";
      
      if(count($camposEsquecidos)) $sErro = "Você se esqueceu de preencher alguns campos (".join("/", $camposEsquecidos) . ").";
      
      if( existeIP(trim($ipaddr)) > 0 ) $sErro = "Endereço IP já cadastrado... Escolha outra ou tente a opção alterar";

      // Rede
      $endRedeCorrigido = enderecoRede($ipaddr);
      if( $endRedeCorrigido ) $sErro = "Endereço de rede inválido. O provável endereço da rede é '$endRedeCorrigido'";
      
      if(!$sErro) {
         // Tenta inserir no banco de dados.
         $sSQL = "INSERT INTO ".
                 "   bmtb_ip (ipaddr,interface_externa,interface_interna,banda_up,tipo_banda_up,banda_down,tipo_banda_down) ".
                 "VALUES (".
                    "'".AddSlashes(trim($ipaddr))."', " .
                    "'".AddSlashes(trim($interface_externa))."', " .
                    "'".AddSlashes(trim($interface_interna))."', " .
                    "'".AddSlashes(trim($banda_up))."', " .
                    "'".AddSlashes(trim($tipo_banda_up))."', " .
                    "'".AddSlashes(trim($banda_down))."', " .
                    "'".AddSlashes(trim($tipo_banda_down))."' " .
                 ")";
         $bd->consulta($sSQL,false);
         
         // --> CODIGO HUGO - INICIO
		 
		// $banda_up_alt = @$_REQUEST["banda_up_alt"];
		// $banda_down_alt = @$_REQUEST["banda_down_alt"];
		 
		 
		// if ($banda_up_alt == "" || $banda_up_alt == "0"){
		// 	$banda_up_alt = null;
		// }
		// if ($banda_down_alt == "" || $banda_down_alt == "0"){
		// 	$banda_down_alt = null;
		// }
		 // -> CODIGO HUGO - FINAL
		 
		 
		 

         if( !$banda_up || !$banda_down ) {
            $sSQL = "DELETE FROM bmtb_ip_alternativo WHERE ipaddr = " . "'".AddSlashes(trim($ipaddr))."'";
            //echo "SQL IP ALTERN.: $sSQL <br>";
         } else {

            $sSQL = "INSERT INTO ".
                    "   bmtb_ip_alternativo (ipaddr,banda_up,tipo_banda_up,banda_down,tipo_banda_down) ".
                    "VALUES (".
                       "'".AddSlashes(trim($ipaddr))."', " .
                       "'".AddSlashes(trim((int)$banda_up_alt))."', " .
                       "'".AddSlashes(trim($tipo_banda_up_alt))."', " .
                       "'".AddSlashes(trim((int)$banda_down_alt))."', " .
                       "'".AddSlashes(trim($tipo_banda_down_alt))."' " .
                    ")";
			//echo "SQL I IP ALTERN.: $sSQL <br>";
         }
         $bd->consulta($sSQL,false);
         
         // TODO: Logar o cadastro de banda alternativa
         $logMSG  = "IP: $ipaddr\n";
         $logMSG .= "UPLOAD ($interface_externa): $banda_up $tipo_banda_up\n";
         $logMSG .= "DOWNLOAD ($interface_interna): $banda_down $tipo_banda_down\n";
         
         // O grande irmão zela por ti
         $logger->registra($bd,$sessUID,"CADIP",$logMSG);
         
         unset($logMSG);
         
         $sMensagem = "Cadastro do IP '$ipaddr' efetuado com sucesso";
         
         $ipaddr = "";
         $interface_externa = "";
         $interface_interna = "";
         $porta = "";
         $banda_down = "";
         $tipo_banda_down = "";
         $banda_up = "";
         $tipo_banda_up = "";
         // $ = "";
         
         $tp_bu_select = criaListaSelect("tipo_banda_up", $lsTipo, $tipo_banda_up,0);
	 $tp_bd_select = criaListaSelect("tipo_banda_down", $lsTipo, $tipo_banda_down,0);

         // Banda Alternativa
         $tp_bua_select = criaListaSelect("tipo_banda_up_alt", $lsTipo, $tipo_banda_up_alt,0);
	 $tp_bda_select = criaListaSelect("tipo_banda_down_alt", $lsTipo, $tipo_banda_down_alt,0);

         $ife_select = criaListaSelect("interface_externa", $lsIntEntrada, $interface_externa);
         $ifi_select = criaListaSelect("interface_interna", $lsIntSaida, $interface_interna);


      } else {
         
      }

      /*******************************
       * Final da rotina de cadastro
       *******************************/
       
   } else if($oper == "efetuaAlteracao") {

      /*******************************
       * Inicio da rotina de alteração
       *******************************/
       
      $camposEsquecidos = array();
      
      // Verifica os campos obrigatórios
      if( !$ipaddr ) $camposEsquecidos[] = "IP";
      if( !$interface_interna ) $camposEsquecidos[] = "Interface de Saída";
      if( !$interface_externa ) $camposEsquecidos[] = "Interface de Entrada";
      //if( !$banda_up ) $camposEsquecidos[] = "Banda de Entrada";
      //if( !$banda_down ) $camposEsquecidos[] = "Banda de Saida";
     
      if(count($camposEsquecidos)) $sErro = "Você deixou alguns campos essenciais em branco (".join("/", $camposEsquecidos) . ").";
      
      if( $ipaddr != $ip_orig ) {
         if( existeIP(trim($ipaddr),$ip_orig) > 0 ) $sErro = "Você está tentando alterar o número IP contudo ja existe outro IP cadastrado com esse numero... Escolha outro !";
      }
      
      $errB = erroBanda($ip_orig,$banda_up,$tipo_banda_up,$banda_down,$tipo_banda_down);
      if( strlen($errB) ) $sErro = $errB;

      // Rede
      $endRedeCorrigido = enderecoRede($ipaddr);
      if( $endRedeCorrigido ) $sErro = "Endereço de rede inválido. O provável endereço da rede é '$endRedeCorrigido'";

      if(!$sErro) {
      
         if( $ipaddr == $ip_orig ) {

            $sSQL = "UPDATE bmtb_ip SET " .
                    "   interface_externa = '".AddSlashes(trim($interface_externa))."', ".
                    "   interface_interna = '".AddSlashes(trim($interface_interna))."', ".
                    "   banda_up = '".AddSlashes(trim($banda_up))."', ".
                    "   tipo_banda_up = '".AddSlashes(trim($tipo_banda_up))."', ".
                    "   banda_down = '".AddSlashes(trim($banda_down))."', ".
                    "   tipo_banda_down = '".AddSlashes(trim($tipo_banda_down))."' ".
                    "WHERE ipaddr = '".$ip_orig."'";
         
            $bd->consulta($sSQL,false);
            
            $sSQL = "DELETE FROM bmtb_ip_alternativo WHERE ipaddr = '".$ip_orig."'";
            //echo "DELETE DA BANDA ALTERNATIVA: $sSQL <br>\n";

            $bd->consulta($sSQL,false);

            if( $banda_up_alt || $banda_down_alt) {

               $sSQL = "INSERT INTO ".
                    "   bmtb_ip_alternativo (ipaddr,banda_up,tipo_banda_up,banda_down,tipo_banda_down) ".
                    "VALUES (".
                       "'".AddSlashes(trim($ipaddr))."', " .
                       "'".AddSlashes(trim((int)$banda_up_alt))."', " .
                       "'".AddSlashes(trim($tipo_banda_up_alt))."', " .
                       "'".AddSlashes(trim((int)$banda_down_alt))."', " .
                       "'".AddSlashes(trim($tipo_banda_down_alt))."' " .
                    ")";
               //echo "INSERT DA BANDA ALTERNATIVA: $sSQL <br>\n";
               $bd->consulta($sSQL,false);
           
	       }

         } else {
            // Para não ter problemas com a integridade referencial.
            
            // Insere o novo registro
            $sSQL = "INSERT INTO ".
                    "   bmtb_ip (ipaddr,interface_externa,interface_interna,banda_up,tipo_banda_up,banda_down,tipo_banda_down) ".
                    "VALUES (".
                       "'".AddSlashes(trim($ipaddr))."', " .
                       "'".AddSlashes(trim($interface_externa))."', " .
                       "'".AddSlashes(trim($interface_interna))."', " .
                       "'".AddSlashes(trim($banda_up))."', " .
                       "'".AddSlashes(trim($tipo_banda_up))."', " .
                       "'".AddSlashes(trim($banda_down))."', " .
                       "'".AddSlashes(trim($tipo_banda_down))."' " .
                    ")";
            $bd->consulta($sSQL,false);

            
            // Atualiza os clientes

            $sSQL = "UPDATE bmtb_cliente SET ipaddr='".AddSlashes(trim($ipaddr))."' WHERE ipaddr = '".$ip_orig. "' ";
            $bd->consulta($sSQL,false);

            
            // Apaga o registro antigo
            $sSQL = "DELETE FROM bmtb_ip WHERE ipaddr = '".$ip_orig."'";
            $bd->consulta($sSQL,false);

            
            $ip_orig = $ipaddr;
         }
         
         $sMensagem = "Alteração dos dados do IP '$ipaddr' efetuada com sucesso";
         
      } else {
         
      }

      /*******************************
       * Final da rotina de alteração
       *******************************/

   } else {

      if( $sessao=="cadastroIP" || !$registroEncontrado && !$bExibirListagem) {
         $oper = "efetuaCadastro";
         $submit = "Cadastrar IP";
         $ip_orig = "";
      } else {

      /*******************************
       * Início da rotina de listagem
       *******************************/

         if( $bExibirListagem ) {
         	$oper = @$_REQUEST["oper"];
         	if (!$oper){
            $tplVars = $oldTplVars;
         
            // Compatibilitade com o Lynx
            $lynx_hr = strstr($HTTP_USER_AGENT,"Lynx") ? '<tr height="1"><td colspan="8" height="1"><hr size=1></td></tr>': '';
         
            // Improvements: OUTERJOIN :)) Agora usando postgres é possível
            $sSQL = "SELECT ".
                    "   i.ipaddr,i.interface_externa,i.interface_interna, i.banda_up,i.tipo_banda_up,i.banda_down,i.tipo_banda_down, ".
                    "   c.username as cliente, c.mac, c.status, ia.banda_up as banda_up_alt, ia.tipo_banda_up as tipo_banda_up_alt,  ".
                    "   ia.banda_down as banda_down_alt, ia.tipo_banda_down as tipo_banda_down_alt ".
                    "FROM ".
                    "   ( bmtb_ip as i LEFT OUTER JOIN bmtb_cliente as c USING( ipaddr ) ) LEFT OUTER JOIN bmtb_ip_alternativo ia ON( i.ipaddr = ia.ipaddr) ";
                    " ORDER BY ".
                    "   i.ipaddr ";

            $lista_ips = $bd->obtemRegistros( $sSQL );
            
            if(!count($lista_ips)) {
               if( !$nenhum ) {
                  $nenhum = "Nenhum IP cadastrado no sistema.";
               }
            }
            
            $bgcolorI1 = "#FFFFFF";
            $bgcolorI2 = "#CCCCCC";
            $bgcolorI = $bgcolorI2;

            $bgcolorC1 = "#F0F0F0";
            $bgcolorC2 = "#DADADA";
            $bgcolorC = $bgcolorC2;
            
            $cor_ativo = "#008000";
            $cor_naoinstalado = "#FF9933";
            $cor_bloqueado = "#FF0000";
            
	    $clientes_ativos = 0;
	    $clientes_bloqueados = 0;
	    $ips_disponiveis = 0;
	    $ips_cadastrados = count($lista_ips);
	    
            for($x=0;$x<count($lista_ips);$x++) {
               $lista_ips[$x]["banda_alt_up"] = "";
               if( $lista_ips[$x]["banda_up_alt"] > 0 ) {
                  $lista_ips[$x]["banda_alt_up"] = "/" . $lista_ips[$x]["banda_up_alt"] . $lista_ips[$x]["tipo_banda_up_alt"];
               }
               $lista_ips[$x]["banda_alt_down"] = "";
               if( $lista_ips[$x]["banda_down_alt"] > 0 ) {
                  $lista_ips[$x]["banda_alt_down"] = "/" . $lista_ips[$x]["banda_down_alt"] . $lista_ips[$x]["tipo_banda_down_alt"];
               }

               $lista_ips[$x]["bgcolorI"] = $bgcolorI;
               $lista_ips[$x]["bgcolorC"] = $bgcolorC;
               //$lista_ips[$x]["tp_up"] = $lista_ips[$x]["tipo_banda_up"] == "P" ? "%" : $lista_ips[$x]["tipo_banda_up"] . "bps";
               //$lista_ips[$x]["tp_down"] = $lista_ips[$x]["tipo_banda_down"] == "P" ? "%" : $lista_ips[$x]["tipo_banda_down"] . "bps";
               $lista_ips[$x]["tp_up"] = $lista_ips[$x]["tipo_banda_up"];
               $lista_ips[$x]["tp_down"] = $lista_ips[$x]["tipo_banda_down"];
               
               $lista_ips[$x]["operI"] = "";
               $lista_ips[$x]["operC"] = "";
               
               $excluirIP = '<a href="'.$SELF.'?sessao=excluirIP&ip='.$lista_ips[$x]["ipaddr"].'"><img border="0" src="imagens/lixeira.gif" width="16" height="16" alt="[Excluir IP]"></a>';
               $habilitarIP = '<a href="'.$SELF.'?sessao=cadastroCliente&ipaddr='.$lista_ips[$x]["ipaddr"].'"><img border="0" src="imagens/habilitar.gif" width="16" height="16" alt="[Habilitar IP]"></a>';
               $iconeVazio = '<img border="0" src="imagens/pixel.gif" width="16" height="16" alt="">';
               if( $lista_ips[$x]["cliente"] ) {
                  $excluirCliente = '<a href="'.$SELF.'?sessao=excluirCliente&username='.$lista_ips[$x]["cliente"].'"><img border="0" src="imagens/lixeira.gif" width="16" height="16" alt="[Excluir Cliente]"></a>';
                  $lista_ips[$x]["operC"] .= $excluirCliente;
                  $lista_ips[$x]["st_nao_ativado"] = "";

                  // Cliente Ativo
                  if( $lista_ips[$x]["status"] == "A" ) {
                     $lista_ips[$x]["strstatus"] = "Ativo";
                     $clientes_ativos++;
                     $lista_ips[$x]["cor_status"] = $cor_ativo;
                     
                  } else {
                     $lista_ips[$x]["strstatus"] = "Bloqueado";
                     $clientes_bloqueados++;
                     $lista_ips[$x]["cor_status"] = $cor_bloqueado;
                  }
                  $lista_ips[$x]["operI"] .= $iconeVazio;
               } else {
	          $ips_disponiveis++;
                  $lista_ips[$x]["strstatus"] = "";
                  $lista_ips[$x]["cor_status"] = $cor_naoinstalado;
                  //$lista_ips[$x]["st_nao_ativado"] = "Não habilitado";
                  $lista_ips[$x]["st_nao_ativado"] = "Ñ Hab.";
                  $lista_ips[$x]["operI"] .= $habilitarIP;
               }
               
               $bgcolorI = $bgcolorI == $bgcolorI1 ? $bgcolorI2 : $bgcolorI1;
               $bgcolorC = $bgcolorC == $bgcolorC1 ? $bgcolorC2 : $bgcolorC1;
               
               $lista_ips[$x]["operI"] .= $excluirIP;
               
               $lista_ips[$x]["dir"] = str_replace("/", "-", $lista_ips[$x]["ipaddr"]);

            }
            
            
            $mrtgweb = $mrtgCONF["webbase"];
            $tplVars .= ($tplVars ? ",":"") . "nenhum,desc_filtro,filtro,clientes_ativos,clientes_bloqueados,ips_disponiveis,ips_cadastrados,mrtgweb,lynx_hr";
            
            $tplLoops[] = "lista_ips";
            
            $sArqTemplate = $sDirTemplate."/lista_ips.tpl";
         	}   
         } else {
            $oper = "efetuaAlteracao";
            $submit = "Alterar Dados";
            if(!$ip_orig) $ip_orig = $ipaddr;
         }
      }

      /*******************************
       * Final da rotina de listagem
       *******************************/


   }
   
?>
