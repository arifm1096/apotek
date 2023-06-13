<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_home extends CI_Model {

		public function get_sum_pinjaman_reg($where){
			$data = $this->db->select('sum(p.jumlah_nominal) as pinjaman_pokok')
							 ->from('tx_pinjaman as p')
							 ->join('tm_jenis_pinjaman as jp','p.jenis_pinjaman_id = jp.id_jenis_pinjaman')
							 ->where('jp.pinjaman_reguler','y')
							 ->where($where)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_sum_pinjaman_ins($where){
			$data = $this->db->select('sum(p.jumlah_nominal) as pinjaman_pokok')
							 ->from('tx_pinjaman as p')
							 ->join('tm_jenis_pinjaman as jp','p.jenis_pinjaman_id = jp.id_jenis_pinjaman')
							 ->where('jp.pinjaman_instan','y')
							 ->where($where)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_sum_pinjaman_ren($where){
			$data = $this->db->select('sum(p.jumlah_nominal) as pinjaman_pokok')
							 ->from('tx_pinjaman as p')
							 ->join('tm_jenis_pinjaman as jp','p.jenis_pinjaman_id = jp.id_jenis_pinjaman')
							 ->where('jp.pinjaman_renika','y')
							 ->where($where)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			} 
		}

		public function get_tot_pin_reg($where){
			$sql = "SELECT 
					sum(p.lama_angsuran) as angsuran_tot,
					sum(ag.tot_angsuran) as angusran_tot,
					sum(ROUND(jumlah_nominal*(p.bunga/100))) as bunga_angsuran,
					sum(ROUND(jumlah_nominal/lama_angsuran)) as angsuran,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran)) as total_angsuran,
					sum(p.jumlah_nominal) as pinjaman_pokok,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * p.lama_angsuran) as total_pinjaman,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * ag.tot_angsuran) as total_angsur,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * p.lama_angsuran) - 
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * ag.tot_angsuran) as sisa_angsuran
					FROM tx_pinjaman as p
					LEFT JOIN tm_jenis_pinjaman as j ON p.jenis_pinjaman_id = j.id_jenis_pinjaman 
					LEFT JOIN tm_anggota as a ON p.anggota_id = a.id_anggota
					LEFT JOIN (
						SELECT COUNT(id_angsuran) as tot_angsuran,id_angsuran,id_pinjaman
						FROM `tx_angsuran` 
						WHERE is_delete = 0 
						GROUP BY id_pinjaman
					) as ag ON p.id_pinjaman = ag.id_pinjaman
					where j.pinjaman_reguler = 'y' $where";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_tot_pin_ins($where){
			$sql = "SELECT 
					sum(p.lama_angsuran) as angsuran_tot,
					sum(ag.tot_angsuran) as angusran_tot,
					sum(ROUND(jumlah_nominal*(p.bunga/100))) as bunga_angsuran,
					sum(ROUND(jumlah_nominal/lama_angsuran)) as angsuran,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran)) as total_angsuran,
					sum(p.jumlah_nominal) as pinjaman_pokok,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * p.lama_angsuran) as total_pinjaman,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * ag.tot_angsuran) as total_angsur,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * p.lama_angsuran) - 
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * ag.tot_angsuran) as sisa_angsuran
					FROM tx_pinjaman as p
					LEFT JOIN tm_jenis_pinjaman as j ON p.jenis_pinjaman_id = j.id_jenis_pinjaman 
					LEFT JOIN tm_anggota as a ON p.anggota_id = a.id_anggota
					LEFT JOIN (
						SELECT COUNT(id_angsuran) as tot_angsuran,id_angsuran,id_pinjaman
						FROM `tx_angsuran` 
						WHERE is_delete = 0 
						GROUP BY id_pinjaman
					) as ag ON p.id_pinjaman = ag.id_pinjaman
					where j.pinjaman_instan = 'y' $where";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_tot_pin_ren($where){
			$sql = "SELECT 
					sum(p.lama_angsuran) as angsuran_tot,
					sum(ag.tot_angsuran) as angusran_tot,
					sum(ROUND(jumlah_nominal*(p.bunga/100))) as bunga_angsuran,
					sum(ROUND(jumlah_nominal/lama_angsuran)) as angsuran,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran)) as total_angsuran,
					sum(p.jumlah_nominal) as pinjaman_pokok,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * p.lama_angsuran) as total_pinjaman,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * ag.tot_angsuran) as total_angsur,
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * p.lama_angsuran) - 
					sum(ROUND(jumlah_nominal*(p.bunga/100)) + ROUND(jumlah_nominal/lama_angsuran) * ag.tot_angsuran) as sisa_angsuran
					FROM tx_pinjaman as p
					LEFT JOIN tm_jenis_pinjaman as j ON p.jenis_pinjaman_id = j.id_jenis_pinjaman 
					LEFT JOIN tm_anggota as a ON p.anggota_id = a.id_anggota
					LEFT JOIN (
						SELECT COUNT(id_angsuran) as tot_angsuran,id_angsuran,id_pinjaman
						FROM `tx_angsuran` 
						WHERE is_delete = 0 
						GROUP BY id_pinjaman
					) as ag ON p.id_pinjaman = ag.id_pinjaman
					where j.pinjaman_renika = 'y' $where";
			$data = $this->db->query($sql);
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_anggota_tot(){
			$data = $this->db->select('count(id_anggota) as anggota')
							->from('tm_anggota')
							->where('is_delete',0)
							->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_anggota_aktif_tot(){
			$data = $this->db->select('count(id_anggota) as anggota_aktif')
							->from('tm_anggota')
							->where('aktif','y')
							->where('is_delete',0)
							->get();

			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_anggota_tidak_aktif_tot(){
			$data = $this->db->select('count(id_anggota) as anggota_tidak_aktif')
							->from('tm_anggota')
							->where('aktif','n')
							->where('is_delete',0)
							->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_kas_masuk(){
			$data = $this->db->select('sum(jumlah) as kas_masuk')
							 ->from('tx_kas')
							 ->where('jenis_trans',1)
							 ->where('is_delete',0)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_kas_keluar(){
			$data = $this->db->select('sum(jumlah) as kas_keluar')
							 ->from('tx_kas')
							 ->where('jenis_trans',2)
							 ->where('is_delete',0)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_kas_transfer(){
			$data = $this->db->select('sum(jumlah) as kas_transfer')
							 ->from('tx_kas')
							 ->where('jenis_trans',3)
							 ->where('is_delete',0)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_simpanan_wajib(){
			$data = $this->db->select('sum(jumlah_nominal) as simpanan_wajib')
							 ->from('tx_simpanan')
							 ->where('jenis_simpanan_id',1)
							 ->where('trans_id',1)
							 ->where('is_delete',0)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_simpanan(){
			$data = $this->db->select('sum(jumlah_nominal) as simpanan')
							 ->from('tx_simpanan')
							 ->where('trans_id',1)
							 ->where('is_delete',0)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}

		public function get_penarikan(){
			$data = $this->db->select('sum(jumlah_nominal) as penarikan')
							 ->from('tx_simpanan')
							 ->where('trans_id',2)
							 ->where('is_delete',0)
							 ->get();
			if($data->num_rows()>0){
				return $data->row();
			}else{
				return null;
			}
		}
	
	}

		