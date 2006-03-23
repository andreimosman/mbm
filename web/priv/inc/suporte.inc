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


   $sArqTemplate = $sDirTemplate."/suporte.tpl";
   
   $registroEncontrado = 0;
   $bExibirListagem = 0;

   
   $nenhum = "";
   $desc_filtro = "";
   
   
   if( $subsessao ){
      $headerAlternativo = "vazio.tpl";
      $footerAlternativo = "vazio.tpl";
   }
   
   
      /*******************************
       * Início da rotina de listagem
       *******************************/

         if( $subsessao == "semcon" ) {
            
            $tplVars = $oldTplVars;
         
            // Exibir a listagem dos usuários
            
            $numdias = (int)$numdias;
            
            if(!$numdias) $numdias = 4;
            
            $sSQL  = "SELECT ";
            $sSQL .= "   c.username, c.ipaddr, ci.nome_razao, ci.tp_pessoa, ci.resp_tecnico, ci.fone  ";
            $sSQL .= "FROM ";
            $sSQL .= "   bmtb_cliente c LEFT OUTER JOIN ";
            $sSQL .= "   (SELECT DISTINCT  ";
            $sSQL .= "      username  ";
            $sSQL .= "   FROM  ";
            $sSQL .= "      bmtb_log_acesso  ";
            $sSQL .= "   WHERE  ";
            $sSQL .= "      login > now() - interval '$numdias days' OR logout > now() - interval '$numdias days' OR logout is null ";
            $sSQL .= "   ) ac USING( username ), ";
            $sSQL .= "   bmtb_rede r, ";
            $sSQL .= "   bmtb_cliente_info ci ";
            $sSQL .= "WHERE ";
            $sSQL .= "   c.ipaddr << r.rede ";
            $sSQL .= "   AND c.status = 'A' ";
            $sSQL .= "   AND r.tipo = 'P' ";
            $sSQL .= "   AND ac.username is null ";
            $sSQL .= "   AND ci.username = c.username ";
            $sSQL .= "ORDER BY ";
            $sSQL .= "   c.ipaddr ";

            $lista_semcon = $bd->obtemRegistros( $sSQL );
            
            if(!count($lista_semcon)) {
               if( !$nenhum ) {
                  $nenhum = "Nenhum cliente ativo está sem conexão a mais de $numdias dias..";
               }
            }
            
            $bgcolor1 = "#FFFFFF";
            $bgcolor2 = "#CCCCCC";
            $bgcolor = $bgcolor2;
            for($x=0;$x<count($lista_semcon);$x++) {
               $lista_semcon[$x]["bgcolor"] = $bgcolor;
               $bgcolor = $bgcolor == $bgcolor1 ? $bgcolor2 : $bgcolor1;
            }
            
            $tplVars .= ($tplVars ? ",":"") . "nenhum,desc_filtro,filtro,numdias";
            
            $tplLoops[] = "lista_semcon";
            
            $sArqTemplate = $sDirTemplate."/semcon.tpl";
            
         }


         if( $subsessao == "online" ) {
            
            $tplVars = $oldTplVars;
         
            // Exibir a listagem dos usuários
            
            $sSQL  = "SELECT ";
            $sSQL .= "   username, to_char(login,'DD/MM/YYYY-HH24:MI:SS') as login, ";
            $sSQL .= "   ip as ipaddr, nas ";
            $sSQL .= "FROM ";
            $sSQL .= "   bmtb_log_acesso ";
            $sSQL .= "WHERE ";
            $sSQL .= "   logout is null ";
            $sSQL .= "ORDER BY ";
            $sSQL .= "   nas,ipaddr ";
            

            $lista_online = $bd->obtemRegistros( $sSQL );
            
            if(!count($lista_online)) {
               if( !$nenhum ) {
                  $nenhum = "Nenhum cliente ativo está sem conexão a mais de $numdias dias..";
               }
            }
            
            $bgcolor1 = "#FFFFFF";
            $bgcolor2 = "#CCCCCC";
            $bgcolor = $bgcolor2;
            for($x=0;$x<count($lista_online);$x++) {
               $lista_online[$x]["bgcolor"] = $bgcolor;
               $bgcolor = $bgcolor == $bgcolor1 ? $bgcolor2 : $bgcolor1;
            }
            
            $tplVars .= ($tplVars ? ",":"") . "nenhum,desc_filtro,filtro,numdias";
            
            $tplLoops[] = "lista_online";
            
            $sArqTemplate = $sDirTemplate."/online.tpl";
            
         }


      /*******************************
       * Final da rotina de listagem
       *******************************/
   
?>
