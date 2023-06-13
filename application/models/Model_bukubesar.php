<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_bukubesar extends CI_Model {

// Data Master START
		public function get_trans_kas($where){
			$query = "";
			$query = "SELECT p.tgl_pinjam as tgl_trans,ja.kd_aktifa as id,jp.nama_pinjaman as transaksi,0 as debet,p.jumlah_nominal as kredit
					FROM `tx_pinjaman` as p 
					LEFT JOIN tm_jenis_pinjaman as jp ON p.jenis_pinjaman_id = jp.id_jenis_pinjaman
					LEFT JOIN tm_jenis_akun as ja on jp.akun_id = ja.id_jenis_akun
					WHERE jenis_kas = 1 AND p.tgl_pinjam BETWEEN $where UNION
					SELECT s.tgl_simpan as tgl_trans,ja.kd_aktifa as id,js.jenis_simpanan as transaksi,s.jumlah_nominal as debet,0 as kredit
					FROM `tx_simpanan` as s
					LEFT JOIN tm_jenis_simpanan as js ON s.jenis_simpanan_id = js.id_jenis_simpanan
					LEFT JOIN tm_jenis_akun as ja on js.akun_id = ja.id_jenis_akun
					WHERE s.jenis_kas = 1 AND s.tgl_simpan BETWEEN $where
					ORDER BY tgl_trans ASC";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_trans_bank($where){
			$query = "SELECT p.tgl_pinjam as tgl_trans,ja.kd_aktifa as id,jp.nama_pinjaman as transaksi,0 as debet,p.jumlah_nominal as kredit
					FROM `tx_pinjaman` as p 
					LEFT JOIN tm_jenis_pinjaman as jp ON p.jenis_pinjaman_id = jp.id_jenis_pinjaman
					LEFT JOIN tm_jenis_akun as ja on jp.akun_id = ja.id_jenis_akun
					WHERE jenis_kas = 3 AND p.tgl_pinjam BETWEEN $where UNION
					SELECT s.tgl_simpan as tgl_trans,ja.kd_aktifa as id,js.jenis_simpanan as transaksi,s.jumlah_nominal as debet,0 as kredit
					FROM `tx_simpanan` as s
					LEFT JOIN tm_jenis_simpanan as js ON s.jenis_simpanan_id = js.id_jenis_simpanan
					LEFT JOIN tm_jenis_akun as ja on js.akun_id = ja.id_jenis_akun
					WHERE s.jenis_kas = 3 AND s.tgl_simpan BETWEEN $where
					ORDER BY tgl_trans ASC";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_nominal_kas($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal, 1 as jenis_id_kas
						FROM `tx_simpanan`
						WHERE is_delete = 0 AND jenis_kas = 1
						AND tgl_simpan BETWEEN $where";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_nominal_bank($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal, 3 as jenis_id_bank
						FROM `tx_simpanan`
						WHERE is_delete = 0 AND jenis_kas = 3
						AND tgl_simpan BETWEEN $where";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

	

		
// Data Master END

	
	}

		