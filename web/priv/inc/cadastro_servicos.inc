<?
   /**
    * cadastro_servicos.inc
    * Administra��o dos servi�os
    * CopyRight(c) 2002 - Mosman Solu��es
    * Autor; Andrei de Oliveira Mosman
    * Email: mosman@mosman.com.br / andreimosman@hotmail.com
    */

   $oldTplVars = $tplVars;

   // Vari�veis do formul�rio
   $tplVars = "SELF,servico,porta,pt_orig,sv_orig,banda_down,tipo_banda_down,banda_up,tipo_banda_up";
   // Vari�veis de exibi��o
   $tplVars .= ",tp_bd_select,tp_bu_select,submit";
   // Identifica a opera��o que eu est� sendo executada (via hidden)
   $tplVars .= ",oper";


   $sArqTemplate = $sDirTemplate."/cadastro_servico.tpl";
   
   $registroEncontrado = 0;
   $bExibirListagem = 0;

   
   $nenhum = "";
   $desc_filtro = "";
   
   function existeServico($serv,$servOrig="") {
      global $bd;
 
      $query = "SELECT ".
              "   servico ".
              "FROM ".
              "   bmtb_servico ".
              "WHERE ".
              "   servico = '".AddSlashes($serv)."' ";
      if($servOrig) {
         $query .= "   AND servico != '".AddSlashes($servOrig) . "' ";
      }
      
      $resultado = $bd->obtemRegistros( $query );
      
      return( count($resultado) );
      
   }

   function existePorta($port,$portOrig="") {
      global $bd;
 
      $query = "SELECT ".
              "   porta ".
              "FROM ".
              "   bmtb_servico ".
              "WHERE ".
              "   porta = '".AddSlashes($port)."' ";
      if($servOrig) {
         $query .= "   AND porta != '".AddSlashes($portOrig) . "' ";
      }
      
      $resultado = $bd->obtemRegistros( $query );
      
      return( count($resultado) );
      
   }
   

   if( $sessao=="listaServicos" ) {
      $bExibirListagem = 1;
   }
   if( $sessao=="alteracaoServico" && !$oper ) {
      if( !$servico ) {
         // Exibir listagem das servicos
         $bExibirListagem = 1;
         
      } else {
         // Consultar a servico no banco de dados
         $sSQL = "SELECT ".
                 "   servico,porta ".
                 "FROM ".
                 "   bmtb_servico ".
                 "WHERE ".
                 "   servico = '".AddSlashes(trim($servico))."' ";
         $aResultado = $bd->obtemRegistros( $sSQL );
         
         $registroEncontrado = count($aResultado);
         
         for($x=0;$x<count($aResultado);$x++) {
            while (list ($variavel, $valor) = each ($aResultado[$x])) {
	        $$variavel = $valor;
            }
         }
         $sv_orig = $servico;
         $pt_orig = $porta;
      }
   }

   require_once($PATHS["lib"]."/functions_html.inc");

// ALTERADO EM 20.03.2006 - conforme abaixo..:;

