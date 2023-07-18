<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_penjualan extends CI_Model {

		public function get_user($id){
			$sql = "SELECT u.nama as nama_user, w.nama_wilayah, w.no_hp, w.alamat,w.nama_print
					FROM `tm_user` as u
					LEFT JOIN tm_wilayah as w ON u.gudang = w.id_wilayah
					WHERE u.id_user = $id and u.is_delete = 0";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}
	
		public function get_no_nota($id){
			$sql_max = "SELECT k.no_nota,k.id_kasir,DATE_FORMAT(k.tgl_transaksi,'%Y-%m-%d') as tgl_tran
					FROM `tx_kasir` as k
					WHERE k.insert_by = $id
					ORDER BY k.id_kasir DESC";
			$data_max = $this->db->query($sql_max);
			$r_max = $data_max->row();
			$date = date('Y-m-d');
			if($data_max->num_rows()>0){

				if($date == $r_max->tgl_tran){
					$no= (int) substr($r_max->no_nota, 11,11);
					$urutan = $no + 1;
				}else{
					$urutan = 1;
				}
				
			}else{
				$urutan = 1;
			}

			$sql_id = "SELECT u.id_user,w.kode
						FROM  tm_user as u 
						LEFT JOIN tm_wilayah as w on u.gudang = w.id_wilayah
						WHERE u.id_user = $id";
			$data_id = $this->db->query($sql_id)->row();

			$us = sprintf("%02s", $data_id->id_user);
			$wil =  $data_id->kode;
			$date = sprintf("%06s", date('dmy'));
			$no_tx = sprintf("%03s", $urutan);
			$no_ta = $wil.$us.$date.$no_tx;
			return $no_ta;
		}

		public function get_produk_detail($id){
			$sql = $this->db->select('*')
							->from('tx_produk_detail')
							->where('is_delete',0)
							->where($id)
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_produk_harga($id){
			$sql = $this->db->select('*')
							->from('tx_produk_harga')
							->where('is_delete',0)
							->where($id)
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}
	}

		