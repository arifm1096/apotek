<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_kas extends CI_Model {

// Data Master START
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

		public function get_anggota(){
			$sql = $this->db->select('*')
							->from('tm_anggota')
							->where('aktif','y')
							->where('is_delete',0)
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

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
	
		public function get_barang(){
			$sql = $this->db->select('*')
							->from('tm_barang')
							->where('is_delete',0)
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}
	
		public function get_trans_kas($where){
			$sql = $this->db->select('k.id_kas,k.kode_trans,js.jenis_transaksi,jk.nama_kas,k.tanggal_trans,k.jumlah,k.ket,u.username')
							->from('tx_kas as k')
							->join('tm_jenis_akun as js','k.jenis_akun = js.id_jenis_Akun','left')
							->join('tm_jenis_kas as jk','k.jenis_kas = jk.id_jenis_kas','left')
							->join('tm_user as u','k.insert_by = u.id_user','left')
							->where($where)
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_kas(){
			$sql = $this->db->select('*')
							->from('tm_jenis_kas')
							->where('pinjaman','y')
							->where('is_delete',0)
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_trans(){
			$sql = $this->db->select('*')
							->from('tm_trans')
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_simpanan_id($where){
			$sql = "SELECT s.id_simpanan,s.tgl_simpan,s.kode,s.jumlah_nominal,s.ket,a.nis,
					a.nama_lengkap,d.nama_institusi_dept,j.jenis_simpanan,u.username,k.nama_kas
					FROM `tx_simpanan` as s
					LEFT JOIN tm_jenis_kas as k ON s.jenis_kas = k.id_jenis_kas
					LEFT JOIN tm_anggota as a on s.anggota_id = a.id_anggota
					LEFT JOIN tm_jenis_simpanan as j on s.jenis_simpanan_id = j.id_jenis_simpanan
					LEFT JOIN tm_trans as t ON s.trans_id = t.id_trans
					LEFT JOIN tm_institusi_dept as d ON a.intitusi_dept = d.id_institusi_dept
					LEFT JOIN tm_user as u on s.insert_by = u.id_user
					WHERE $where ";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_laporan($where){
			$sql = "SELECT  s.kode,a.nis,a.nama_lengkap,d.nama_institusi_dept,js.jenis_simpanan,s.tgl_simpan,
				js.bunga,
				SUM(jumlah_nominal) as tot_simpanan_pokok,
				(CASE WHEN TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW()) > 0 THEN
						TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW()) - 1
					ELSE
						TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW())
				END) as bulan_bunga,
				FLOOR(SUM(s.jumlah_nominal) * js.bunga / 100) * 
				(CASE WHEN TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW()) > 0 THEN
						TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW()) - 1
					ELSE
						TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW())
				END) as bunga_simpanan,
				FLOOR(SUM(s.jumlah_nominal) * js.bunga / 100) * 
				(CASE WHEN TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW()) > 0 THEN
						TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW()) - 1
					ELSE
						TIMESTAMPDIFF(MONTH, s.tgl_simpan, NOW())
				END) + SUM(jumlah_nominal) as simpanan_plus_bunga,
				COALESCE(p.nom_penarikan,0) as tot_penarikan
				FROM `tx_simpanan` as s  
				LEFT JOIN tm_jenis_simpanan as js ON s.jenis_simpanan_id = js.id_jenis_simpanan
				LEFT JOIN tm_anggota as a ON s.anggota_id = a.id_anggota
				LEFT JOIN tm_institusi_dept as d ON a.intitusi_dept = d.id_institusi_dept
				LEFT JOIN (
				SELECT pn.anggota_id,pn.jenis_simpanan_id,pn.jenis_kas,pn.simpan_trans,
				SUM(CASE When pn.jumlah_nominal IS NOT NULL Then pn.jumlah_nominal Else '0' End ) as nom_penarikan
				FROM `tx_simpanan`  as pn
				WHERE pn.simpan_trans = 2 AND pn.is_delete = 0
				GROUP BY pn.jenis_simpanan_id,pn.anggota_id
				) as p ON s.anggota_id = p.anggota_id AND s.jenis_simpanan_id = p.jenis_simpanan_id
				WHERE s.simpan_trans = 1 AND s.is_delete = 0 AND $where
				GROUP BY s.jenis_simpanan_id,s.anggota_id
				ORDER BY s.id_simpanan";

		   $data = $this->db->query($sql);
		   if($data->num_rows()>0){
			return $data->result();
		   }else{
			return null;
		   }
		}

		public function get_setroran_simpanan(){

		}

		public function get_jurnal_umum($where){
			$sql = "SELECT j.kode,CAST(j.tanggal_trans AS DATE) as tgl_trans,SUM(j.debet) as debet, SUM(j.kredit) as kredit 
					FROM `tx_jurnal_umum` as j
					WHERE $where
					GROUP BY j.kode ";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			}
		}

		public function get_jurnal_umum_list($where){
			$sql = "SELECT j.id_jurnal,
					CAST(j.tanggal_trans AS DATE) as tgl_trans,j.kode,a.jenis_transaksi,j.debet,j.kredit,j.descripsi,j.memo,a.kd_aktifa
					FROM `tx_jurnal_umum` as j
					LEFT JOIN tm_jenis_akun as a ON j.akun_id = a.id_jenis_akun
					WHERE $where
					GROUP BY id_jurnal";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			}
		}

		public function get_tot_jurnal_umum($where){
			$sql = "SELECT SUM(j.debet) as tot_debet, SUM(j.kredit) as tot_kredit 
					FROM `tx_jurnal_umum` as j
					LEFT JOIN tm_jenis_akun as a ON j.akun_id = a.id_jenis_akun
					where $where";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}
// Data Master END

	
	}

		