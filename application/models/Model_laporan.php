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
			$query = "SELECT sum(tx.margin) as tot_margin 
			FROM
			(SELECT j.id_jual,p.id_produk,p.sku_kode_produk,p.nama_produk,
			sum(j.jumlah_produk) as tot_produk_jual,
			p.harga_beli,
			sum(j.harga_beli) * sum(j.jumlah_produk) as tot_harga_beli,
			j.harga_jual,
			sum(j.harga_jual) * sum(j.jumlah_produk) as tot_harga_jual,
			(sum(j.harga_jual) * sum(j.jumlah_produk)) - (sum(j.harga_beli) * sum(j.jumlah_produk)) as margin
			FROM `tx_jual` as j
			LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
			WHERE j.is_delete = 0 AND j.is_selesai = 1 AND p.is_delete = 0  AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'
			GROUP BY p.id_produk) as tx";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lap_margin_resep($tgl_awal,$tgl_akhir){
			$query = "SELECT sum(tx.margin) as tot_margin 
			FROM
			(SELECT p.id_produk,p.sku_kode_produk,p.nama_produk,
			sum(j.jumlah_produk) as tot_produk_jual,
			p.harga_beli,
			sum(j.harga_beli) * sum(j.jumlah_produk) as tot_harga_beli,
			j.harga_jual,
			sum(j.harga_jual) * sum(j.jumlah_produk) as tot_harga_jual,
			(sum(j.harga_jual) * sum(j.jumlah_produk)) - (sum(j.harga_beli) * sum(j.jumlah_produk)) as margin
			FROM `tx_resep_detail` as j
			LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
			WHERE j.is_delete = 0 AND j.is_selesai = 1 AND p.is_delete = 0  AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'
			AND j.status = 1 or j.status = 3
			GROUP BY p.id_produk) as tx";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lap_pem_langsung($tgl_awal,$tgl_akhir){
			$query = "SELECT 
			sum(psd.jumlah_stok) * CASE WHEN psd.harga_beli = 0 THEN p.harga_beli ELSE psd.harga_beli END as tot_harga_beli
			FROM `tx_produk_stok_detail` as psd
			LEFT JOIN tx_produk as p on psd.id_produk = p.id_produk
			WHERE psd.is_delete = 0 AND p.is_delete = 0 AND DATE_FORMAT(psd.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lap_pem_rencana($tgl_awal,$tgl_akhir){
			$query = "SELECT 
			sum(psd.jumlah_produk) * CASE WHEN psd.harga_beli = 0 THEN p.harga_beli ELSE psd.harga_beli END as tot_harga_beli
			FROM `tx_beli_rencana` as psd
			LEFT JOIN tx_produk as p on psd.id_produk = p.id_produk
			WHERE psd.is_delete = 0 AND p.is_delete = 0 AND psd.status_terima = 1 AND DATE_FORMAT(psd.insert_date,'%d-%m-%Y') BETWEEN '$tgl_awal' AND '$tgl_akhir'";
			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}


	}

		