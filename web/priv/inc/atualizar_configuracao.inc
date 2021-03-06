<?
   /**
    * atualizar_configuracao.inc
    * Teste para gerar o conf
    * CopyRight(c) 2002 - Mosman Solu��es
    * Autor; Andrei de Oliveira Mosman
    * Email: mosman@mosman.com.br / andreimosman@hotmail.com
    */

   require_once( $PATHS["lib"] . "/altq-util.inc" );
   
   // REQUEST dos parametros - INICIO
   
	$oper = @$_REQUEST["oper"];
	$userAdmin = $_SESSION["sessLogin"];   
    $arquivo = @$_REQUEST["arquivo"];
    //$dir = @$_REQUEST["dir"];
    $confirma = @$_REQUEST["confirma"];
    //$sufixo = @$_REQUEST["sufixo"];
   
   // REQUEST dos parametros - FINAL
   
   
   
   function copiaBackup($arquivo,$dir,$sufixo) {
      if( !is_dir( $dir ) ) {
         $mask = umask(0);
         mkdir( $dir, 0700 );
         umask($mask);
      }
      
      $tmpNome = explode("/", $arquivo);
      
      if( is_readable($arquivo) ) {
         $mensagem = "Arquivo '".$tmpNome[ count($tmpNome) -1 ]."' encontrado. Criando backup !!! \n";
         copy( $arquivo, $dir."/".$tmpNome[ count($tmpNome) -1 ] . "-".$sufixo );
      }
      return($mensagem);
   }

   if( $oper == "confirma" && $confirma == "atualizar" ) {
      $logger->registra($bd,$sessUID,"ATUALIZAR");
      
      // $usarTemplates = 0;
      $sArqTemplate = "atualiza_configuracao.tpl";
      $resposta = "";
      $tplVars = "SELF,resposta,userAdmin";


      $datahora = date("Y-M-d/H-i-s");
      $tmpSuf = explode("/", $datahora);
     
      $logDir    = $PATHS["log"]."/".$tmpSuf[0];
      $logSufixo = $tmpSuf[1];
      
      unset( $tmpSuf );
      
      // Backup dos arquivos existentes

      $resposta.=copiaBackup($PATHS["etc"]."/pf.conf", $logDir, $logSufixo);
      $resposta.=copiaBackup($PATHS["etc"]."/interfaces.conf", $logDir, $logSufixo);
      $resposta.=copiaBackup($PATHS["etc"]."/altq.conf", $logDir, $logSufixo);
      $resposta.=copiaBackup($PATHS["etc"]."/mrtg.conf", $logDir, $logSufixo);
      $resposta.=copiaBackup($PATHS["etc"]."/macs.conf", $logDir, $logSufixo);

      // Final do backup
      
      
      // Bloquear IPs n�o utilizados;
      $bloquearNU = 1;

      // Interfaces:
      $sSQL = "SELECT " . 
         "   interface, banda, tipo_banda, tipo_interface " . 
         "FROM ".
         "   bmtb_interface ".
         "ORDER BY ".
         "   interface ";

      $interfaces = $bd->obtemRegistros($sSQL);

      // pf.conf
      $if_externa = array();
      $if_interna = array();
      
      // interfaces.conf
      $if_internas = array();
      $iic=0;
      
      // queue_list
      $queue_list = array();
      
      // Indices para os IDs
      $queue_ip_up = array();
      $queue_ip_down = array();

      // Interfaces
      for( $x=0;$x<count($interfaces);$x++ ) {
         // pf.conf info
         $ql = array();
         $ql[] = $interfaces[$x]["interface"] . "_tcp_ack";
         $q = array();
         $i=0;
         if( $interfaces[$x]["tipo_interface"] == "E" ) {
            $interfaces[$x]["tipo"] = "out";
            $if_nome = "if_ext_". count($if_externa);
            $if_externa[ $interfaces[$x]["interface"] ] = $if_nome;

            $sSQL  = "SELECT ";
            $sSQL .= "   trim(c.username) || 'O' || i.interface_externa as queue, ";
            $sSQL .= "   i.interface_externa as interface, i.ipaddr, ";
            $sSQL .= "   ia.banda_up as banda_up_alt, ";
            $sSQL .= "   ia.banda_down as banda_down_alt, ";
            $sSQL .= "   ia.tipo_banda_up as tipo_banda_up_alt, ";
            $sSQL .= "   ia.tipo_banda_down as tipo_banda_down_alt, ";
            $sSQL .= "   i.banda_up ||  ";
            $sSQL .= "      CASE WHEN ";
            $sSQL .= "         length( i.tipo_banda_up ) > 0 ";
            $sSQL .= "      THEN ";
            $sSQL .= "         upper( i.tipo_banda_up ) || 'b' ";
            $sSQL .= "      ELSE ";
            $sSQL .= "         '' ";
            $sSQL .= "      END ";
            $sSQL .= "   as banda, ";
            $sSQL .= "   ia.banda_up ||  ";
            $sSQL .= "      CASE WHEN ";
            $sSQL .= "         length( ia.tipo_banda_up ) > 0 ";
            $sSQL .= "      THEN ";
            $sSQL .= "         upper( ia.tipo_banda_up ) || 'b' ";
            $sSQL .= "      ELSE ";
            $sSQL .= "         '' ";
            $sSQL .= "      END ";
            $sSQL .= "   as banda_alt ";
            $sSQL .= "FROM ";
            $sSQL .= "   bmtb_ip i, bmtb_cliente c LEFT OUTER JOIN bmtb_ip_alternativo ia USING(ipaddr) ";
            $sSQL .= "WHERE ";
            $sSQL .= "   i.ipaddr = c.ipaddr ";
            $sSQL .= "   AND interface_externa = '". $interfaces[$x]["interface"]  ."' ";
            $sSQL .= "   AND c.status != 'B' ";

            $q = $bd->obtemRegistros($sSQL);

            for($i=0;$i<count($q);$i++) {
               //$qID = "q".str_pad($i,3,"0",STR_PAD_LEFT)."O".$q[$i]["interface"];
               $qID = "q".str_pad($i,3,"0",STR_PAD_LEFT)."O".$interfaces[$x]["interface"];
               // rogerio
		$queue_ip_up[$q[$i]["ipaddr"]] = $qID; // Indice
               //$queue_ip_up[$q[$i]["ipaddr"]] =  "(".$qID.",".$interfaces[$x]["interface"]."_tcp_ack".")";

               //$q[$i]["queue"] = "{".$qID.",".$interfaces[$x]["interface"]."_tcp_ack"."}";
               $q[$i]["queue"] = $qID;
               $ql[] = $q[$i]["queue"];
            }

         } else {
            $interfaces[$x]["tipo"] = "in";
            $if_nome = "if_int". count($if_interna);
            $if_interna[ $interfaces[$x]["interface"] ] = $if_nome;
            $if_internas[ $iic++ ]["interface"] = $interfaces[$x]["interface"];

            $sSQL  = "SELECT ";
            $sSQL .= "   trim(c.username) || 'I' || i.interface_interna as queue, ";
            $sSQL .= "   i.interface_externa as interface, i.ipaddr, ";
            $sSQL .= "   ia.banda_up as banda_up_alt, ";
            $sSQL .= "   ia.banda_down as banda_down_alt, ";
            $sSQL .= "   ia.tipo_banda_up as tipo_banda_up_alt, ";
            $sSQL .= "   ia.tipo_banda_down as tipo_banda_down_alt, ";
            $sSQL .= "   i.banda_down ||  ";
            $sSQL .= "      CASE WHEN ";
            $sSQL .= "         length( i.tipo_banda_down ) > 0 ";
            $sSQL .= "      THEN ";
            $sSQL .= "         upper( i.tipo_banda_down ) || 'b' ";
            $sSQL .= "      ELSE ";
            $sSQL .= "         '' ";
            $sSQL .= "      END ";
            $sSQL .= "   as banda, ";
            $sSQL .= "   ia.banda_down ||  ";
            $sSQL .= "      CASE WHEN ";
            $sSQL .= "         length( ia.tipo_banda_down ) > 0 ";
            $sSQL .= "      THEN ";
            $sSQL .= "         upper( ia.tipo_banda_down ) || 'b' ";
            $sSQL .= "      ELSE ";
            $sSQL .= "         '' ";
            $sSQL .= "      END ";
            $sSQL .= "   as banda_alt ";
            $sSQL .= "FROM ";
            $sSQL .= "   bmtb_ip i, bmtb_cliente c LEFT OUTER JOIN bmtb_ip_alternativo ia USING(ipaddr) ";
            $sSQL .= "WHERE ";
            $sSQL .= "   i.ipaddr = c.ipaddr ";
            $sSQL .= "   AND interface_interna = '". $interfaces[$x]["interface"]  ."' ";
            $sSQL .= "   AND c.status != 'B' ";

            $q = $bd->obtemRegistros($sSQL);

            for($i=0;$i<count($q);$i++) {
               //$qID = "q".str_pad($i,3,"0",STR_PAD_LEFT)."I".$q[$i]["interface"];
               $qID = "q".str_pad($i,3,"0",STR_PAD_LEFT)."I".$interfaces[$x]["interface"];
          	//alteracao rogerio
	       $queue_ip_down[$q[$i]["ipaddr"]] = $qID; // Indice
               //$queue_ip_down[$q[$i]["ipaddr"]] =  "(".$qID.",".$interfaces[$x]["interface"]."_tcp_ack".")";
               $q[$i]["queue"] = $qID;
               $ql[] = $q[$i]["queue"];
            }

         }
         $q[$i]["queue"] = $interfaces[$x]["interface"]."_tcp_ack";
         $q[$i]["banda"] = "128Kb priority 7";
         $q[$i]["banda_alt"] = "128Kb priority 7";

         $if_declara = $if_nome . ' = "{' . $interfaces[$x]["interface"] . '}"';

         $interfaces[$x]["queuelist"] = count($ql)>0?'{'.implode(',',$ql).'}':'';
         $queue_list = array_merge($queue_list,$q);
         
         unset($if_declara);
         
         // Vai ser necess�rio para gerar o pf.conf
         $interfaces[$x]["if_nome"] = $if_nome;
      }

      
      // IPs
      // Improvements: OUTERJOIN :)) Agora usando postgres � poss�vel
      $sSQL = "SELECT ".
              "   i.ipaddr,i.interface_externa,i.interface_interna, i.banda_up,i.tipo_banda_up,i.banda_down,i.tipo_banda_down, ".
              "   c.username, c.mac, c.status, trim(c.username) || 'O' || i.interface_externa as queueout, trim(c.username) || 'I' || i.interface_interna as queuein ".
              "FROM ".
              "   bmtb_ip as i LEFT OUTER JOIN bmtb_cliente as c USING( ipaddr ) ";
              "ORDER BY ".
              "   ipaddr ";      
      
      $ips = $bd->obtemRegistros($sSQL);
      
      // Lista dos MACs (Para gerar a de bloqueio por MAC
      $macs = array();
      $mi = 0;

      
      $redes_bloqueadas = array();
      $rbc = 0;
      
      $ips_bloqueados = array();
      $ibc = 0;
      
      $ips_disponiveis = array();
      $iid = 0;
      
      $servicos_bloqueados = array();
      $sbc = 0;
      
      $altq_ips = array();
      $aic = 0;
      
      $servicos_altq = array();
      $sac = 0; // contador;      

      // Varre os IPs
      for($x=0; $x<count($ips);$x++){
         $ips[$x]["queueout"] = $queue_ip_up[ $ips[$x]["ipaddr"] ];
         $ips[$x]["queuein"]  = $queue_ip_down[ $ips[$x]["ipaddr"] ];
         $ips[$x]["svc"] = "";         
         $ips[$x]["str_status"] = "Ativo";
         
         /**
          * Bloqueio de Redes ou IPs (In�cio)
          */
         
         // Se o status for bloqueado ou o cliente n�o for habilitado
         if( $ips[$x]["status"] == "B" || !$ips[$x]["username"] ) {
            $str_status = $ips[$x]["username"] ? "Bloqueado" : "N�o Habilitado";
            // Bloqueado
               
            if( strstr( $ips[$x]["ipaddr"], "/" ) ) {
               // � uma rede
               $redes_bloqueadas[$rbc]["alvo"] = $ips[$x]["ipaddr"];
               $redes_bloqueadas[$rbc]["username"] = $ips[$x]["username"];
               $redes_bloqueadas[$rbc]["str_status"] = $str_status;
               $rbc++;
            } else {
               // � um IP
               $ips_bloqueados[$ibc]["alvo"] = $ips[$x]["ipaddr"];
               $ips_bloqueados[$ibc]["username"] = $ips[$x]["username"];
               $ips_bloqueados[$ibc]["str_status"] = $str_status;               
               $ibc++;
            }

            $ips[$x]["str_status"] = $str_status;
            $ips[$x]["tipo_banda_up"] = "";
            $ips[$x]["tipo_banda_down"] = "";
            $ips[$x]["banda_up"] = 0;
            $ips[$x]["banda_down"] = 0;

         }
         
         /**
          * Bloqueio de Redes ou IPs (Fim)
          */

         $username = $ips[$x]["username"];

         $label = $username;
         $label = str_replace("-","",$username);
         $label = str_replace("_","", $label);
         
         $ips[$x]["altq_label"] = $label;
         
         #$tmpRotulo = explode(".", $ips[$x]["ipaddr"]);
         #$ips[$x]["rotulo"] = $tmpRotulo[2]."_".$tmpRotulo[3];
         $ips[$x]["rotulo"] = str_replace( "/", "-", str_replace( ".", "_", $ips[$x]["ipaddr"] ) )."_";

         // MRTG
         $banda_down = $ips[$x]["banda_down"];
         $banda_up = $ips[$x]["banda_up"];
         $tipo_banda_down = $ips[$x]["tipo_banda_down"];
         $tipo_banda_up = $ips[$x]["tipo_banda_up"];

         if( $banda_down > $banda_up ) {
            $maxbytes = $tipo_banda_down ? $banda_down * 125 : 32000;
         } else {
            $maxbytes = $tipo_banda_up ? $banda_up * 125 : 32000;
         }
             
         $banda_alocada = "UP: ".$banda_up . $tipo_banda_up . "/DOWN: " . $banda_down . $tipo_banda_down;
             
         if( $tipo_banda_up == "M" ) {
            $maxbytes *= 1024;
         }
             
         if( $maxbytes > $mrtgCONF["maxbytes"] * 125 ) {
            $maxbytes = $mrtgCONF["maxbytes"] * 125;
         }
             
         if(!$maxbytes) {
            $maxbytes = 32000;
         }
         
         $ips[$x]["maxbytes"] = $maxbytes;
         $ips[$x]["banda_alocada"] = $banda_alocada;
         $ips[$x]["dir"] = str_replace("/", "-", $ips[$x]["ipaddr"]);
         
         /////
         
         

         if( $ips[$x]["banda_up"] != 0 ) {
            $ips_disponiveis[$iid] = $ips[$x];
            $iid++;

            $servicos_altq = array();
            $sac = 0; // contador;
         
         
            $if_externa = $ips[$x]["interface_externa"];
            $if_interna = $ips[$x]["interface_interna"];
            
            // Redes n�o possuem MACs. Por seguran�a n�o colocamos as redes no arquivo de MACS.
            if( !strstr( $ips[$x]["ipaddr"], "/") && $ips[$x]["mac"] ) {
               $macs[$mi]["ipaddr"] = $ips[$x]["ipaddr"];
               $macs[$mi]["mac"] = $ips[$x]["mac"];
               $mi++;
            }

            // Cliente Ativo, verificar os servi�os
            $sSQL = "SELECT " . 
                    "   cs.servico, s.porta, cs.banda_down, cs.tipo_banda_down, " . 
                    "   cs.banda_up, cs.tipo_banda_up ".
                    "FROM ".
                    "   bmtb_cliente_servico as cs, bmtb_servico as s ".
                    "WHERE " . 
                    "   cs.username = '".AddSlashes(trim($username))."' " .
                    "   AND cs.servico = s.servico ".
                    "ORDER BY ".
                    "   cs.servico ";
            $servicos = $bd->obtemRegistros($sSQL);
            
            for( $i=0;$i<count($servicos);$i++) {
               $label2 = $servicos[$i]["servico"];
               $label2 = str_replace("-","",$label2);
               $label2 = str_replace("_","", $label2);
               
               $servicos[$i]["altq_plabel"] = $ips[$x]["altq_label"];
               $servicos[$i]["altq_label"] = $label . "-" . $label2;
               $servicos[$i]["if_up"] = $if_externa;
               $servicos[$i]["if_down"] = $if_interna;
               $servicos[$i]["ipaddr"] = $ips[$x]["ipaddr"];

               /**
                * Bloqueio de Redes ou Servi�os (In�cio)
                */
               
               $servicos[$i]["banda_up"] = (int) $servicos[$i]["banda_up"];
               $servicos[$i]["banda_down"] = (int) $servicos[$i]["banda_down"];
               
               $sem_up   = "";
               $sem_down = "";
               if( ! $servicos[$i]["banda_up"] ) {
                  $servicos_bloqueados[$sbc]["username"] = $ips[$x]["username"];
                  $servicos_bloqueados[$sbc]["servico"] = $servicos[$i]["servico"];
                  $servicos_bloqueados[$sbc]["tipo_bloqueio"] = "out";
                  $servicos_bloqueados[$sbc]["origem"] = $ips[$x]["ipaddr"];
                  $servicos_bloqueados[$sbc]["destino"] = "any port " . $servicos[$i]["porta"];
                  $sbc++;
                  $sem_up = "#";
               }
               if( ! $servicos[$i]["banda_down"] ) {
                  $servicos_bloqueados[$sbc]["username"] = $ips[$x]["username"];
                  $servicos_bloqueados[$sbc]["servico"] = $servicos[$i]["servico"];
                  $servicos_bloqueados[$sbc]["tipo_bloqueio"] = "in";
                  $servicos_bloqueados[$sbc]["origem"] = "any" ;
                  $servicos_bloqueados[$sbc]["destino"] = $ips[$x]["ipaddr"] . " port " . $servicos[$i]["porta"];
                  $sbc++;
                  $sem_down = "#";
               }
               
               if( ! ($sem_up && $sem_down) ) {
                  $servicos_altq[$sac]["servico"] = $servicos[$i]["servico"];
                  $servicos_altq[$sac]["altq_label"] = $servicos[$i]["altq_label"];
                  $servicos_altq[$sac]["altq_plabel"] = $servicos[$i]["altq_plabel"];
                  $servicos_altq[$sac]["porta"] = $servicos[$i]["porta"];
                  $servicos_altq[$sac]["if_up"] = $servicos[$i]["if_up"];
                  $servicos_altq[$sac]["if_down"] = $servicos[$i]["if_down"];
                  $servicos_altq[$sac]["banda_up"] = $servicos[$i]["banda_up"];
                  $servicos_altq[$sac]["tipo_banda_up"] = $servicos[$i]["tipo_banda_up"];
                  $servicos_altq[$sac]["banda_down"] = $servicos[$i]["banda_down"];
                  $servicos_altq[$sac]["tipo_banda_down"] = $servicos[$i]["tipo_banda_down"];
                  $servicos_altq[$sac]["alvo"] = obtemAlvo( $ips[$x]["ipaddr"] );
                  $servicos_altq[$sac]["sem_up"] = $sem_up;
                  $servicos_altq[$sac]["sem_down"] = $sem_down;
                  $sac++;
               }
               
               
               
               /**
                * Bloqueio de Redes ou Servi�os (Fim)
                */
               
            }

            $altq_ips[$aic] = $ips[$x];

            
            if( count($servicos_altq) ) {
               $pgTPL->load_file("ALTQ_SERV", $PATHS["systpl"]."/altq-svc.tpl");
               $pgTPL->parse_loop("ALTQ_SERV", "servicos_altq");
               $altq_ips[$aic]["svc"] = $pgTPL->pget("ALTQ_SERV");
            }

            $altq_ips[$aic]["alvo"] = obtemAlvo( $ips[$x]["ipaddr"] );
            $aic++;

         }
      }
      
      $versao_mbm = $MBM["versao"];
      $resposta .= "\n";

      /********************************
       * Esquema de banda alternativa *
       ********************************/

      // pf.comercial.conf
      $resposta .= "Gerando arquivo 'pf.conf'\n";
      $pgTPL->load_file("PF_PRE_CONF", $PATHS["etc"]."/pf.pre.conf");
      $PF_PRE_CONF = $pgTPL->pget("PF_PRE_CONF");
      $pgTPL->load_file("PF_POS_CONF", $PATHS["etc"]."/pf.pos.conf");
      $PF_POS_CONF = $pgTPL->pget("PF_POS_CONF");
      $pgTPL->load_file("PF_CONF", $PATHS["systpl"]."/pf.tpl");
      $pgTPL->register("PF_CONF", "PF_PRE_CONF,PF_POS_CONF");
      $pgTPL->parse("PF_CONF");
      $pgTPL->parse_loop("PF_CONF", "interfaces");
      $pgTPL->parse_loop("PF_CONF", "queue_list");
      $pgTPL->parse_loop("PF_CONF", "redes_bloqueadas");
      $pgTPL->parse_loop("PF_CONF", "ips_bloqueados");
      $pgTPL->parse_loop("PF_CONF", "ips_disponiveis");
      $pgTPL->parse_loop("PF_CONF", "servicos_bloqueados");

      $pgTPL->register("PF_CONF", "versao_mbm");
      $pgTPL->parse("PF_CONF");
      
      $fd=fopen( $PATHS["etc"]."/pf.comercial.conf", "w" );
      fwrite($fd, $pgTPL->pget("PF_CONF") );
      fclose($fd);
      $pgTPL->unload("PF_CONF");


      // mrtg.conf
      $resposta .= "Gerando arquivo 'mrtg.conf'\n";
      $saida = $mrtgCONF["saida"];
      $script = $mrtgCONF["script"];
      $refresh = $mrtgCONF["refresh"];
      $intervalo = $mrtgCONF["intervalo"];
      $lingua = $mrtgCONF["lingua"];
      $icones = $mrtgCONF["icon_dir"];
      $local_link = $mrtgCONF["local"];

      $resposta .= "\n";


      $pgTPL->load_file("MRTG_CONF", $PATHS["systpl"]."/mrtg.tpl");
      //$pgTPL->parse_loop("MRTG_CONF", "ips");
      $pgTPL->parse_loop("MRTG_CONF", "ips_disponiveis");
      $pgTPL->register("MRTG_CONF", "versao_mbm,saida,refresh,intervalo,lingua,icones,script,local_link");
      $pgTPL->parse("MRTG_CONF");

      $fd=fopen( $PATHS["etc"]."/mrtg.comercial.conf", "w" );
      fwrite($fd,$pgTPL->pget("MRTG_CONF"));
      fclose($fd); 
      $pgTPL->unload("MRTG_CONF");

      
      /*********************************************/
      
      // Obs -> IPs disponiveis tem metade to tamanho da queue_list
      for($x=0;$x<count($queue_list);$x++) {
         if($queue_list[$x]["banda_alt"] != '0 b'  && $queue_list[$x]["banda_alt"] != '' ) {
            $queue_list[$x]["banda"] = $queue_list[$x]["banda_alt"];
            
            // atualiza as informa��es do MRTG
            
            // So mexer nos IPs disponiveis das 100 primeiras queue_lists
            if($x<count($ips_disponiveis)) {

               // MRTG
               // echo "ql: " . $queue_list[$x]["ipaddr"] . " - ipd: " . $ips_disponiveis[$x]["ipaddr"] . "<br>\n";
               $banda_down = $queue_list[$x]["banda_down_alt"];
               $banda_up = $queue_list[$x]["banda_up_alt"];
               $tipo_banda_down = $queue_list[$x]["tipo_banda_down_alt"];
               $tipo_banda_up = $queue_list[$x]["tipo_banda_up_alt"];

               if( $banda_down > $banda_up ) {
                  $maxbytes = $tipo_banda_down ? $banda_down * 125 : 32000;
               } else {
                  $maxbytes = $tipo_banda_up ? $banda_up * 125 : 32000;
               }
             
               $banda_alocada = "UP: ".$banda_up . $tipo_banda_up . "/DOWN: " . $banda_down . $tipo_banda_down;
             
               if( $tipo_banda_up == "M" ) {
                  $maxbytes *= 1024;
               }
             
               if( $maxbytes > $mrtgCONF["maxbytes"] * 125 ) {
                  $maxbytes = $mrtgCONF["maxbytes"] * 125;
               }
             
               if(!$maxbytes) {
                  $maxbytes = 32000;
               }
         
               $ips_disponiveis[$x]["maxbytes"] = $maxbytes;
               $ips_disponiveis[$x]["banda_alocada"] = $banda_alocada;
            }
            
            
         }
      }



      // pf.alternativo.conf
      $resposta .= "Gerando arquivo 'pf.conf'\n";
      $pgTPL->load_file("PF_PRE_CONF", $PATHS["etc"]."/pf.pre.conf");
      $PF_PRE_CONF = $pgTPL->pget("PF_PRE_CONF");
      $pgTPL->load_file("PF_POS_CONF", $PATHS["etc"]."/pf.pos.conf");
      $PF_POS_CONF = $pgTPL->pget("PF_POS_CONF");
      $pgTPL->load_file("PF_CONF", $PATHS["systpl"]."/pf.tpl");
      $pgTPL->register("PF_CONF", "PF_PRE_CONF,PF_POS_CONF");
      $pgTPL->parse("PF_CONF");
      $pgTPL->parse_loop("PF_CONF", "interfaces");
      $pgTPL->parse_loop("PF_CONF", "queue_list");
      $pgTPL->parse_loop("PF_CONF", "redes_bloqueadas");
      $pgTPL->parse_loop("PF_CONF", "ips_bloqueados");
      $pgTPL->parse_loop("PF_CONF", "ips_disponiveis");
      $pgTPL->parse_loop("PF_CONF", "servicos_bloqueados");
      //$pgTPL->parse_loop("PF_CONF", "ips");

      $pgTPL->register("PF_CONF", "versao_mbm");
      $pgTPL->parse("PF_CONF");
      
      $fd=fopen( $PATHS["etc"]."/pf.alternativo.conf", "w" );
      fwrite($fd, $pgTPL->pget("PF_CONF") );
      fclose($fd);
      $pgTPL->unload("PF_CONF");

      $pgTPL->load_file("MRTG_CONF", $PATHS["systpl"]."/mrtg.tpl");
      //$pgTPL->parse_loop("MRTG_CONF", "ips");
      $pgTPL->parse_loop("MRTG_CONF", "ips_disponiveis");
      $pgTPL->register("MRTG_CONF", "versao_mbm,saida,refresh,intervalo,lingua,icones,script,local_link");
      $pgTPL->parse("MRTG_CONF");

      $fd=fopen( $PATHS["etc"]."/mrtg.alternativo.conf", "w" );
      fwrite($fd,$pgTPL->pget("MRTG_CONF"));
      fclose($fd); 
      $pgTPL->unload("MRTG_CONF");



      /*********************************************/
      
      // Verifica Se estamos dentro do hor�rio comercial
      
      $agora = getDate();
      $hora = $agora["hours"];
      $diaSem = $agora["wday"];
      
      // Por padr�o estamos no hor�rio alternativo
      $hr = "ALTERNATIVO";
      
      if( ($diaSem >0 && $diaSem<6&&$hora>=$hCom["semana"]["ini"] && $hora<$hCom["semana"]["fim"]) ||
          ($diaSem = 6 && $hora>=$hCom["sabado"]["ini"] && $hora<$hCom["sabado"]["fim"]) ){
         $hr = "COMERCIAL";
         copy( $PATHS["etc"]."/pf.comercial.conf", $PATHS["etc"]."/pf.conf" );
         copy( $PATHS["etc"]."/mrtg.comercial.conf", $PATHS["etc"]."/mrtg.conf" );
      } else {
         copy( $PATHS["etc"]."/pf.alternativo.conf", $PATHS["etc"]."/pf.conf" );
         copy( $PATHS["etc"]."/mrtg.alternativo.conf", $PATHS["etc"]."/mrtg.conf" );

      }
      
      $fd=fopen( $PATHS["etc"]."/pfatual", "w" );
      fwrite($fd,$hr);
      fclose($fd);
      
      /********************************
       * FIM                          *
       ********************************/
      
      // interfaces.conf
      $resposta .= "Gerando arquivo 'interfaces.conf'\n";
      $pgTPL->load_file("INTS_CONF", $PATHS["systpl"]."/interfaces.tpl");
      $pgTPL->parse_loop("INTS_CONF", "if_internas");
      
      $fd=fopen( $PATHS["etc"]."/interfaces.conf", "w" );
      fwrite($fd,$pgTPL->pget("INTS_CONF") );
      fclose($fd);
      $pgTPL->unload("INTS_CONF");


      // macs.conf
      $resposta .= "Gerando arquivo 'macs.conf'\n";
      $pgTPL->load_file("MACS_CONF", $PATHS["systpl"]."/macs.tpl");
      $pgTPL->parse_loop("MACS_CONF", "macs");
      
      $fd=fopen( $PATHS["etc"]."/macs.conf", "w" );
      fwrite($fd,$pgTPL->pget("MACS_CONF") );
      fclose($fd);
      $pgTPL->unload("MACS_CONF");
      
      // altq.conf
      //$resposta .= "Gerando arquivo 'altq.conf'\n";
      //$pgTPL->load_file("ALTQ_CONF", $PATHS["systpl"]."/altq.tpl");
      //$pgTPL->parse_loop("ALTQ_CONF", "interfaces");
      //$pgTPL->parse_loop("ALTQ_CONF", "interfaces");
      //$pgTPL->parse_loop("ALTQ_CONF", "interfaces");
      //$pgTPL->parse_loop("ALTQ_CONF", "altq_ips");
      //$pgTPL->register("ALTQ_CONF", "versao_mbm");
      //$pgTPL->parse("ALTQ_CONF");
      
      //$fd=fopen( $PATHS["etc"]."/altq.conf", "w" );
      //fwrite($fd,$pgTPL->pget("ALTQ_CONF"));
      //fclose($fd); 
      //$pgTPL->unload("ALTQ_CONF");
      

      // Executa a rotina de atualizacao
      $fp = popen( $SUDO . " " . $ATUALIZA_SH, "r" );
      if( !$fp ) {
         $resposta .= "N�o foi poss�vel abrir o PIPE !!! Opera��o n�o executada !!! ";
      } else {
         while( !feof($fp) ) {
            $read = fread($fp, 2096);
            $resposta .= $read;
         }
      }
      pclose($fp);

   } else {
      $tplVars = "SELF,userAdmin";
      $SELF = $PHP_SELF;
      $sArqTemplate = "confirmar_atualizacao.tpl";                   
   }
?>
