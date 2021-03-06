<?

   /*
    * Arquivo de configura��o do MBM
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

   // Script para atualiza�ao
   $SCRIPT_ATUALIZA = $PATHS["bin"] . "/atualiza.sh";
   $ATUALIZA_SH = $SH . " " . $SCRIPT_ATUALIZA;
   
   /**
    * MRTG.conf
    * Essas informa��es somente s�o alteradas quando h� mudan�as na infraestrutura
    */
   
   // Arquivo a ser gerado
   $mrtgCONF["arquivo"] = $PATHS["etc"]."/mrtg.conf";
   
   // Diret�rio base para gerar os gr�ficos
   $mrtgCONF["saida"] = "/usr/local/mbm/web/pub/estatisticas";
   
   // Diret�rio web contendo as estat�sticas dos clientes
   $mrtgCONF["webbase"] = "estatisticas";
   
   // Script que coleta as estat�sticas
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
   
   // Local aonde est� instalado o link
   $mrtgCONF["local"] = "S�o Pedro, S�o Paulo, Brasil";
   
   
   
   // Defini��o do hor�rio comercial
   // Quando alterar esses valores n�o se esque�a de modificar a data/hora do inversor no cron
   $hCom["semana"]["ini"] = 8;
   $hCom["semana"]["fim"] = 20;
   $hCom["sabado"]["ini"] = 8;
   $hCom["sabado"]["fim"] = 13;
   
?>
