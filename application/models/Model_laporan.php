<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_laporan extends CI_Model {

// Data Master START
		public function get_modal(){
			$query = "SELECT * FROM `tm_jenis_akun` 
						WHERE is_delete = 0 AND id_jenis_akun BETWEEN 14 AND 17
						order by id_jenis_akun asc";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}

		}

	}

		