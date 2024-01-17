<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_pelayanan extends CI_Model {

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
					WHERE k.insert_by = $id and is_delete = 0
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

		public function get_no_resep($id){
			$sql_max = "SELECT r.kode_resep,r.id_resep,DATE_FORMAT(r.insert_date,'%Y-%m-%d') as tgl_tran
					FROM `tx_resep` as r
					WHERE r.insert_by = $id and is_delete = 0
					ORDER BY r.id_resep DESC";
			$data_max = $this->db->query($sql_max);
			$r_max = $data_max->row();
			$date = date('Y-m-d');
			if($data_max->num_rows()>0){

				if($date == $r_max->tgl_tran){
					$no= (int) substr($r_max->kode_resep, 11,11);
					$urutan = $no + 1;
				}else{
					$urutan = 1;
				}
				
			}else{
				$urutan = 1;
			}

			$sql_id = "SELECT id_dokter,kode_dokter,nama_dokter,username,alamat,klinik_rs,no_hp
						FROM `tm_dokter` where id_dokter = $id";
			$data_id = $this->db->query($sql_id)->row();
			$us = sprintf("%02s", "RE");
			if(!empty($data_id)){
				$dok =  $data_id->kode_dokter;
			}else{
				$dok = $this->session->userdata('id_user');
			}
			
			$date = sprintf("%06s", date('dmy'));
			$no_tx = sprintf("%03s", $urutan);
			$no_ta = $us.$dok.$date.$no_tx;
			return $no_ta;
		}

		public function get_no_remik($id){
			$id_us = $this->session->userdata('id_user');
			$sql_max = "SELECT r.kode_remik,r.id_remik,DATE_FORMAT(r.insert_date,'%Y-%m-%d') as tgl_tran
					FROM `tx_remik` as r
					WHERE r.insert_by = $id and is_delete = 0
					ORDER BY r.id_remik DESC";
			$data_max = $this->db->query($sql_max);
			$r_max = $data_max->row();
			$date = date('Y-m-d');
			if($data_max->num_rows()>0){

				if($date == $r_max->tgl_tran){
					$no= (int) substr($r_max->kode_remik, 11,11);
					$urutan = $no + 1;
				}else{
					$urutan = 1;
				}
				
			}else{
				$urutan = 1;
			}

			$sql_id = "SELECT id_dokter,kode_dokter,nama_dokter,username,alamat,klinik_rs,no_hp
						FROM `tm_dokter` where id_dokter = $id";
			$data_id = $this->db->query($sql_id)->row();
			$us = sprintf("%02s", $id_us);
			$cod =  "REM";
			$date = sprintf("%06s", date('dmy'));
			$no_tx = sprintf("%03s", $urutan);
			$no_ta = $cod.$us.$date.$no_tx;
			return $no_ta;
		}

		public function get_no_racik($id){
			$id_us = $this->session->userdata('id_user');
			$sql_max = "SELECT r.kode_remik,r.id_remik,DATE_FORMAT(r.insert_date,'%Y-%m-%d') as tgl_tran
					FROM `tx_remik` as r
					WHERE r.insert_by = $id and is_delete = 0
					ORDER BY r.id_remik DESC";
			$data_max = $this->db->query($sql_max);
			$r_max = $data_max->row();
			$date = date('Y-m-d');
			if($data_max->num_rows()>0){

				if($date == $r_max->tgl_tran){
					$no= (int) substr($r_max->kode_remik, 11,11);
					$urutan = $no + 1;
				}else{
					$urutan = 1;
				}
				
			}else{
				$urutan = 1;
			}

			$sql_id = "SELECT id_dokter,kode_dokter,nama_dokter,username,alamat,klinik_rs,no_hp
						FROM `tm_dokter` where id_dokter = $id";
			$data_id = $this->db->query($sql_id)->row();
			$us = sprintf("%02s", $id_us);
			$cod =  "RAO";
			$date = sprintf("%06s", date('dmy'));
			$no_tx = sprintf("%03s", $urutan);
			$no_ta = $cod.$us.$date.$no_tx;
			return $no_ta;
		}

		public function get_resep_detail($kode_resep){
			
			$sql = "SELECT k.no_nota,k.id_resep,
					DATE_FORMAT(k.tgl_transaksi,'%d-%m-%Y %H:%i:%s') as tgl_tran,
					u.nama,k.total,k.jumlah_uang,k.kembalian,k.kembalian,k.service,k.embalase,k.lain
					FROM `tx_resep` as k
					LEFT JOIN tm_user as u on k.insert_by = u.id_user
					WHERE k.is_delete = 0 AND k.kode_resep = '$kode_resep'";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_resep_jual($kode_resep){
			$sql = "SELECT j.nama_produk,s.nama_satuan,j.jumlah_produk,j.harga_jual,j.total_harga
					FROM `tx_resep_detail` as j
					LEFT JOIN tm_satuan as s ON j.id_satuan = s.id_satuan
					LEFT JOIN tx_resep as r ON j.id_resep = r.id_resep
					WHERE j.is_delete = 0 AND r.kode_resep =  '$kode_resep'";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			}
		}

		public function get_dokter_detail($id){
			$sql = "SELECT * FROM `tm_dokter` WHERE is_delete = 0 AND id_dokter = $id";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_resep($id){
			$sql = "SELECT r.kode_resep,p.nama_pelanggan,r.insert_date
					FROM `tx_resep` as r
					LEFT JOIN tm_dokter as d ON r.id_dokter = d.id_dokter
					LEFT JOIN tm_pelanggan as p ON r.id_pelanggan = p.id_pelanggan
					WHERE r.is_delete = 0 AND r.id_resep =  $id";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}
	}

		