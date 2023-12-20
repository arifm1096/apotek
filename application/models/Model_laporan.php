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

		public function get_lap_modal(){
			$query = "SELECT 
			sum(p.harga_beli * ps.jumlah_stok) as total_modal,
			sum(ps.jumlah_stok) as total_produk
			FROM `tx_produk_stok` as ps
			LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
			WHERE ps.is_delete = 0 AND p.is_delete = 0";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lap_margin_kasir($tgl_awal,$tgl_akhir){
			$query = "SELECT 
			sum(tx.tot_produk_jual) as tot_produk_terjual,
			sum(tx.harga_beli) as tot_harga_beli,
			sum(tx.tot_harga_beli) as sub_tot_harga_beli,
			sum(tx.harga_jual) as tot_harga_jual,
			sum(tx.tot_harga_jual) as sub_tot_harga_jual,
			sum(tx.margin) as tot_margin 
			FROM
			(SELECT p.id_produk,p.sku_kode_produk,p.nama_produk,
			sum(j.jumlah_produk) as tot_produk_jual, 
			j.harga_beli,
			sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
			j.harga_jual, 
			sum(j.total_harga) as tot_harga_jual,
			sum(j.total_harga) - (sum(j.jumlah_produk) * j.harga_beli) as margin
			FROM `tx_jual` as j
			LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
			WHERE j.is_delete = 0 AND j.is_selesai = 1  AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'
			GROUP BY j.id_produk) as tx";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lap_margin_resep($tgl_awal,$tgl_akhir){
			$query = "SELECT 
			sum(tx.tot_produk_jual) as tot_produk_terjual,
			sum(tx.harga_beli) as tot_harga_beli,
			sum(tx.tot_harga_beli) as sub_tot_harga_beli,
			sum(tx.harga_jual) as tot_harga_jual,
			sum(tx.tot_harga_jual) as sub_tot_harga_jual,
			sum(tx.margin) as tot_margin 
			FROM
			(SELECT p.id_produk,p.sku_kode_produk,p.nama_produk,
			sum(j.jumlah_produk) as tot_produk_jual, 
			j.harga_beli,
			sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
			j.harga_jual, 
			sum(j.total_harga) as tot_harga_jual,
			sum(j.total_harga) - (sum(j.jumlah_produk) * j.harga_beli) as margin
			FROM `tx_resep_detail` as j
			LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
			WHERE j.is_delete = 0 AND j.is_selesai = 1 AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'
			AND j.status = 1 or j.status = 3
			GROUP BY j.id_produk) as tx";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lap_pen_dok($tgl_awal,$tgl_akhir){
			$query = "SELECT 
			sum(j.jumlah_produk) as tot_produk_jual, 
			j.harga_beli,
			sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
			j.harga_jual, 
			sum(j.total_harga) as tot_harga_jual,
			sum(j.total_harga) - sum(j.harga_beli) as margin
			FROM `tx_resep_detail` as j
			LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
			WHERE j.is_delete = 0 AND j.is_selesai = 1 AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lap_pen_kas($tgl_awal,$tgl_akhir){
			$query = "SELECT 
			sum(j.jumlah_produk) as tot_produk_jual, 
			j.harga_beli,
			sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
			j.harga_jual, 
			sum(j.total_harga) as tot_harga_jual,
			sum(j.total_harga) - sum(j.harga_beli) as margin
			FROM `tx_jual` as j
			LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
			WHERE j.is_delete = 0 AND j.is_selesai = 1  AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lap_pem_dok($tgl_awal,$tgl_akhir){
			$query = "SELECT SUM(tx.tot_harga_beli) AS tot_harga_beli
			FROM (SELECT p.id_produk,p.sku_kode_produk,p.nama_produk,
			sum(j.jumlah_produk) as tot_produk_jual, 
			j.harga_beli,
			sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
			j.harga_jual, 
			sum(j.total_harga) as tot_harga_jual,
			sum(j.total_harga) - sum(j.harga_beli) as margin
			FROM `tx_resep_detail` as j
			LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
			WHERE j.is_delete = 0 AND j.is_selesai = 1  AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'
			GROUP BY j.id_produk) as tx";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lap_pem_kas($tgl_awal,$tgl_akhir){
			$query = "SELECT SUM(tx.tot_harga_beli) AS tot_harga_beli
			FROM (SELECT j.id_jual,p.id_produk,p.sku_kode_produk,p.nama_produk,
			sum(j.jumlah_produk) as tot_produk_jual, 
			j.harga_beli,
			sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
			j.harga_jual, 
			sum(j.total_harga) as tot_harga_jual,
			sum(j.total_harga) - sum(j.harga_beli) as margin
			FROM `tx_jual` as j
			LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
			WHERE j.is_delete = 0 AND j.is_selesai = 1  AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'
			GROUP BY j.id_produk) as tx";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_akun_masuk($tgl_awal,$tgl_akhir){
			$sql = "SELECT a.nama_akun,SUM(k.nominal) as nominal
			FROM `tx_trans_keu` as k
			LEFT JOIN tm_akun as a ON k.id_akun = a.id_akun
			WHERE k.is_delete = 0 and (a.jenis_transaksi = 1 OR a.jenis_transaksi = 3)  AND DATE_FORMAT(k.tgl_trans,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'
			GROUP BY a.id_akun";

			$sql = $this->db->query($sql);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_akun_keluar($tgl_awal,$tgl_akhir){
			$sql = "SELECT a.nama_akun,SUM(k.nominal) as nominal
			FROM `tx_trans_keu` as k
			LEFT JOIN tm_akun as a ON k.id_akun = a.id_akun
			WHERE k.is_delete = 0 and (a.jenis_transaksi = 2 OR a.jenis_transaksi = 3)  AND DATE_FORMAT(k.tgl_trans,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'
			GROUP BY a.id_akun";

			$sql = $this->db->query($sql);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}


	}

		