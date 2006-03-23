<?
   /**
    * cadastro_interfaces.inc
    * Administração das interfaces
    * CopyRight(c) 2002 - Mosman Soluções
    * Autor; Andrei de Oliveira Mosman
    * Email: mosman@mosman.com.br / andreimosman@hotmail.com
    */

   $oldTplVars = $tplVars;

   // Variáveis do formulário
   $tplVars = "SELF,interface,if_orig,banda,tipo_banda";
   // Variáveis de exibição
   $tplVars .= ",tp_banda_select,tp_if_select,submit";
   // Identifica a operação que eu está sendo executada (via hidden)
   $tplVars .= ",oper";


   $sArqTemplate = $sDirTemplate."/cadastro_interface.tpl";
   
   $registroEncontrado = 0;
   $bExibirListagem = 0;

   
   $nenhum = "";
   $desc_filtro = "";
   
   function existeInterface($interf,$interfOrig="") {
      global $bd;
 
      $query = "SELECT ".
              "   interface ".
              "FROM ".
              "   bmtb_interface ".
              "WHERE ".
              "   interface = '".AddSlashes($interf)."' ";
      if($interfOrig) {
         $query .= "   AND interface != '".AddSlashes($interfOrig) . "' ";
      }
      
      $resultado = $bd->obtemRegistros( $query );
      
      return( count($resultado) );
      
   }
   

   if( $sessao=="listaInterfaces" ) {
      $bExibirListagem = 1;
   }
   if( $sessao=="alteracaoInterface" && !$oper ) {
      if( !$interface ) {
         // Exibir listagem das interfaces
         $bExibirListagem = 1;
         
      } else {
         // Consultar a interface no banco de dados
         $sSQL = "SELECT ".
                 "   interface,tipo_interface,banda,tipo_banda ".
                 "FROM ".
                 "   bmtb_interface ".
                 "WHERE ".
                 "   interface = '".AddSlashes(trim($interface))."' ";
         $aResultado = $bd->obtemRegistros( $sSQL );
         
         $registroEncontrado = count($aResultado);
         
         for($x=0;$x<count($aResultado);$x++) {
            while (list ($variavel, $valor) = each ($aResultado[$x])) {
	        $$variavel = $valor;
            }
         }
         $if_orig = $interface;
      }
   }

   require_once($PATHS["lib"]."/functions_html.inc");
   
   $lsTpIf = array();
   $lsTpIf[0]["id"] = "E";
   $lsTpIf[0]["nome"] = "Externa";
   $lsTpIf[1]["id"] = "I";
   $lsTpIf[1]["nome"] = "Interna";
   $tp_if_select = criaListaSelect("tipo_interface", $lsTpIf, $tipo_interface,0);
   
   $lsTipo = array();
   $lsTipo[0]["id"] = "K";
   $lsTipo[0]["nome"] = "Kbps";
   $lsTipo[1]["id"] = "M";
   $lsTipo[1]["nome"] = "Mbps";

