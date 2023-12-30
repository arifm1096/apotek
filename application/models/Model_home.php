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

		public function get_sum_tot_uang(){
			$data = $this->db->select('sum(k.total) as total_uang')
							 ->from('tx_kasir as k')
							 ->where('k.tgl_transaksi >= CURDATE()')
							 ->where('k.is_delete',0)
							 ->where('k.is_delete',0)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		

		public function get_sum_pembelian(){
			$sql = "SELECT COUNT(id_stok_detail) as jumlah_pembelian FROM `tx_produk_stok_detail` 
					WHERE is_delete = 0 and DATE_FORMAT(insert_date,'%m-%Y') = DATE_FORMAT(CURRENT_DATE,'%m-%Y')";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

	
	
	}

		