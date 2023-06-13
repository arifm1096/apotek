<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_master extends CI_Model {

		public function get_anggota($where){
			$sql = "SELECT a.nis,a.id_anggota,a.id,a.image,a.nik_username,a.nama_lengkap,jk.nama_jenis_kelamin,a.alamat,a.kota,j.nama_jabatan,
				u.nama_unit_kerja,a.rekening,a.thn_masuk,a.tgl_regestrasi,ak.nama_status_aktif,p.nama_perusahaan
				FROM `tm_anggota` AS a
				LEFT JOIN tm_jenis_kelamin as jk ON a.jenis_kelamin = jk.id_jenis_kelamin
				LEFT JOIN tm_agama as ag ON a.agama = ag.id_agama
				LEFT JOIN tm_status as s ON a.status = s.id_status
				LEFT JOIN tm_jabatan as j ON a.jabatan = j.id_jabatan
				LEFT JOIN tm_institusi_dept as i ON a.`intitusi_dept` = i.id_institusi_dept
				LEFT JOIN tm_unit_kerja as u ON a.unit_kerja = u.id_unit_kerja
				LEFT JOIN tm_bank as b ON a.bank = b.id_bank
				LEFT JOIN tm_perusahaan as p ON a.perusahaan = p.id_perusahaan
				LEFT JOIN tm_aktif as ak ON a.aktif = ak.id_aktif
				Where $where";
			$data= $this->db->query($sql);
			
			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			}
		}

		public function get_setting(){
			$sql = $this->db->select('*')
						    ->from('tm_koperasi')
							->get();
			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}

		}

		public function get_jenis_simpanan(){
			$sql = $this->db->select('*')
							->from('tm_jenis_simpanan')
							->where('is_delete',0)
							->where('aktif','y')
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_jenis_pinjaman(){
			$sql = $this->db->select('*')
							->from('tm_jenis_pinjaman')
							->where('is_delete',0)
							->where('aktif','y')
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		
	}

		