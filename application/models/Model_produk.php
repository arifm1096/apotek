<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_produk extends CI_Model {

		public function get_anggota_id($id){
			$sql = "SELECT a.nis,a.nama_lengkap,d.nama_institusi_dept,a.tempat_lahir,a.tgl_lahir, a.kota,a.image as foto 
					FROM `tx_pinjaman` as p
					LEFT JOIN tm_anggota as a on p.anggota_id = a.id_anggota
					LEFT JOIN tm_institusi_dept as d on a.intitusi_dept = d.id_institusi_dept
					WHERE p.id_pinjaman = $id ";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}
	
		public function get_produk($id){
			$sql = $this->db->select('*')
							->from('tx_produk as p')
							->join('tx_produk_harga as h','p.id_produk = h.id_produk','left')
							->where('p.is_delete',0)
							->where($id)
							->order_by('h.id_jenis_harga', 'desc')
							->limit(1)
							->get();

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_produk_detail($id){
			$sql = $this->db->select('d.jumlah_produk,d.id_satuan,s.nama_satuan,d.jumlah_produk_p')
							->from('tx_produk_detail as d')
							->join('tx_produk as p','d.id_produk = p.id_produk','left')
							->join('tm_satuan as s','p.satuan_utama = s.id_satuan')
							->where('d.is_delete',0)
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

		