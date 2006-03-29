<?

   /*
    * Arquivo de configuração do MBM
    */    
   
   // MBM
   $MBM["versao"] = "2.0";
   
   // PostgreSQL
   $sSQLUser = "mbm";
   $sSQLPass = "mbm1979";
   $sSQLHost = "localhost";
   $sSQLBase = "mbm";
   
   // Programas
   $SUDO = "/usr/bin/sudo";
   $SH   = "/bin/sh";

   // Script para atualizaçao
   $SCRIPT_ATUALIZA = $PATHS["bin"] . "/atualiza.sh";
   $ATUALIZA_SH = $SH . " " . $SCRIPT_ATUALIZA;
   
   /**
    * MRTG.conf
    * Essas informações somente são alteradas quando há mudanças na infraestrutura
    */
   
   // Arquivo a ser gerado
   $mrtgCONF["arquivo"] = $PATHS["etc"]."/mrtg.conf";
   
   // Diretório base para gerar os gráficos
   $mrtgCONF["saida"] = "/usr/local/mbm/web/pub/estatisticas";
   
   // Diretório web contendo as estatísticas dos clientes
   $mrtgCONF["webbase"] = "estatisticas";
   
   // Script que coleta as estatísticas
   $mrtgCONF["script"] = "/usr/local/mbm/bin/pfstatlabel";
   
   // Intervalo (em minutos)
   $mrtgCONF["intervalo"] = 5;
   
   // Refresh (em segundos)
   $mrtgCONF["refresh"] = 300;
   
   // Lingua
   $mrtgCONF["lingua"] = "brazilian";
   
   // Icones
   $mrtgCONF["icon_dir"] = "/icons";

   // MaxBytes (em K)
   $mrtgCONF["maxbytes"] = 2048;
   
   // Local aonde está instalado o link
   $mrtgCONF["local"] = "São Pedro, São Paulo, Brasil";
   
   
   
   // Definição do horário comercial
   // Quando alterar esses valores não se esqueça de modificar a data/hora do inversor no cron
   $hCom["semana"]["ini"] = 8;
   $hCom["semana"]["fim"] = 20;
   $hCom["sabado"]["ini"] = 8;
   $hCom["sabado"]["fim"] = 13;
   
?>
