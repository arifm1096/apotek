<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_home extends CI_Model {

		public function get_sum_stok(){
			$data = $this->db->select('sum(s.jumlah_stok) as jumlah_stok')
							 ->from('tx_produk_stok as s')
							 ->where('s.is_delete',0)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_sum_penjualan(){
			$data = $this->db->select('count(k.id_kasir) as jumlah_penjualan')
							 ->from('tx_kasir as k')
							 ->where('k.tgl_transaksi >= CURDATE()')
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

		