//   $lsTipo = array();
//   $lsTipo[0]["id"] = "";
//   $lsTipo[0]["nome"] = "bps";
//   $lsTipo[1]["id"] = "K";
//   $lsTipo[1]["nome"] = "Kbps";
//   $lsTipo[2]["id"] = "M";
//   $lsTipo[2]["nome"] = "Mbps";
   
   $tp_banda_select = criaListaSelect("tipo_banda", $lsTipo, $tipo_banda,0);

   if($oper == "efetuaCadastro") {
      /*******************************
       * Inicio da rotina de cadastro
       *******************************/

      // Tenta inserir no banco, caso contrário reporta o erro.
      
      $camposEsquecidos = array();
      
      // Verifica os campos obrigatórios
      if( !$interface ) $camposEsquecidos[] = "interface";
      if( !$tipo_interface ) $camposEsquecidos[] = "Tipo da Interface";
      if( !$banda ) $camposEsquecidos[] = "Banda";
      
      if(count($camposEsquecidos)) $sErro = "Você se esqueceu de preencher alguns campos (".join("/", $camposEsquecidos) . ").";
      
      if( existeInterface(trim($interface)) > 0 ) $sErro = "Interface já cadastrada... Escolha outra ou tente a opção alterar";
      
      if(!$sErro) {
         // Tenta inserir no banco de dados.
         $sSQL = "INSERT INTO ".
                 "   bmtb_interface (interface,tipo_interface,banda,tipo_banda) ".
                 "VALUES (".
                    "'".AddSlashes(trim($interface))."', " .
                    "'".AddSlashes(trim($tipo_interface))."', " .
                    "'".AddSlashes(trim($banda))."', " .
                    "'".AddSlashes(trim($tipo_banda))."' " .
                 ")";
         $bd->consulta($sSQL,false);
         
         $sMensagem = "Cadastro da interface '$interface' efetuado com sucesso";
         
         $interface = "0";
         $tipo_interface = "0";
         $banda = "0";
         $tipo_banda = "0";
         // $ = "";
         
         $tp_banda_select = criaListaSelect("tipo_banda", $lsTipo, $tipo_banda,0);
         $tp_if_select = criaListaSelect("tipo_interface", $lsTpIf, $tipo_interface,0);

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
      if( !$interface ) $camposEsquecidos[] = "interface";
      if( !$tipo_interface ) $camposEsquecidos[] = "Tipo da Interface";
      if( !$banda ) $camposEsquecidos[] = "Banda";
      
      if(count($camposEsquecidos)) $sErro = "Você deixou alguns campos essenciais em branco (".join("/", $camposEsquecidos) . ").";
      
      if( $interface != $if_orig ) {
         if( existeInterface(trim($interface),$if_orig) > 0 ) $sErro = "Você está tentando alterar a identificação da interface contudo ja existe outra interface cadastrada com essa identificação... Escolha outra !";
      }
      

      if(!$sErro) {
      
         if( $interface == $if_orig ) {

            $sSQL = "UPDATE bmtb_interface SET " .
                    "   tipo_interface = '".AddSlashes(trim($tipo_interface))."', ".
                    "   banda = '".AddSlashes(trim($banda))."', ".
                    "   tipo_banda = '".AddSlashes(trim($tipo_banda))."' ".
                    "WHERE interface = '".$if_orig."'";
         
            $bd->consulta($sSQL,false);
         } else {
            // Se o cara alterar o nome da interface é necessário contornar a integridade referencial
            // para conseguir atualizar na tabela bmtb_ip também:

            // Insere um novo registro
            $sSQL = "INSERT INTO ".
                    "   bmtb_interface (interface,tipo_interface,banda,tipo_banda) ".
                    "VALUES (".
                       "'".AddSlashes(trim($interface))."', " .
                       "'".AddSlashes(trim($tipo_interface))."', " .
                       "'".AddSlashes(trim($banda))."', " .
                       "'".AddSlashes(trim($tipo_banda))."' " .
                    ")";
            $bd->consulta($sSQL,false);       
         
            // Altera na tabela de IPs
            // TODO: Encontrar uma forma inteligente para contornar o problema q pode acontecer quando o 
            // cara alterar o tipo da interface e esta estiver em uso. Bloquear tal alteração ??
            // funcao podeAlterarTipoInterface($if) ???
            
            // Interface de saída
            $sSQL = "UPDATE bmtb_ip SET " .
                    "   interface_interna = '".AddSlashes(trim($interface))."' ".
                    "WHERE interface_interna = '".$if_orig."'";
            
            $bd->consulta($sSQL,false);
            // Interface externa
            $sSQL = "UPDATE bmtb_ip SET " .
                    "   interface_externa = '".AddSlashes(trim($interface))."' ".
                    "WHERE interface_externa = '".$if_orig."'";

            $bd->consulta($sSQL,false);
            
            // Apaga o registro antigo
            $sSQL = "DELETE FROM bmtb_interface WHERE interface = '".AddSlashes(trim($if_orig))."' ";
            $bd->consulta($sSQL,false);
         }
         
         $if_orig = $interface;

         $sMensagem = "Alteração dos dados da interface '$interface' efetuada com sucesso";
         
         
      } else {
         
      }

      /*******************************
       * Final da rotina de alteração
       *******************************/

   } else {

      if( $sessao=="cadastroInterface" || !$registroEncontrado && !$bExibirListagem) {
         $oper = "efetuaCadastro";
         $submit = "Cadastrar Interface";
         $if_orig = "";
      } else {

      /*******************************
       * Início da rotina de listagem
       *******************************/

         if( $bExibirListagem ) {
            
            $tplVars = $oldTplVars;
         
            // Exibir a listagem dos usuários
            
            $sSQL = "SELECT ".
                    "   interface,tipo_interface,banda,tipo_banda ".
                    "FROM ".
                    "   bmtb_interface ";
                    

            $sSQL .= " ORDER BY ".
                     "   interface ";

            $lista_interfaces = $bd->obtemRegistros( $sSQL );
            
            if(!count($lista_interfaces)) {
               if( !$nenhum ) {
                  $nenhum = "Nenhuma interface cadastrada no sistema.";
               }
            }
            
            $bgcolor1 = "#FFFFFF";
            $bgcolor2 = "#CCCCCC";
            $bgcolor = $bgcolor2;
            for($x=0;$x<count($lista_interfaces);$x++) {
               $lista_interfaces[$x]["bgcolor"] = $bgcolor;
               $lista_interfaces[$x]["tp_banda"] = $lista_interfaces[$x]["tipo_banda"] == "P" ? "%" : $lista_interfaces[$x]["tipo_banda"] . "bps";
               $lista_interfaces[$x]["tp_interface"] = $lista_interfaces[$x]["tipo_interface"] == "E" ? "Externa" : "Interna";
               
               $bgcolor = $bgcolor == $bgcolor1 ? $bgcolor2 : $bgcolor1;
            }
            
            $tplVars .= ($tplVars ? ",":"") . "nenhum,desc_filtro,filtro";
            
            $tplLoops[] = "lista_interfaces";
            
            $sArqTemplate = $sDirTemplate."/lista_interfaces.tpl";
            
         } else {
            $oper = "efetuaAlteracao";
            $submit = "Alterar Dados";
            if(!$if_orig) $if_orig = $interface;
         }
      }

      /*******************************
       * Final da rotina de listagem
       *******************************/


   }
   
?>
