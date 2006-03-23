<html>
<head>
   <meta http-equiv=pragma content=no-cache>
   <title>Controle de banda - Gráficos dos clientes</title>
</head>
<body bgcolor="#FFFFFF">
<?

if ($dir = @opendir( getcwd() )) {
  while (($arq = readdir($dir)) !== false) {
    if( is_dir( $arq ) && file_exists( $arq . "/".$arq . "-day.png" ) ) {
       $url = $arq."/".$arq.".html";
       echo "<b><a href='$url'>".$arq . "</a></b><br>\n";
       echo "<img src='".$arq . "/".$arq . "-day.png"."'><hr size=1>\n\n";
    }
  }  
  closedir($dir);
}
?>
</body>
</html>