//   $lsTipo = array();
//   $lsTipo[0]["id"] = "P";
//   $lsTipo[0]["nome"] = "%";
//   $lsTipo[1]["id"] = "";
//   $lsTipo[1]["nome"] = "bps";
//   $lsTipo[2]["id"] = "K";
//   $lsTipo[2]["nome"] = "Kbps";
//   $lsTipo[3]["id"] = "M";
//   $lsTipo[3]["nome"] = "Mbps";

   $lsTipo = array();
   $lsTipo[0]["id"] = "K";
   $lsTipo[0]["nome"] = "Kbps";
   $lsTipo[1]["id"] = "M";
   $lsTipo[1]["nome"] = "Mbps";
   
   $tp_bu_select = criaListaSelect("tipo_banda_up", $lsTipo, $tipo_banda_up,0);
   $tp_bd_select = criaListaSelect("tipo_banda_down", $lsTipo, $tipo_banda_down,0);


   if($oper == "efetuaCadastro") {
      /*******************************
       * Inicio da rotina de cadastro
       *******************************/

      // Tenta inserir no banco, caso contr�rio reporta o erro.
      
      $camposEsquecidos = array();
      
      // Verifica os campos obrigat�rios
      if( !$servico ) $camposEsquecidos[] = "servico";
      if( !(int)$porta ) $camposEsquecidos[] = "porta";
      //if( !$banda_up ) $camposEsquecidos[] = "Banda de Upload";
      //if( !$banda_down ) $camposEsquecidos[] = "Banda de Download";
      
      if(count($camposEsquecidos)) $sErro = "Voc� se esqueceu de preencher alguns campos (".join("/", $camposEsquecidos) . ").";
      
      if( existeServico(trim($servico)) > 0 ) $sErro = "Servico j� cadastrado... Escolha outra ou tente a op��o alterar";
      if( existePorta(trim($porta)) > 0 ) $sErro = "Porta j� cadastrada... Escolha outra ou tente a op��o alterar";
      
      if(!$sErro) {
         // Tenta inserir no banco de dados.
         $sSQL = "INSERT INTO ".
                 "   bmtb_servico (servico,porta) ".
                 "VALUES (".
                    "'".AddSlashes(trim($servico))."', " .
                    "'".AddSlashes(trim($porta))."' " .
                 ")";
         $bd->consulta($sSQL,false);
         
         $sMensagem = "Cadastro do servico '$servico' efetuado com sucesso";
         
         $servico = "";
         $porta = "";
         $banda_down = "";
         $tipo_banda_down = "";
         $banda_up = "";
         $tipo_banda_up = "";
         // $ = "";
         
         $tp_bu_select = criaListaSelect("tipo_banda_up", $lsTipo, $tipo_banda_up,0);
	 $tp_bd_select = criaListaSelect("tipo_banda_down", $lsTipo, $tipo_banda_down,0);

      } else {
         
      }

      /*******************************
       * Final da rotina de cadastro
       *******************************/
       
   } else if($oper == "efetuaAlteracao") {

      /*******************************
       * Inicio da rotina de altera��o
       *******************************/
       
      $camposEsquecidos = array();
      
      // Verifica os campos obrigat�rios
      if( !$servico ) $camposEsquecidos[] = "servico";
      if( !(int)$porta ) $camposEsquecidos[] = "porta";
      // if( !$banda_up ) $camposEsquecidos[] = "Banda de Upload";
      // if( !$banda_down ) $camposEsquecidos[] = "Banda de Download";
      
      
      if(count($camposEsquecidos)) $sErro = "Voc� deixou alguns campos essenciais em branco (".join("/", $camposEsquecidos) . ").";
      
      if( $servico != $sv_orig ) {
         if( existeServico(trim($servico),$sv_orig) > 0 ) $sErro = "Voc� est� tentando alterar o nome do servico contudo ja existe outro servico cadastrado com esse nome... Escolha outro !";
      }

      if( $porta != $pt_orig ) {
         if( existePorta(trim($porta),$pt_orig) > 0 ) $sErro = "Voc� est� tentando alterar a porta deste servico contudo ja existe outro servico cadastrado que utiliza essa porta... Escolha outro !";
      }
      
      if(!$sErro) {
         if( $servico == $sv_orig ) {

            $sSQL = "UPDATE bmtb_servico SET " .
                    "   porta = '".AddSlashes(trim($porta))."' ".
                    "WHERE servico = '".$sv_orig."'";
         
            $bd->consulta($sSQL,false);
         } else {
            // Para n�o ter problemas com a integridade referencial
            
            // Cria um registro novo para o servi�o, apenas com o nome do servico
            $sSQL = "INSERT INTO ".
                    "   bmtb_servico (servico,porta) ".
                    "VALUES (".
                       "'".AddSlashes(trim($servico))."', " .
                       " 0 " .
                    ")";
            $bd->consulta($sSQL,false);
            
            // Atualiza na tabela bmtb_cliente_servico
            $sSQL = "UPDATE bmtb_cliente_servico SET " .
                    "   servico = '".AddSlashes(trim($servico))."' ".
                    "WHERE servico = '".$sv_orig."'";
         
            $bd->consulta($sSQL,false);
            
            // Exclui o registro antigo
            $sSQL = "DELETE FROM bmtb_servico WHERE servico = '".$sv_orig."'";
            $bd->consulta($sSQL,true);

            // Coloca a porta
            $sSQL = "UPDATE bmtb_servico SET " .
                    "   porta = '".AddSlashes(trim($porta))."' ".
                    "WHERE servico = '".$servico."'";
         
            $bd->consulta($sSQL,false);
         }
         
         $sv_orig = $servico;
         $pt_orig = $porta;
         
         $sMensagem = "Altera��o dos dados do servico '$servico' efetuada com sucesso";
         
         
      } else {
         
      }

      /*******************************
       * Final da rotina de altera��o
       *******************************/

   } else {

      if( $sessao=="cadastroServico" || !$registroEncontrado && !$bExibirListagem) {
         $oper = "efetuaCadastro";
         $submit = "Cadastrar Servico";
         $sv_orig = "";
         $pt_orig = "";
      } else {

      /*******************************
       * In�cio da rotina de listagem
       *******************************/

         if( $bExibirListagem ) {

            $tplVars = $oldTplVars;
         
            // Exibir a listagem dos usu�rios
            
            $sSQL = "SELECT ".
                    "   servico,porta ".
                    "FROM ".
                    "   bmtb_servico ";
                    
            $sSQL .= " ORDER BY ".
                     "   servico ";

            $lista_servicos = $bd->obtemRegistros( $sSQL );
            
            if(!count($lista_servicos)) {
               if( !$nenhum ) {
                  $nenhum = "Nenhum servico cadastrado no sistema.";
               }
            }
            
            $bgcolor1 = "#FFFFFF";
            $bgcolor2 = "#CCCCCC";
            $bgcolor = $bgcolor2;
            for($x=0;$x<count($lista_servicos);$x++) {
               $lista_servicos[$x]["bgcolor"] = $bgcolor;
               $bgcolor = $bgcolor == $bgcolor1 ? $bgcolor2 : $bgcolor1;
            }
            
            $tplVars .= ($tplVars ? ",":"") . "nenhum,desc_filtro,filtro";
            
            $tplLoops[] = "lista_servicos";
            
            $sArqTemplate = $sDirTemplate."/lista_servicos.tpl";
            
            
            
         } else {
            $oper = "efetuaAlteracao";
            $submit = "Alterar Dados";
            if(!$sv_orig) $sv_orig = $servico;
         }
      }

      /*******************************
       * Final da rotina de listagem
       *******************************/


   }
   
?>
