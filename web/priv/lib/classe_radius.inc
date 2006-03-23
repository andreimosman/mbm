<?
	/**
	 * Classe para calcular IPs
	 * Autor: Andrei de Oliveira Mosman
	 * mosman@mosman.com.br / andreimosman@hotmail.com
	 */

	class Radius {
		var $bd; // Handler da conexao com o BD

		/**
		 * Constructor
		 */

		function Radius($bd) {
		   $this->bd = $bd;
		}
		
		/**
		 * deleteUser()
		 * Apaga o  determinado usuario do radius
		 */
		function deleteUser($usr) {
		   $usr = trim(strtolower($usr));
		   $sSQL = "DELETE FROM rdtb_radcheck WHERE username='$usr'";
		   $this->bd->consulta($sSQL,false);
		   $sSQL = "DELETE FROM rdtb_radreply WHERE username='$usr'";
		   $this->bd->consulta($sSQL,false);
		   $sSQL = "DELETE FROM rdtb_usergroup WHERE username='$usr'";
		   $this->bd->consulta($sSQL,false);

		}

		/**
		 * changeUser()
		 * Cadastra/Altera as informacoes de um usuario
		 */
		function changeUser($olduser,$newuser,$newip,$newpassword="") {
		   $olduser = trim(strtolower($olduser));
		   $newuser = trim(strtolower($newuser));
		   
		   // Verifica se o usuario existe na tabela do radius
		   //$sSQL = "SELECT username FROM rdtb_usergroup WHERE username='$olduser'";
		   //$regs = $this->bd->obtemRegistros($sSQL);
		   //if(!count($regs)) $olduser = "";
		   
	           // Apaga as informacoes existentes do usuario
	           $this->deleteUser($olduser);

   	           // Atualiza o accounting
	           $sSQL = "UPDATE rdtb_radacct SET username = '$newuser' WHERE username = '$olduser'";
	           $this->bd->consulta($sSQL,false);
		   
		   // Insere os novos dados no BD
		      
		   if( $newpassword ) {
		      // SENHA
		      $sSQL =  "INSERT INTO ";
		      $sSQL .= "   rdtb_radcheck(username,attribute,op,value) ";
		      $sSQL .= "VALUES( ";
		      $sSQL .= "   '$newuser', 'Password', ':=', '$newpassword' ";
		      $sSQL .= ")";
		      $this->bd->consulta($sSQL,false);
		   }
		      
		   if( $newip ) {
		      // IP
		      $sSQL =  "INSERT INTO ";
		      $sSQL .= "   rdtb_radreply(username,attribute,op,value) ";
		      $sSQL .= "VALUES( ";
		      $sSQL .= "   '$newuser', 'Framed-IP-Address', ':=', '$newip' ";
		      $sSQL .= ")";
		      $this->bd->consulta($sSQL,false);
		   }

		   // GRUPO
		   $sSQL =  "INSERT INTO ";
		   $sSQL .= "   rdtb_usergroup(username,groupname) ";
		   $sSQL .= "VALUES( ";
		   $sSQL .= "   '$newuser', 'mbm' ";
		   $sSQL .= ")";
		   $this->bd->consulta($sSQL,false);

		}
	}

?>