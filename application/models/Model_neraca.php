<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_neraca extends CI_Model {

// Data Master START
		public function get_akun_kas_aktiva(){
			$query = "SELECT ja.kd_aktifa,ja.jenis_transaksi,ja.id_jenis_akun,k.id_jenis_kas
						FROM `tm_jenis_akun` as ja
						LEFT JOIN tm_jenis_kas as k ON ja.id_jenis_akun = k.akun_id
						WHERE ja.is_delete = 0 AND ja.neraca ='y' 
						AND (ja.kd_aktifa = '111.100' or ja.kd_aktifa = '112.100')
						AND ja.kd_aktifa !='01.01.00' AND ja.jenis_akun = 1
						GROUP BY ja.id_jenis_akun";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_akun_pinjam_aktiva(){
			$query = "SELECT ja.kd_aktifa,ja.jenis_transaksi,ja.id_jenis_akun,p.id_jenis_pinjaman
					FROM `tm_jenis_akun` as ja
					LEFT JOIN tm_jenis_pinjaman as p ON ja.id_jenis_akun = p.akun_id
					WHERE ja.is_delete = 0 AND ja.neraca ='y' 
					AND (ja.kd_aktifa = '122.100' or ja.kd_aktifa = '122.600' or ja.kd_aktifa = '122.200')
					AND ja.kd_aktifa !='01.02.00' AND ja.jenis_akun = 1
					GROUP BY ja.id_jenis_akun";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_akun_hutang_pasiva(){
			$query = "SELECT kd_aktifa,jenis_transaksi,id_jenis_akun
					FROM `tm_jenis_akun`
					WHERE is_delete = 0 AND neraca ='y' 
					AND LEFT(kd_aktifa,2) ='02'  AND kd_aktifa !='02.00.00' AND jenis_akun = 2";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}

		public function get_akun_modal_pasiva(){
			$query = "SELECT ja.kd_aktifa,ja.jenis_transaksi,ja.id_jenis_akun,s.id_jenis_simpanan
					FROM `tm_jenis_akun` as ja
					LEFT JOIN tm_jenis_simpanan as s ON ja.id_jenis_akun = s.akun_id
					WHERE ja.is_delete = 0 AND ja.neraca ='y' 
					AND (ja.kd_aktifa = '370.000' or ja.kd_aktifa = '320.000' or ja.kd_aktifa = '310.000')
					AND ja.kd_aktifa !='03.00.00' AND ja.jenis_akun = 2
					GROUP BY ja.id_jenis_akun";

			$sql = $this->db->query($query);
			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}

		}
		

		public function get_nominal_simpan($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal, jenis_simpanan_id as jenis_id
						FROM `tx_simpanan`
						WHERE is_delete = 0
						AND tgl_simpan BETWEEN $where
						GROUP BY jenis_simpanan_id";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_nominal_pinjaman($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal, jenis_pinjaman_id as jenis_id
						FROM `tx_pinjaman`
						WHERE is_delete = 0
						AND tgl_pinjam BETWEEN $where
						GROUP BY jenis_pinjaman_id";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_nominal_kas($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal, 1 as jenis_id_kas
						FROM `tx_simpanan`
						WHERE is_delete = 0 AND jenis_kas = 1
						AND tgl_simpan BETWEEN $where";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_nominal_bank($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal, 3 as jenis_id_bank
						FROM `tx_simpanan`
						WHERE is_delete = 0 AND jenis_kas = 3
						AND tgl_simpan BETWEEN $where";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_tot_kas($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal_kas
						FROM `tx_simpanan`
						WHERE is_delete = 0 
						AND tgl_simpan BETWEEN $where";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_pin_kas($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal, 1 as jenis_id
						FROM `tx_pinjaman`
						WHERE is_delete = 0 AND jenis_kas = 1
						AND tgl_pinjam BETWEEN $where";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_pin_bank($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal, 3 as jenis_id
						FROM `tx_pinjaman`
						WHERE is_delete = 0 AND jenis_kas = 3
						AND tgl_pinjam BETWEEN $where";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_tot_pinjam($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal
						FROM `tx_pinjaman`
						WHERE is_delete = 0
						AND tgl_pinjam BETWEEN $where
					";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}


		public function get_tot_simpan($where){
			$query = "SELECT SUM(jumlah_nominal) as nominal 
					FROM `tx_simpanan` 
					WHERE is_delete = 0 
					AND tgl_simpan BETWEEN $where
					";

			$sql = $this->db->query($query);

			if($sql->num_rows()>0){
				return $sql->row();
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

		public function get_simpanan_penarikan($where){
			$sql = "SELECT s.kode,s.tgl_simpan,a.nis,a.nama_lengkap,d.nama_institusi_dept,js.jenis_simpanan,s.jumlah_nominal,u.username
					FROM `tx_simpanan` as s
					LEFT JOIN tm_anggota as a ON s.anggota_id = a.id_anggota
					LEFT JOIN tm_institusi_dept as d ON a.intitusi_dept = d.id_institusi_dept
					LEFT JOIN tm_jenis_simpanan as js ON s.jenis_simpanan_id = js.id_jenis_simpanan
					LEFT JOIN tm_trans as t ON s.trans_id = t.id_trans
					LEFT JOIN tm_user as u ON s.insert_by = u.id_user
					where $where";
			$data = $this->db->query($sql);

			if($data->num_rows()>0){
				return $data->result();
			}else{
				return null;
			}
			
		}
// Data Master END

	
	}

		