<?
   /**
    * excluir.inc
    * Exclus�es
    * CopyRight(c) 2002 - Mosman Solu��es
    * Autor; Andrei de Oliveira Mosman
    * Email: mosman@mosman.com.br / andreimosman@hotmail.com
    */
    
    // REQUEST parametros - INICIO
    
    $oper = @$_REQUEST["oper"];
    $userAdmin = $_SESSION["sessLogin"];
    
    
    // REQUEST parametros - FINAL
    
    
    
    
   
   $tplVars = "SELF,userAdmin";
   $SELF = $PHP_SELF;

   /**
    * Excluir Interface
    */
   if( $sessao == "excluirInterface" ) {
      $tplVars .= ",interface";
      if( !$interface ) {
         include( $PATHS["inc"]. "/home.inc" );
      } else {
         // Clientes Afetados
         $sSQL = "SELECT " . 
                 "   c.username ".
                 "FROM ".
                 "   bmtb_cliente as c, bmtb_ip as i ".
                 "WHERE ".
                 "   c.ipaddr = i.ipaddr ".
                 "   AND ( i.interface_externa = '".AddSlashes(trim($interface))."' ".
                 "   OR i.interface_interna = '".AddSlashes(trim($interface))."' ) ";
         
         $clientes = $bd->obtemRegistros($sSQL);
         $tplLoops[] = "clientes";

         // IPs afetados
         $sSQL = "SELECT " . 
                 "   ipaddr ".
                 "FROM ".
                 "   bmtb_ip as i ".
                 "WHERE ".
                 "   ( i.interface_externa = '".AddSlashes(trim($interface))."' ".
                 "   OR i.interface_interna = '".AddSlashes(trim($interface))."' ) ";
         
         $ips = $bd->obtemRegistros($sSQL);
         $tplLoops[] = "ips";         

         if( $oper != "confirma" || $confirma != "excluir" ) {
            // Exibir tela de confirma��o
            if(!count($clientes)) {
               $clientes[0]["username"] = "Nenhum cliente ser� exclu�do !!!";
            }
            if(!count($ips)) {
               $ips[0]["ipaddr"] = "Nenhum IP ser� exclu�do !!!";
            }
            $sArqTemplate = "confirmar_exclusao_interface.tpl";
         } else {
            // Excluir
            
            // Excluir cliente:
            if(count($clientes)) {
               $lsCli = array();
               for($x=0;$x<count($clientes);$x++) {
                  $lsCli[] = "'" . AddSlashes(trim($clientes[$x]["username"])) . "'";
               }

               // Informa��es associados ao cliente
               $sSQL = "DELETE FROM bmtb_cliente_info WHERE username in (" .join(",",$lsCli) . ") ";
               $bd->consulta($sSQL,false);
               
               // Servi�os associados ao cliente
               $sSQL = "DELETE FROM bmtb_cliente_servico WHERE username in (" .join(",",$lsCli) . ") ";
               $bd->consulta($sSQL,false);

               // Clientes
               $sSQL = "DELETE FROM bmtb_cliente WHERE username in (" .join(",",$lsCli) . ") ";
               $bd->consulta($sSQL,false);
            }
            
            // Excluir IPs:
            if(count($ips)) {
               $lsIPs = array();
               for($x=0;$x<count($ips);$x++) {
                  $lsIPs[] = "'" . AddSlashes(trim($ips[$x]["ipaddr"])) . "'";
               }
               
               // IPs
               $sSQL = "DELETE FROM bmtb_ip WHERE ipaddr in (" .join(",",$lsIPs) . ") ";
               $bd->consulta($sSQL,false);

            }            
            
            // Excluir interface
            $sSQL = "DELETE FROM bmtb_interface WHERE interface = '" . AddSlashes(trim($interface)) . "' ";
            $bd->consulta($sSQL,false);
            
            
            
            
            // Apresenta��o
            if(!count($clientes)) {
               $clientes[0]["username"] = "Nenhum cliente foi exclu�do !!!";
            }
            if(!count($ips)) {
               $ips[0]["ipaddr"] = "Nenhum IP foi exclu�do !!!";
            }


            $sArqTemplate = "confirmar_exclusao_interface_ok.tpl";

         }
      }
   }


   /**
    * Excluir Servi�o
    */
   if( $sessao == "excluirServico" ) {
      $tplVars .= ",servico";
      if( !$servico ) {
         include( $PATHS["inc"]. "/home.inc" );
      } else {
         // Clientes Afetados
         $sSQL = "SELECT " . 
                 "   username ".
                 "FROM ".
                 "   bmtb_cliente_servico ".
                 "WHERE ".
                 "   servico = '".AddSlashes(trim($servico))."' ";
         
         $clientes = $bd->obtemRegistros($sSQL);
         $tplLoops[] = "clientes";

         if( $oper != "confirma" || $confirma != "excluir" ) {
            // Exibir tela de confirma��o
            if(!count($clientes)) {
               $clientes[0]["username"] = "Nenhum cliente utiliza este filtro";
            }
            $sArqTemplate = "confirmar_exclusao_servico.tpl";
         } else {
            // Excluir
            
            // Excluir filtro aplicado nos cliente:
            $sSQL = "DELETE FROM bmtb_cliente_servico WHERE servico = '" . AddSlashes(trim($servico)) . "' ";
            $bd->consulta($sSQL,false);
            
            // Excluir servi�o
            $sSQL = "DELETE FROM bmtb_servico WHERE servico = '" . AddSlashes(trim($servico)) . "' ";
            $bd->consulta($sSQL,false);
            
            
            
            
            // Apresenta��o
            if(!count($clientes)) {
               $clientes[0]["username"] = "Nenhum cliente utilizava este filtro !!!";
            }

            $sArqTemplate = "confirmar_exclusao_servico_ok.tpl";

         }
      }
   }

   /**
    * Excluir IP
    */
   if( $sessao == "excluirIP" ) {
      $tplVars .= ",ip";
      if( !$ip ) {
         include( $PATHS["inc"]. "/home.inc" );
      } else {
         // Clientes Afetados
         $sSQL = "SELECT " . 
                 "   c.username ".
                 "FROM ".
                 "   bmtb_cliente as c ".
                 "WHERE ".
                 "   c.ipaddr = '".AddSlashes(trim($ip)) . "' ";
         
         $clientes = $bd->obtemRegistros($sSQL);
         $tplLoops[] = "clientes";

         if( $oper != "confirma" || $confirma != "excluir" ) {
            // Exibir tela de confirma��o
            if(!count($clientes)) {
               $clientes[0]["username"] = "Nenhum cliente associado � este IP !!!";
            }
            $sArqTemplate = "confirmar_exclusao_ip.tpl";
         } else {
            // Excluir
            
            // Excluir cliente:
            if(count($clientes)) {
               $lsCli = array();
               for($x=0;$x<count($clientes);$x++) {
                  $lsCli[] = "'" . AddSlashes(trim($clientes[$x]["username"])) . "'";
               }
               
               // Informa��es associadas ao cliente
               $sSQL = "DELETE FROM bmtb_cliente_info WHERE username in (" .join(",",$lsCli) . ") ";
               $bd->consulta($sSQL,false);

               // Servi�os assiciados ao cliente
               $sSQL = "DELETE FROM bmtb_cliente_servico WHERE username in (" .join(",",$lsCli) . ") ";
               $bd->consulta($sSQL,false);

               // Clientes
               $sSQL = "DELETE FROM bmtb_cliente WHERE username in (" .join(",",$lsCli) . ") ";
               $bd->consulta($sSQL,false);
            }
            
            // Excluir IP
            $sSQL = "DELETE FROM bmtb_ip WHERE ipaddr = '" . AddSlashes(trim($ip)) . "' ";
            $bd->consulta($sSQL,false);
            
	    //rogerio-Alteracao 
            // Excluir IP alternativo
            $sSQL = "DELETE FROM bmtb_ip_alternativo WHERE ipaddr = '" . AddSlashes(trim($ip)) . "' ";
            $bd->consulta($sSQL,false);
 
            
            // Apresenta��o
            if(!count($clientes)) {
               $clientes[0]["username"] = "Nenhum cliente estava associado � este IP !!!";
            }


            $sArqTemplate = "confirmar_exclusao_ip_ok.tpl";
         }
      }
   }


   /**
    * Excluir Cliente
    */
   if( $sessao == "excluirCliente" ) {
      $tplVars .= ",username";
      if( !$username ) {
         include( $PATHS["inc"]. "/home.inc" );
      } else {

         if( $oper != "confirma" || $confirma != "excluir" ) {
            // Exibir tela de confirma��o
            $sArqTemplate = "confirmar_exclusao_cliente.tpl";
         } else {
            // Excluir
            
            // Excluir cliente:
            $sSQL = "DELETE FROM bmtb_cliente_servico WHERE username = '".AddSlashes(trim($username))."'";
            $bd->consulta($sSQL,false);

            // Excluir Informa��es do cliente:
            $sSQL = "DELETE FROM bmtb_cliente_info WHERE username = '".AddSlashes(trim($username))."'";
            $bd->consulta($sSQL,false);

            // Cliente
            $sSQL = "DELETE FROM bmtb_cliente WHERE username = '".AddSlashes(trim($username))."'";
            $bd->consulta($sSQL,false);
            
            // Apresenta��o

            $sArqTemplate = "confirmar_exclusao_cliente_ok.tpl";
         }
      }
   }

   
?>
