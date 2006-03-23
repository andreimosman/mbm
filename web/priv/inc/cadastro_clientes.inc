<?
   /**
    * cadastro_clientes.inc
    * Administração dos usernames
    * CopyRight(c) 2002 - Mosman Soluções
    * Autor; Andrei de Oliveira Mosman
    * Email: mosman@mosman.com.br / andreimosman@hotmail.com
    */

   require_once( $PATHS["lib"] ."/classe_radius.inc" );

   $oldTplVars = $tplVars;

   // Variáveis do formulário
   $tplVars = "SELF,username,mac,senha,ipaddr,us_orig,status_ck1,status_ck2,".
              "nome_razao,tp_pessoa,cpf_cnpj,rg_ie,logradouro,numero,complemento, ".
              "bairro, cidade,uf,cep,fone,dt_ativacao,resp_tecnico,email,flg_comodato, ".
              "flg_gw_ips,tipo_conexao,observacoes,pppoe_select";


   // Variáveis de exibição
   $tplVars .= ",ip_select,uf_select,tp_pessoa_ck1,tp_pessoa_ck2,flg_gw_isp_ck1,flg_gw_isp_ck2,flg_comodato_ck1,flg_comodato_ck2,tipo_conexao_ck1,tipo_conexao_ck2,submit";
   // Identifica a operação que eu está sendo executada (via hidden)
   $tplVars .= ",oper";


   $sArqTemplate = $sDirTemplate."/cadastro_cliente.tpl";
   
   $registroEncontrado = 0;
   $bExibirListagem = 0;
   
   $nenhum = "";
   $desc_filtro = "";
   
   if(!$servicos) {
      $servicos = array();
   }
   
   if(!$banda_down) {
      $banda_down = array();
   }
   
   if(!$banda_up) {
      $banda_up = array();
   }
   
   function existeCliente($usr,$usrOrig="") {
      global $bd;
 
      $query = "SELECT ".
              "   username ".
              "FROM ".
              "   bmtb_cliente ".
              "WHERE ".
              "   username = '".AddSlashes($usr)."' ";
      if($nomeOrig) {
         $query .= "   AND username != '".AddSlashes($userOrig) . "' ";
      }
      
      $resultado = $bd->obtemRegistros( $query );
      
      return( count($resultado) );
      
   }

   function existeClienteInfo($usr,$usrOrig="") {
      global $bd;
 
      $query = "SELECT ".
              "   username ".
              "FROM ".
              "   bmtb_cliente_info ".
              "WHERE ".
              "   username = '".AddSlashes($usr)."' ";
      if($nomeOrig) {
         $query .= "   AND username != '".AddSlashes($userOrig) . "' ";
      }
      
      $resultado = $bd->obtemRegistros( $query );
      
      return( count($resultado) );
      
   }   

   function existeMAC($macaddr,$usr="") {
      return( "" ); // multiplos ip por mac (gambi)
      global $bd;
 
      $query = "SELECT ".
              "   username ".
              "FROM ".
              "   bmtb_cliente ".
              "WHERE ".
              "   mac = '".AddSlashes($macaddr)."' ";
      if($usr) {
         $query .= "   AND username != '".AddSlashes($usr) . "' ";
      }
      
      $resultado = $bd->obtemRegistros( $query );
      
      return( $resultado[0]["username"] );
      
   }



   $opRadius = new Radius($bd);

   if( $sessao=="listaClientes" ) {
      $bExibirListagem = 1;
   }
   if( $sessao=="alteracaoCliente" && !$oper ) {
      if( !$username ) {
         // Exibir listagem das usernames
         $bExibirListagem = 1;
         
      } else {
         // Consultar a username no banco de dados
         $sSQL = "SELECT ".
                 "   c.username, c.senha, c.ipaddr, c.mac, c.status, ".
                 "   i.nome_razao, i.tp_pessoa, i.cpf_cnpj, i.rg_ie, i.logradouro, i.numero, i.complemento, ".
                 "   i.bairro, i.cidade, i.uf, i.cep, i.fone, to_char( i.dt_ativacao, 'DD/MM/YYYY') as dt_ativacao, i.resp_tecnico, i.email, i.flg_comodato, ".
                 "   i.flg_gw_isp, i.tipo_conexao, i.observacoes, ".
                 "   CASE WHEN pppoe = true THEN 1 ELSE 0 END as pppoe ".
                 "FROM ".
                 "   bmtb_cliente as c LEFT OUTER JOIN bmtb_cliente_info as i USING( username ) ".
                 "WHERE ".
                 "   username = '".AddSlashes(trim($username))."' ";

         $aResultado = $bd->obtemRegistros( $sSQL );
         
         $registroEncontrado = count($aResultado);
         
         for($x=0;$x<count($aResultado);$x++) {
            while (list ($variavel, $valor) = each ($aResultado[$x])) {
	        $$variavel = $valor;
            }
         }
         $us_orig = $username;
         
         // Servicos
         $sSQL = "SELECT servico,banda_down,tipo_banda_down,banda_up,tipo_banda_up FROM bmtb_cliente_servico WHERE username = '".AddSlashes(trim($username))."' ";
         $svcl = $bd->obtemRegistros($sSQL);
         
         $servicos = array();
         $banda_down = array();
         $tp_bd = array();
         $banda_up = array();
         $tp_bu = array();
         for($y=0;$y<count($svcl);$y++) {
            $servicos[] = $svcl[$y]["servico"];
            $sv = $svcl[$y]["servico"];
            $banda_up[$sv] = $svcl[$y]["banda_up"];
            $tp_bu[$sv] = $svcl[$y]["tipo_banda_up"];
            $banda_down[$sv] = $svcl[$y]["banda_down"];
            $tp_bd[$sv] = $svcl[$y]["tipo_banda_down"];
         }
      }
   }

   require_once($PATHS["lib"]."/altq-util.inc");
   
   function erroBanda($ip,$arrSvc) {
      if( !$arrSvc ) {
         return "";
      }

      global $bd;
      // Obtem a informação do link
      $sSQL = "SELECT banda_up, tipo_banda_up, banda_down, tipo_banda_down FROM bmtb_ip WHERE ipaddr='".$ip."'";
      $lsIPs = $bd->obtemRegistros($sSQL);
      
      $bandaUP = bandaBPS( $lsIPs[0]["banda_up"], $lsIPs[0]["tipo_banda_up"] );
      $bandaDOWN = bandaBPS( $lsIPs[0]["banda_down"], $lsIPs[0]["tipo_banda_down"] );

      $svcUP = 0;
      $svcDOWN = 0;
      global $banda_up, $tp_bu, $banda_down, $tp_bd;
      
      foreach($arrSvc as $svc) {
         if($svc) {
            $bndU = bandaBPS($banda_up[$svc],$tp_bu[$svc]);
            $bndD = bandaBPS($banda_down[$svc],$tp_bd[$svc]);
            
            if( ($bndD > 0 && $bndD < 6144) || ($bndU > 0 && $bndU < 6144) ) {
               return "Não é permitido cadastrar serviços com banda inferior a 6K.";
            }

            $svcUP += $bndU;
            $svcDOWN += $bndD;
         }
      }
      
      if( $svcUP > $bandaUP || $svcDOWN > $bandaDOWN ) {
         return "A banda total alocada para os filtros por serviços ultrapassou a banda total do link. Verifique !!!";
      }
      
      return "";
   }
   
   
   

   require_once($PATHS["lib"]."/functions_html.inc");
   
   function varsApresentacao() {
   
      global $status;
      global $status_ck1;
      global $status_ck2;
      
      global $tp_pessoa;
      global $tp_pessoa_ck1;
      global $tp_pessoa_ck2;
      
      global $flg_gw_isp;
      global $flg_gw_isp_ck1;
      global $flg_gw_isp_ck2;
      
      global $flg_comodato;
      global $flg_comodato_ck1;
      global $flg_comodato_ck2;
      
      global $tipo_conexao;
      global $tipo_conexao_ck1;
      global $tipo_conexao_ck2;
      
      global $lsEstados;
      global $uf;
      global $uf_select;
      
      global $pppoe;
      global $pppoe_select;
      global $lsSimNao;

      $pppoe = (int) $pppoe ? "1" : "0";
      $pppoe_select = criaListaSelect("pppoe", $lsSimNao, $pppoe,false);

      if(!$status) $status = "A";
      $status_ck1 = $status == "A" ? "checked" : "";
      $status_ck2 = $status == "B" ? "checked" : "";
      
      if(!$tp_pessoa) $tp_pessoa = "F";
      $tp_pessoa_ck1 = $tp_pessoa == "F" ? "checked" : "";
      $tp_pessoa_ck2 = $tp_pessoa == "J" ? "checked" : "";
   
      if(!$flg_gw_isp) $flg_gw_isp = "f";
      $flg_gw_isp_ck1 = $flg_gw_isp == "t" ? "checked" : "";
      $flg_gw_isp_ck2 = $flg_gw_isp == "f" ? "checked" : "";
   
      if(!$flg_comodato) $flg_comodato = "t";
      $flg_comodato_ck1 = $flg_comodato == "t" ? "checked" : "";
      $flg_comodato_ck2 = $flg_comodato == "f" ? "checked" : "";
   
      if(!$tipo_conexao) $tipo_conexao = "R";
      $tipo_conexao_ck1 = $tipo_conexao == "R" ? "checked" : "";
      $tipo_conexao_ck2 = $tipo_conexao == "C" ? "checked" : "";
   
      $uf_select = criaListaSelect("uf", $lsEstados, $uf);

   }
   


   /**
   $lsTipo = array();
   $lsTipo[0]["id"] = "P";
   $lsTipo[0]["nome"] = "%";
   $lsTipo[1]["id"] = "";
   $lsTipo[1]["nome"] = "bps";
   $lsTipo[2]["id"] = "K";
   $lsTipo[2]["nome"] = "Kbps";
   $lsTipo[3]["id"] = "M";
   $lsTipo[3]["nome"] = "Mbps";
   */
   $lsTipo = array();
   $lsTipo[0]["id"] = "";
   $lsTipo[0]["nome"] = "bps";
   $lsTipo[1]["id"] = "K";
   $lsTipo[1]["nome"] = "Kbps";
   $lsTipo[2]["id"] = "M";
   $lsTipo[2]["nome"] = "Mbps";
   
   // Sim/Não
   $lsSimNao[0]["id"] = "1";
   $lsSimNao[0]["nome"] = "Sim";
   $lsSimNao[1]["id"] = "0";
   $lsSimNao[1]["nome"] = "Nao";


   varsApresentacao();

   if($oper == "efetuaCadastro") {
      /*******************************
       * Inicio da rotina de cadastro
       *******************************/

      // Tenta inserir no banco, caso contrário reporta o erro.
      
      $camposEsquecidos = array();
      
      // Verifica os campos obrigatórios
      if( !$username ) $camposEsquecidos[] = "username";
      if( !$ipaddr ) $camposEsquecidos[] = "IP";
      
      if(count($camposEsquecidos)) $sErro = "Você se esqueceu de preencher alguns campos (".join("/", $camposEsquecidos) . ").";
      
      if( existeCliente(trim($username)) > 0 ) $sErro = "Cliente já cadastrado... Escolha outro ou tente a opção alterar";
      if( $mac ) {
         $userMAC = existeMac(trim($mac));
         if( $userMAC ) $sErro = "Outro cliente já utiliza este MAC ($userMAC)";
      }
      
      $errB = erroBanda($ipaddr,$servicos);
      if( strlen($errB) ) $sErro = $errB;
      
      if(!$sErro) {
         $pppoe = (int) $pppoe;

         // Radius
         if( $status == "B" || !$pppoe )
            $opRadius->deleteUser($us_orig);
         else
            $opRadius->changeUser($us_orig,$username,$ipaddr,$senha);

         // Tenta inserir no banco de dados.
         $sSQL = "INSERT INTO ".
                 "   bmtb_cliente (username,senha,ipaddr,mac,status,pppoe) ".
                 "VALUES (".
                    "'".AddSlashes(trim($username))."', " .
                    "'".AddSlashes(trim($senha))."', " .
                    "'".AddSlashes(trim($ipaddr))."', " .
                    ($mac ? "'".AddSlashes(trim($mac))."', ": "NULL, ").
                    "'".AddSlashes(trim($status))."', " .
                    "'".AddSlashes(trim($pppoe))."'" .
                 ")";
         $bd->consulta($sSQL,false);
         
         if($dt_ativacao) {
            $tmpDT = explode("/", $dt_ativacao);
            // YYYY-MM-DD
            $dt_ativacao_cad = $tmpDT[2]."-".$tmpDT[1] . "-" . $tmpDT[0];
         }
	
         // Dados Cadastrais do Cliente
         $sSQL = "INSERT INTO ".
                 "   bmtb_cliente_info (username,nome_razao,tp_pessoa,cpf_cnpj,rg_ie,logradouro,numero,complemento,bairro,cidade,uf,cep,fone,dt_ativacao,resp_tecnico,email,flg_comodato,flg_gw_isp,tipo_conexao,observacoes) ".
                 "VALUES (".
                    "'".AddSlashes(trim($username))."', " .
                    "'".AddSlashes(trim($nome_razao))."', " .
                    "'".AddSlashes(trim($tp_pessoa))."', " .
                    "'".AddSlashes(trim($cpf_cnpj))."', " .
                    "'".AddSlashes(trim($rg_ie))."', " .
                    "'".AddSlashes(trim($logradouro))."', " .
                    "'".AddSlashes(trim($numero))."', " .
                    "'".AddSlashes(trim($complemento))."', " .
                    "'".AddSlashes(trim($bairro))."', " .
                    "'".AddSlashes(trim($cidade))."', " .
                    "'".AddSlashes(trim($uf))."', " .
                    "'".AddSlashes(trim($cep))."', " .
                    "'".AddSlashes(trim($fone))."', " .
                    ( $dt_ativacao ? "'".AddSlashes(trim($dt_ativacao_cad))."', " : "NULL," ) .
                    "'".AddSlashes(trim($resp_tecnico))."', " .
                    "'".AddSlashes(trim($email))."', " .
                    "'".AddSlashes(trim($flg_comodato))."', " .
                    "'".AddSlashes(trim($flg_gw_isp))."', " .
                    "'".AddSlashes(trim($tipo_conexao))."', " .
                    "'".AddSlashes(trim($observacoes))."' " .
                 ")";
         $bd->consulta($sSQL,false);
         

         $sSQL = "SELECT 'UP: ' || banda_up || tipo_banda_up || '/DOWN:' || banda_down || tipo_banda_down as banda FROM bmtb_ip WHERE ipaddr='".$ipaddr."'";
         $bnd = $bd->obtemRegistros($sSQL);

         $logMSG  = "USERNAME: $username\n";
         $logMSG .= "MAC: $mac\n";
         $logMSG .= "STATUS: $status\n";
         $logMSG .= "BANDA: " . $bnd[0]['banda'];

         // O grande irmão zela por ti
         $logger->registra($bd,$sessUID,"HABCLI",$logMSG);
         
         unset($logMSG);
         unset($bnd);
         
         
         // Cadastrar serviços
         foreach($servicos as $svc) {
            if($svc) {
               $sSQL = "INSERT INTO ".
                       "   bmtb_cliente_servico (username,servico,banda_up,tipo_banda_up,banda_down,tipo_banda_down) ".
                       "VALUES (".
                          "'".AddSlashes(trim($username))."', " .
                          "'".AddSlashes(trim($svc))."', " .
                          "'".AddSlashes(trim($banda_up[$svc]))."', " .
                          "'".AddSlashes(trim($tp_bu[$svc]))."', " .
                          "'".AddSlashes(trim($banda_down[$svc]))."', " .
                          "'".AddSlashes(trim($tp_bd[$svc]))."' " .
                       ")";
               $bd->consulta($sSQL,false);
            }
         }
         
         
         $sMensagem = "Cadastro do username '$username' efetuado com sucesso";
         
         $username = "";
         $ipaddr = "";
         $mac = "";
         $nome_razao = "";
         $tp_pessoa = "";
         $cpf_cnpj = "";
         $rg_ie = "";
         $logradouro = "";
         $numero = "";
         $complemento = "";
         $bairro = "";
         $cidade = "";
         $uf = "";
         $cep = "";
         $fone = "";
         $resp_tecnico = "";
         $email = "";
         $flg_gw_isp = "";
         $flg_comodato = "";
         $tipo_conexao = "";
         
         $tp_bd = array();
         $tp_bu = array();
         $banda_up = array();
         $banda_down = array();
         // $ = "";
         $servicos = array();
         
         varsApresentacao();
         
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
      if( !$username ) $camposEsquecidos[] = "username";
      if( !$ipaddr ) $camposEsquecidos[] = "IP";
      
      if(count($camposEsquecidos)) $sErro = "Você deixou alguns campos essenciais em branco (".join("/", $camposEsquecidos) . ").";
      
      if( $username != $us_orig ) {
         if( existeCliente(trim($username),$us_orig) > 0 ) $sErro = "Você está tentando alterar o nome do username contudo ja existe outro username cadastrado com esse nome... Escolha outro !";
      }
      
      // if( $mac && existeMac(trim($mac),$us_orig) > 0 ) $sErro = "Você está tentando alterar o MAC deste usuário, contudo outro cliente já utiliza este MAC";
      if( $mac ) {
         $userMAC = existeMac(trim($mac),$us_orig);
         if( $userMAC ) $sErro = "Outro cliente já utiliza este MAC ($userMAC)";
      }

      $errB = erroBanda($ipaddr,$servicos);
      if( $errB ) $sErro = $errB;

      if(!$sErro) {
         $pppoe = (int) $pppoe;

         // Radius
         if( $status == "B" || !$pppoe )
            $opRadius->deleteUser($us_orig);
         else
            $opRadius->changeUser($us_orig,$username,$ipaddr,$senha);



         $sSQL = "SELECT username,senha,ipaddr,mac,status FROM bmtb_cliente WHERE username='".$us_orig."'";
         $oldReg = $bd->obtemRegistros($sSQL);

         $logMSG = "";
         if( $username != $us_orig ) $logMSG .= "USERNAME: [$us_orig] para [$username]\n";
         if( $mac != $oldReg[0]['mac'] ) $logMSG .= "MAC: [$mac] para [".$oldReg[0]['mac']."]\n";
         if( $status != $oldReg[0]['status'] ) $logMSG .= "STATUS: [$status] para [".$oldReg[0]['status']."]\n";
         if( $ipaddr != $oldReg[0]['ipaddr'] ) {
            
            $sSQL = "SELECT 'UP: ' || banda_up || tipo_banda_up || '/DOWN:' || banda_down || tipo_banda_down as banda FROM bmtb_ip WHERE ipaddr='".$ipaddr."'";
            $newIPInfo = $bd->obtemRegistros($sSQL);
            $sSQL = "SELECT 'UP: ' || banda_up || tipo_banda_up || '/DOWN:' || banda_down || tipo_banda_down as banda FROM bmtb_ip WHERE ipaddr='".$oldReg[0]['ipaddr']."'";
            $oldIPInfo = $bd->obtemRegistros($sSQL);
                        
            $logMSG .= "IP: [".$oldIPInfo[0]['banda']."] para [".$newIPInfo[0]['banda']."]\n";
         }

         $logger->registra($bd,$sessUID,"ALTCLI",$logMSG);
         unset($logMSG);

         // Elimina os serviços cadastrados para este username         
         $sSQL = "DELETE FROM bmtb_cliente_servico WHERE username = '".AddSlashes(trim($us_orig))."' ";
         $bd->consulta($sSQL,false);

         // Elimina as informações cadastradas para este username
         $sSQL = "DELETE FROM bmtb_cliente_info WHERE username = '".AddSlashes(trim($us_orig))."' ";
         $bd->consulta($sSQL,false);

         // Altera os dados dos usernames
         $sSQL = "UPDATE bmtb_cliente SET " .
                 "   username = '".AddSlashes(trim($username))."', ".
                 "   ipaddr = '".AddSlashes(trim($ipaddr))."', ".
                 ( $senha ? "   senha = '".AddSlashes(trim($senha))."', " : "" ).
                 "   mac = " . ($mac ? "'".AddSlashes(trim($mac))."', " : "NULL,").
                 "   status = '".AddSlashes(trim($status))."', ".
                 "   pppoe = '".AddSlashes(trim($pppoe))."' ".
                 "WHERE username = '".$us_orig."'";
         
         $bd->consulta($sSQL,false);
         

         if($dt_ativacao) {
            $tmpDT = explode("/", $dt_ativacao);
            // YYYY-MM-DD
            $dt_ativacao_cad = $tmpDT[2]."-".$tmpDT[1] . "-" . $tmpDT[0];
         }

         // Dados Cadastrais do Cliente
         $sSQL = "INSERT INTO ".
                 "   bmtb_cliente_info (username,nome_razao,tp_pessoa,cpf_cnpj,rg_ie,logradouro,numero,complemento,bairro,cidade,uf,cep,fone,dt_ativacao,resp_tecnico,email,flg_comodato,flg_gw_isp,tipo_conexao,observacoes) ".
                 "VALUES (".
                    "'".AddSlashes(trim($username))."', " .
                    "'".AddSlashes(trim($nome_razao))."', " .
                    "'".AddSlashes(trim($tp_pessoa))."', " .
                    "'".AddSlashes(trim($cpf_cnpj))."', " .
                    "'".AddSlashes(trim($rg_ie))."', " .
                    "'".AddSlashes(trim($logradouro))."', " .
                    "'".AddSlashes(trim($numero))."', " .
                    "'".AddSlashes(trim($complemento))."', " .
                    "'".AddSlashes(trim($bairro))."', " .
                    "'".AddSlashes(trim($cidade))."', " .
                    "'".AddSlashes(trim($uf))."', " .
                    "'".AddSlashes(trim($cep))."', " .
                    "'".AddSlashes(trim($fone))."', " .
                    ( $dt_ativacao ? "'".AddSlashes(trim($dt_ativacao_cad))."', " : "NULL," ) .
                    "'".AddSlashes(trim($resp_tecnico))."', " .
                    "'".AddSlashes(trim($email))."', " .
                    "'".AddSlashes(trim($flg_comodato))."', " .
                    "'".AddSlashes(trim($flg_gw_isp))."', " .
                    "'".AddSlashes(trim($tipo_conexao))."', " .
                    "'".AddSlashes(trim($observacoes))."' " .
                 ")";
         $bd->consulta($sSQL,false);

         // Cadastra os serviços do username         
         foreach($servicos as $svc) {
            if($svc) {
               $sSQL = "INSERT INTO ".
                       "   bmtb_cliente_servico (username,servico,banda_up,tipo_banda_up,banda_down, tipo_banda_down) ".
                       "VALUES (".
                          "'".AddSlashes(trim($username))."', " .
                          "'".AddSlashes(trim($svc))."', " .
                          "'".AddSlashes(trim($banda_up[$svc]))."', " .
                          "'".AddSlashes(trim($tp_bu[$svc]))."', " .
                          "'".AddSlashes(trim($banda_down[$svc]))."', " .
                          "'".AddSlashes(trim($tp_bd[$svc]))."' " .
                       ")";
               $bd->consulta($sSQL,false);
            }
         }

         $us_orig = $username;
         $sMensagem = "Alteração dos dados do username '$username' efetuada com sucesso";
         
         
      } else {
         
      }

      /*******************************
       * Final da rotina de alteração
       *******************************/

   } else {

      if( $sessao=="cadastroCliente" || !$registroEncontrado && !$bExibirListagem) {
         $oper = "efetuaCadastro";
         $submit = "Cadastrar Cliente";
         $us_orig = "";
      } else {

      /*******************************
       * Início da rotina de listagem
       *******************************/

         if( $bExibirListagem ) {
            
            $tplVars = $oldTplVars;
         
            // Exibir a listagem dos usuários
            
            $sSQL = "SELECT ".
                    "   c.nome as username, c.ip, i.banda_up,i.tipo_banda_up,i.banda_down,i.tipo_banda_down, c.status ".
                    "FROM ".
                    "   bmtb_cliente as c, bmtb_ips as i ".
                    "WHERE ".
                    "   c.ip = i.ipaddr ";
                    
            /**
            // FILTRO
            if( $tipoFiltro == "T" ) {
               $desc_filtro = "<b>Filtro não Aplicado: </b>Exibindo todos os registros</i>.";
               $filtro = "";
            } else if( $tipoFiltro == "L" ) {
               $desc_filtro = "<b>Filtro Aplicado: </b>Nomes começando com <i>".$filtro."</i>.";
               $filtro = substr($filtro,0,1);
               if( !preg_match("/[A-Z]|[a-z]/", $filtro) ) { 
                  $filtro = "A";
               }
               
               $sSQL .= "   WHERE nome like '".$filtro . "%'";
            } else if( $tipoFiltro == "B" ) {
               $desc_filtro = "<b>Filtro Aplicado: </b>Busca por nome ou número. Pesquisando por: <i>".$filtro."</i>.";
               if( trim($filtro) == "" ) {
                  // Faz uma gambi pra o sistema não retornar registros.
                  $sSQL .= "   WHERE 1 = 2 ";
                  $nenhum = "Você não pode realizar uma busca sem enviar o texto que deseja procurar.";
               } else {
                  $sSQL .= "   WHERE nome LIKE \"%".$filtro."%\" ";
                  $sSQL .= "   OR numero=\"".$filtro."\" ";
               }
            }
            
            */


            $sSQL .= " ORDER BY ".
                     "   nome ";
            
            $lista_clientes = $bd->obtemRegistros( $sSQL );
            
            if(!count($lista_clientes)) {
               if( !$nenhum ) {
//                  if( $filtroTipo == "T" ) {
                     $nenhum = "Nenhum username cadastrado no sistema.";
//                  } else {
//                     $nenhum = "Nenhum registro satisfaz as condições do filtro.";
//                  }
               }
            }
            
            $bgcolor1 = "#FFFFFF";
            $bgcolor2 = "#CCCCCC";
            $bgcolor = $bgcolor1;
            
            $cor_ativo = "#008F00";
            $cor_bloqueado = "#FF0000";
            
            for($x=0;$x<count($lista_clientes);$x++) {
               $lista_clientes[$x]["bgcolor"] = $bgcolor;
               $lista_clientes[$x]["tp_entrada"] = $lista_clientes[$x]["tipo_banda_up"] == "P" ? "%" : $lista_clientes[$x]["tipo_banda_up"] . "bps";
               $lista_clientes[$x]["tp_saida"] = $lista_clientes[$x]["tipo_banda_down"] == "P" ? "%" : $lista_clientes[$x]["tipo_banda_down"] . "bps";
               
               $sSQL = "SELECT servico FROM bmtb_cliente_servicos WHERE username = '".AddSlashes(trim($lista_clientes[$x]["username"]))."' ";
               $svcl = $bd->obtemRegistros($sSQL);
               
               // Status
               $lista_clientes[$x]["status"] = $lista_clientes[$x]["status"] == "" ? "Ativo" : "Bloqueado";
               $lista_clientes[$x]["cor_status"] = $lista_clientes[$x]["status"] == "" ? $cor_ativo : $cor_bloqueado;
               
               $lsSvc = array();
               for($y=0;$y<count($svcl);$y++) {
                  $lsSvc[] = $svcl[$y]["servico"];
               }
               
               $lista_clientes[$x]["servicos"] = count($lsSvc) ? join(',', $lsSvc) : "nenhum controle especial aplicado";

               $bgcolor = $bgcolor == $bgcolor1 ? $bgcolor2 : $bgcolor1;
            }
            
            $tplVars .= ($tplVars ? ",":"") . "nenhum,desc_filtro,filtro";
            
            $tplLoops[] = "lista_clientes";
            
            $sArqTemplate = $sDirTemplate."/lista_clientes.tpl";
            
            
            
            // Persiste o filtro em sessao
            $sessTipoFiltro = $tipoFiltro;
            $sessFiltro = $filtro;
            
            session_register("sessTipoFiltro");
            session_register("sessFiltro");


            // Inteligência de apresentação
            if( $filtroTipo != "B" ) $filtro="";

            
         } else {
            $oper = "efetuaAlteracao";
            $submit = "Alterar Dados";
            if(!$us_orig) $us_orig = $username;
         }
      }

      /*******************************
       * Final da rotina de listagem
       *******************************/


   }
   if(!$bExibirListagem) {
      // Seleciona os IPs já atribuidos à usernames
      $sSQL = "SELECT ".
              "   ipaddr ".
              "FROM ".
              "   bmtb_cliente";
      $aResultado = $bd->obtemRegistros($sSQL);
      $ips = array();
      for($x=0;$x<count($aResultado);$x++) {
         $ips[] = "'".$aResultado[$x]["ipaddr"]."'";
      }
      
      $sSQL = "SELECT ".
              "   ipaddr as id, ipaddr as nome, banda_up, tipo_banda_up, banda_down, tipo_banda_down ".
              "FROM ".
              "   bmtb_ip ".
              "WHERE ".
              "   1 = 1 "; // <-- Gambiarra, hehehehe (facilita o trabalho)
   
              if( count($ips) ) { 
                 $sSQL .= "   AND ipaddr not in ( ". join( ",", $ips ) ." ) ";
              }
              
              if( $ipaddr ) {
                 $sSQL .= "   OR ipaddr = '".AddSlashes($ipaddr)."' ";
              }
              $sSQL .= " ORDER BY ipaddr ";
   
      $lsIPs = $bd->obtemRegistros( $sSQL );
      
      for( $i=0;$i<count($lsIPs);$i++ ) {
         $xBandaUp = $lsIPs[$i]["banda_up"];
         $xTipoBandaUp = str_replace( "P", "%", $lsIPs[$i]["tipo_banda_up"] );
         $xBandaDown = $lsIPs[$i]["banda_down"];
         $xTipoBandaDown = str_replace("P", "%", $lsIPs[$i]["tipo_banda_down"] );
         
         $lsIPs[$i]["nome"] .= " (U: " . $xBandaUp . $xTipoBandaUp . "|D: ". $xBandaDown . $xTipoBandaDown . ")";
      }
   
      $ip_select = count($lsIPs) ? criaListaSelect("ipaddr", $lsIPs, $ipaddr) : "Não existem IPs disponíveis";
   
      // Lista de serviços
      $sSQL = "SELECT ".
              "   servico,porta ".
              "FROM ".
              "   bmtb_servico ".
              "ORDER BY ".
              "   servico ";
   
      $lista_servicos = $bd->obtemRegistros($sSQL);
   
      $bgcolor1 = "#FFFFFF";
      $bgcolor2 = "#CCCCCC";
      $bgcolor = $bgcolor2;
      for($x=0;$x<count($lista_servicos);$x++) {

         $lista_servicos[$x]["be"] = $banda_up[ $lista_servicos[$x]["servico"] ];
         $lista_servicos[$x]["bs"] = $banda_down[ $lista_servicos[$x]["servico"] ];

      
         foreach($servicos as $svc) {
            if( trim($lista_servicos[$x]["servico"]) == trim($svc) ) {
               $lista_servicos[$x]["ck"] = " CHECKED ";
               break;
            }
         }
      
         $lista_servicos[$x]["bgcolor"] = $bgcolor;
         $lista_servicos[$x]["tp_entrada"] = $lista_servicos[$x]["tipo_banda_up"] == "P" ? "%" : $lista_servicos[$x]["tipo_banda_up"] . "bps";
         $lista_servicos[$x]["tp_saida"] = $lista_servicos[$x]["tipo_banda_down"] == "P" ? "%" : $lista_servicos[$x]["tipo_banda_down"] . "bps";

         $lista_servicos[$x]["tp_bu_select"] = criaListaSelect("tp_bu[".$lista_servicos[$x]["servico"]."]", $lsTipo, $tp_bu[$lista_servicos[$x]["servico"]],0);
         $lista_servicos[$x]["tp_bd_select"] = criaListaSelect("tp_bd[".$lista_servicos[$x]["servico"]."]", $lsTipo, $tp_bd[$lista_servicos[$x]["servico"]],0);


         
         $bgcolor = $bgcolor == $bgcolor1 ? $bgcolor2 : $bgcolor1;
      }
      
      if( !count($lista_servicos) ) {
         $nenhum = "Não existem serviços cadastrados";
      }
      
      $tplVars .= ($tplVars ? ",":"") . "nenhum,desc_filtro,filtro";
      
      $tplLoops[] = "lista_servicos";
   }
?>
