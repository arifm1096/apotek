<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_laba_rugi extends CI_Model {

// Data Master START
		public function get_akun_pendapatan(){
			$query = "SELECT * FROM `tm_jenis_akun` 
						WHERE is_delete = 0 AND id_jenis_akun BETWEEN 14 AND 17
						order by id_jenis_akun asc";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_data_pendapatan($where){
			$query = "SELECT SUM(a.bunga) as nominal, 14 as id 
					FROM tx_angsuran as a 
					LEFT JOIN tx_pinjaman as p on a.id_pinjaman = p.id_pinjaman
					WHERE p.jenis_pinjaman_id = 1 AND a.is_delete = 0 AND tgl_bayar BETWEEN $where UNION
					SELECT SUM(a.bunga) as nominal, 15 as id 
					FROM tx_angsuran as a 
					LEFT JOIN tx_pinjaman as p on a.id_pinjaman = p.id_pinjaman
					WHERE (p.jenis_pinjaman_id = 3 OR p.jenis_pinjaman_id = 2) AND a.is_delete = 0 AND tgl_bayar BETWEEN $where UNION
					SELECT SUM(a.bunga) as nominal, 16 as id 
					FROM tx_angsuran as a 
					LEFT JOIN tx_pinjaman as p on a.id_pinjaman = p.id_pinjaman
					WHERE p.jenis_pinjaman_id = 4 AND a.is_delete = 0 AND tgl_bayar BETWEEN $where UNION
					SELECT SUM(biaya_adm) as nominal, 17 as id FROM tx_pinjaman WHERE is_delete = 0 AND tgl_pinjam BETWEEN $where";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_akun_biaya_ops(){
			$query = "SELECT * FROM `tm_jenis_akun` 
						WHERE is_delete = 0 AND id_jenis_akun = 19
						order by id_jenis_akun asc";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_data_biaya_ops($where){
			$query = "SELECT SUM(si.bunga_simpanan) as nominal, 19 as id
				FROM (
				SELECT  MIN(s.tgl_simpan) as tgl_simpan,
				js.bunga,
				SUM(jumlah_nominal) as tot_simpanan_pokok,
				(CASE WHEN TIMESTAMPDIFF(MONTH, MIN(s.tgl_simpan), NOW()) > 0 THEN
						TIMESTAMPDIFF(MONTH, MIN(s.tgl_simpan), NOW()) - 1
					ELSE
						TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW())
				END) as bulan_bunga,
				FLOOR(SUM(s.jumlah_nominal) * js.bunga / 100) * 
				(CASE WHEN TIMESTAMPDIFF(MONTH, MIN(s.tgl_simpan), NOW()) > 0 THEN
						TIMESTAMPDIFF(MONTH, MIN(s.tgl_simpan), NOW()) - 1
					ELSE
						TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW())
				END) as bunga_simpanan,
				FLOOR(SUM(s.jumlah_nominal) * js.bunga / 100) * 
				(CASE WHEN TIMESTAMPDIFF(MONTH, MIN(s.tgl_simpan), NOW()) > 0 THEN
						TIMESTAMPDIFF(MONTH, MIN(s.tgl_simpan), NOW()) - 1
					ELSE
						TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW())
				END) + SUM(jumlah_nominal) as simpanan_plus_bunga
				FROM `tx_simpanan` as s  
				LEFT JOIN tm_jenis_simpanan as js ON s.jenis_simpanan_id = js.id_jenis_simpanan
				LEFT JOIN tm_anggota as a ON s.anggota_id = a.id_anggota
				WHERE s.simpan_trans = 1 AND s.is_delete = 0 AND tgl_simpan BETWEEN $where
				GROUP BY s.jenis_simpanan_id,s.anggota_id
				ORDER BY s.tgl_simpan ASC ) as si";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_akun_non_ops(){
			$query = "SELECT * FROM `tm_jenis_akun` 
						WHERE is_delete = 0 AND id_jenis_akun = 21
						order by id_jenis_akun asc";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_data_non_ops($where){
			$query = "SELECT jumlah as nominal, jenis_akun as id
					  FROM `tx_kas` 
					  WHERE is_delete = 0 AND jenis_trans = 1 
					  AND jenis_akun = 21 AND tanggal_trans BETWEEN $where";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_akun_by_non_ops(){
			$query = "SELECT * FROM `tm_jenis_akun` 
						WHERE is_delete = 0 AND id_jenis_akun = 24 or id_jenis_akun = 23
						order by id_jenis_akun asc";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_data_by_non_ops($where){
			$query = "SELECT jumlah as nominal, jenis_akun as id 
					  FROM `tx_kas` WHERE is_delete = 0 AND jenis_trans = 2 
					  AND (jenis_akun = 23 OR jenis_akun = 24) AND tanggal_trans BETWEEN $where";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

	}

		