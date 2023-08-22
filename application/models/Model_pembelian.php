<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_pembelian extends CI_Model {

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
	
		public function get_no_sp($id){
			$sql_max = "SELECT b.no_sp,b.id_pesan_beli,DATE_FORMAT(b.insert_date,'%Y-%m-%d') as tgl_tran
						FROM `tx_beli_pesan` as b
						WHERE b.insert_by = $id and is_delete = 0
						ORDER BY b.id_pesan_beli DESC";
			$data_max = $this->db->query($sql_max);
			$r_max = $data_max->row();
			$date = date('Y-m-d');
			if($data_max->num_rows()>0){
				if($date == $r_max->tgl_tran){
					$no= (int) substr($r_max->no_sp, 11,11);
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
			$code = "PO-";
			$date = sprintf("%06s", date('dmy'));
			$no_tx = sprintf("%03s", $urutan);
			$no_sp = $code.$us.$date.$no_tx;
			return $no_sp;
		}

		public function get_no_faktur($id){
			$sql_max = "SELECT no_faktur,id_retur,DATE_FORMAT(insert_date,'%Y-%m-%d') as tgl_tran
						FROM `tx_beli_pesan` as b
						WHERE insert_by = $id and is_delete = 0
						ORDER BY id_retur DESC";
			$data_max = $this->db->query($sql_max);
			$r_max = $data_max->row();
			$date = date('Y-m-d');
			if($data_max->num_rows()>0){
				if($date == $r_max->tgl_tran){
					$no= (int) substr($r_max->no_sp, 11,11);
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
			$code = "REN-";
			$date = sprintf("%06s", date('dmy'));
			$no_tx = sprintf("%03s", $urutan);
			$no_sp = $code.$us.$date.$no_tx;
			return $no_sp;
		}

		public function get_kasir_detail($id){
			
			$sql = "SELECT k.no_nota,k.id_kasir,
					DATE_FORMAT(k.tgl_transaksi,'%d-%m-%Y %H:%i:%s') as tgl_tran,
					u.nama,k.total,k.jumlah_uang,k.kembalian,k.kembalian,k.service,k.embalase,k.lain
					FROM `tx_kasir` as k
					LEFT JOIN tm_user as u on k.insert_by = u.id_user
					WHERE k.is_delete = 0 AND k.id_kasir = $id";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_produk_jual($id){
			$sql = "SELECT j.nama_produk,s.nama_satuan,j.jumlah_produk,j.harga_jual,j.total_harga
					FROM `tx_jual` as j
					LEFT JOIN tm_satuan as s ON j.id_satuan = s.id_satuan
					WHERE j.is_delete = 0 AND j.id_kasir = $id";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			}
		}
	}

		