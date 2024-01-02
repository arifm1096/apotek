<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_home extends CI_Model {

		public function get_penjualan($where){
			$sql = "SELECT SUM(total_harga) AS total,SUM(jumlah_produk) AS qty_pro 
					FROM tx_jual 
					where is_delete = 0 AND is_selesai = 1 $where";
			$data = $this->db->query($sql);
			
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_margin($where){
			$sql = "SELECT SUM(total_harga) AS total,SUM(jumlah_produk) AS qty_pro 
					FROM tx_jual 
					where is_delete = 0 AND is_selesai = 1 $where";
			$data = $this->db->query($sql);
			
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_penjualan_tertolak($where){
			$sql = "SELECT  SUM(harga_jual) AS total,SUM(jumlah) AS qty_pro 
					FROM tx_jual_tolak
					where is_delete = 0 $where";
			$data = $this->db->query($sql);
			
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_produk_terlaris(){
			$sql = "SELECT t.nama_produk,t.qty FROM (
					SELECT nama_produk,SUM(jumlah_produk) as qty
					FROM `tx_jual`
					WHERE is_delete = 0 AND is_selesai = 1
					GROUP BY id_produk
					) as t
					GROUP BY t.nama_produk
					ORDER BY t.qty DESC
					LIMIT 10";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			} 
		}

		public function get_data_produk(){
			$sql = "SELECT COUNT(id_produk) as total_produk FROM `tx_produk` WHERE is_delete = 0";

			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_data_kadaluarsa(){
			$sql = "SELECT p.nama_produk,ps.jumlah_stok,ps.exp_date,DATE_FORMAT(now(),'%Y-%m-%d') as tgl_now
					FROM
						(SELECT id_produk,jumlah_stok,exp_date FROM `tx_produk_stok` WHERE is_delete = 0
						GROUP BY id_produk
						ORDER BY insert_date DESC) as ps
					LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
					";
			
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}


		public function get_tot_kadaluarsa(){
			$sql = "SELECT ps.id_produk,p.nama_produk,ps.jumlah_stok,ps.exp_date,ps.tgl_now
					FROM(SELECT id_produk,jumlah_stok,exp_date,DATE_FORMAT(now(),'%Y-%m-%d') as tgl_now
						FROM `tx_produk_stok` 
						WHERE is_delete = 0
						GROUP BY id_produk
						ORDER BY insert_date DESC
					) as ps
					LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
					ORDER BY ps.exp_date,p.nama_produk ASC";
					
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			} 
		}

		public function get_tot_kadaluarsa_3mn(){
			$sql = "SELECT ps.id_produk,p.nama_produk,ps.jumlah_stok,ps.exp_date,ps.tgl_3m,ps.tgl_now
					FROM(
						SELECT id_produk,jumlah_stok,exp_date,DATE_FORMAT(now(),'%Y-%m-%d') as tgl_now,
						DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 3 MONTH), '%Y-%m-%d') as tgl_3m
						FROM `tx_produk_stok`
						WHERE is_delete = 0
						GROUP BY id_produk
						ORDER BY insert_date DESC
					) as ps
					LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
					ORDER BY ps.exp_date,p.nama_produk ASC";
					
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			} 
		}

		public function get_persedian($tgl1,$tgl2){
			$query = "SELECT 
			sum(p.harga_beli * ps.jumlah_stok) as total_modal,
			sum(ps.jumlah_stok) as total_produk
			FROM `tx_produk_stok` as ps
			LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
			WHERE ps.is_delete = 0 AND p.is_delete = 0 AND ps.insert_date BETWEEN '$tgl1' and '$tgl2'";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_data_pesan_aktif(){
			$sql = "SELECT s.nama_supplier,bs.tgl_pesan,SUM(br.harga_beli) as nominal
					FROM `tx_beli_rencana` as br
					LEFT JOIN tx_beli_pesan as bs ON br.id_pesan_beli = bs.id_pesan_beli
					LEFT JOIN tm_supplier as s ON bs.id_supplier = s.id_supplier
					WHERE br.is_delete = 0 AND br.status_terima = 0
					GROUP BY bs.id_pesan_beli";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			} 
		}

		public function get_data_jatuh_tempo(){
			$sql = "SELECT s.nama_supplier,bs.tgl_pesan,SUM(br.harga_beli) as nominal,DATE_FORMAT(DATE_ADD(now(),INTERVAL -14 DAY),'%Y-%m-%d') as tgl
					FROM `tx_beli_rencana` as br
					LEFT JOIN tx_beli_pesan as bs ON br.id_pesan_beli = bs.id_pesan_beli
					LEFT JOIN tm_supplier as s ON bs.id_supplier = s.id_supplier
					WHERE br.is_delete = 0 AND br.status_terima = 0 AND bs.tgl_pesan <= DATE_FORMAT(DATE_ADD(now(),INTERVAL -14 DAY),'%Y-%m-%d') 
					GROUP BY bs.id_pesan_beli";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			} 
		}

		public function get_rencana_beli(){
			$sql = "SELECT sum(harga_beli) as harga FROM `tx_beli_rencana` WHERE is_selesai = 0 AND is_delete = 0";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_pesanan_aktif(){
			$sql = "SELECT sum(harga_beli) as harga FROM `tx_beli_rencana` WHERE is_selesai = 0 AND status_terima = 0";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_fakture(){
			$sql = "SELECT sum(harga_beli) as tot_harga FROM `tx_beli_rencana` WHERE is_delete = 0 AND status_terima = 1";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_tot_beli($tgl_awal,$tgl_akhir){
			$sql = "SELECT sum(harga_beli) as tot_harga 
					FROM `tx_beli_rencana` 
					WHERE is_delete = 0 AND status_terima = 1
					AND insert_date between '$tgl_awal' and '$tgl_akhir'";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_retur($tgl_awal,$tgl_akhir){
			$sql = "SELECT sum(harga) as nominal 
					FROM `tx_retur_detail` WHERE is_delete = 0 AND insert_date
			 		between '$tgl_awal' and '$tgl_akhir'";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}
	
	}

		