<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Model_pinjam extends CI_Model {

// Data Master START
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
			$sql = "SELECT a.nis,a.nama_lengkap,d.nama_institusi_dept,a.tempat_lahir,
					a.alamat,a.tgl_lahir, a.kota,a.image as foto, u.username
					FROM `tx_pinjaman` as p
					LEFT JOIN tm_anggota as a on p.anggota_id = a.id_anggota
					LEFT JOIN tm_institusi_dept as d on a.intitusi_dept = d.id_institusi_dept
					LEFT JOIN tm_user as u on p.insert_by = u.id_user
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
	
		public function get_jenis_pinjaman_reguler(){
			$sql = $this->db->select('*')
							->from('tm_jenis_pinjaman')
							->where('is_delete',0)
							->where('aktif','y')
							->where('pinjaman_reguler','y')
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		

		public function get_jenis_pinjaman_renika(){
			$sql = $this->db->select('*')
							->from('tm_jenis_pinjaman')
							->where('is_delete',0)
							->where('aktif','y')
							->where('pinjaman_renika','y')
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_jenis_pinjaman_instan(){
			$sql = $this->db->select('*')
							->from('tm_jenis_pinjaman')
							->where('is_delete',0)
							->where('id_jenis_pinjaman',2)
							->where('aktif','y')
							->where('pinjaman_instan','y')
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_jenis_pinjaman_id($id){
			$sql = $this->db->select('*')
							->from('tm_jenis_pinjaman')
							->where('id_jenis_pinjaman',$id)
							->get();

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_lama_angsuran(){
			$sql = $this->db->select('*')
							->from('tm_lama_angsuran')
							->where('is_delete',0)
							->where('aktif','y')
							->where('pinjaman_reguler','y')
							->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function get_lama_angsuran_instan(){
			$sql = $this->db->select('*')
							->from('tm_lama_angsuran')
							->where('is_delete',0)
							->where('aktif','y')
							->where('pinjaman_instan','y')
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

		public function get_kategori(){
			$sql = $this->db->select('*')
							->from('tm_kategori_pinjaman')
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
// Data Master END

// Pinjaman START
		public function get_data_pinjam($pinjam_id){
			$sql = $this->db->select('*')
							->from('tx_pinjaman')
							->where('id_pinjaman',$pinjam_id)
							->get();

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_tgl_tempo($pinjam_id){
			$sql = $this->db->select('jatuh_tempo')
							->from('tx_pinjaman as p')
							->join('tm_jenis_pinjaman as jp','p.jenis_pinjaman_id = jp.id_jenis_pinjaman','left')
							->where('p.id_pinjaman',$pinjam_id)
							->get();

			if($sql->num_rows()>0){
				return $sql->row();
			}else{
				return null;
			}
		}

		public function get_simulasi_pinjaman($pinjam_id) {
			$row = $this->get_data_pinjam($pinjam_id);
			$bunga = $this->get_jenis_pinjaman_id($row->jenis_pinjaman_id);
			if($row) {
				$out = array();
				$pokok_angsuran = $row->jumlah_nominal / $row->lama_angsuran ;
				$bunga_angsuran = ($row->jumlah_nominal * $row->bunga / 100);
				$jumlah_angsuran = round($pokok_angsuran);

				// $denda_hari = sprintf('%02d', $conf_bunga['denda_hari']);
				// $biaya_admin = $conf_bunga['biaya_adm'];
				// $tgl_tempo_next = 0;

				for ($i=1; $i <= $row->lama_angsuran; $i++) { 
					$odat = array();
					$odat['angsuran_pokok'] = round($pokok_angsuran);
					$odat['tgl_pinjam'] = substr($row->tgl_pinjam, 0, 10);
					$odat['biaya_adm'] = $row->biaya_adm;
					$odat['bunga_pinjaman'] = round($bunga_angsuran);
					$odat['jumlah_ags'] = round($jumlah_angsuran) + $bunga_angsuran;
					$tgl_tempo_var = substr($row->tgl_pinjam, 0, 7) .'-'. $bunga->jatuh_tempo;
					$tgl_tempo = date("Y-m-d", strtotime($tgl_tempo_var . "+".$i." month"));
					// $tgl_tempo = substr($tgl_tempo, 0, 7);
					$odat['tgl_tempo'] = $tgl_tempo;
					$out[] = $odat;
				}
				return $out;
			} else {
				return null;
			}
		}

		public function get_simulasi_pinjaman_instan($pinjam_id) {
			$row = $this->get_data_pinjam($pinjam_id);
			$bunga = $this->get_jenis_pinjaman_id($row->jenis_pinjaman_id);
			if($row) {
				$out = array();
				$pokok_angsuran = $row->jumlah_nominal / $row->lama_angsuran ;
				$bunga_angsuran = ($row->jumlah_nominal * $row->bunga / 100);
				$jumlah_angsuran = round($pokok_angsuran);

				// $denda_hari = sprintf('%02d', $conf_bunga['denda_hari']);
				// $biaya_admin = $conf_bunga['biaya_adm'];
				// $tgl_tempo_next = 0;

				for ($i=1; $i <= $row->lama_angsuran; $i++) { 
					$odat = array();
					$odat['angsuran_pokok'] = round($pokok_angsuran);
					$odat['tgl_pinjam'] = substr($row->tgl_pinjam, 0, 10);
					$odat['biaya_adm'] = $row->biaya_adm;
					$odat['bunga_pinjaman'] = round($bunga_angsuran);
					$odat['jumlah_ags'] = round($jumlah_angsuran) + $bunga_angsuran;
					$tgl_tempo_var = substr($row->tgl_pinjam, 0, 7) .'-'. $bunga->jatuh_tempo;
					$tgl_tempo = date("Y-m-d", strtotime($tgl_tempo_var . "+".$i." day"));
					// $tgl_tempo = substr($tgl_tempo, 0, 7);
					$odat['tgl_tempo'] = $tgl_tempo;
					$out[] = $odat;
				}
				return $out;
			} else {
				return null;
			}
		}

		public function get_simulasi_pinjaman_tot($pinjam_id) {
			
			$row = $this->get_data_pinjam($pinjam_id);
			$bunga = $this->get_jenis_pinjaman_id($row->jenis_pinjaman_id);
			if($row) {
				$data = [];
				$ags_hit= $pokok_angsuran = $row->jumlah_nominal / $row->lama_angsuran;
				$pokok_angsuran = round($ags_hit) * $row->lama_angsuran;
				$bunga_angsuran = ($row->jumlah_nominal * $row->bunga / 100) * $row->lama_angsuran;
				$jumlah_angsuran = $pokok_angsuran + round($bunga_angsuran) ;

					$data['tot_angsuran_pokok'] = $pokok_angsuran;
					$data['tot_tgl_pinjam'] = substr($row->tgl_pinjam, 0, 10);
					$data['tot_bunga_pinjaman'] = round($bunga_angsuran);
					$data['tot_jumlah_ags'] = $jumlah_angsuran;
					$tgl_tempo_var = substr($row->tgl_pinjam, 0, 7) .'-'. $bunga->jatuh_tempo;
					$tgl_tempo = date("Y-m-d", strtotime($tgl_tempo_var . " +".$row->lama_angsuran." month"));
					// $tgl_tempo = substr($tgl_tempo, 0, 7);
					$data['tgl_tempo'] = $tgl_tempo;

					
			
				return $data;
			} else {
				return null;
			}
		}
		public function get_pinjaman_id($pinjam_id) {
			$row = $this->get_data_pinjam($pinjam_id);
			$bunga = $this->get_jenis_pinjaman_id($row->jenis_pinjaman_id);
			if($row) {
				$data = [];
				$pokok_angsuran = $row->jumlah_nominal / $row->lama_angsuran ;
				$bunga_angsuran = ($row->jumlah_nominal * $row->bunga / 100);
				$jumlah_angsuran = $pokok_angsuran + $bunga_angsuran ;
					$data['count_angsuran'] = $row->lama_angsuran;
					$data['kode'] = $row->kode;
					$data['pokok_pinjaman'] = $row->jumlah_nominal;
					$data['lama_angsuran'] = $row->lama_angsuran;
					$data['angsuran_pokok'] = round($pokok_angsuran);
					$data['tgl_pinjam'] = substr($row->tgl_pinjam, 0, 10);
					$data['bunga_pinjaman'] = round($bunga_angsuran);
					$data['biaya_cdg'] = $row->biaya_cadangan;
					$data['biaya_adm'] =$row->biaya_adm ;
					$data['jumlah_ags'] = round($jumlah_angsuran);
					$tgl_tempo_var = substr($row->tgl_pinjam, 0, 7) .'-'. $bunga->jatuh_tempo;
					$tgl_tempo = date("Y-m-d", strtotime($tgl_tempo_var . " +".$row->lama_angsuran." month"));
					// $tgl_tempo = substr($tgl_tempo, 0, 7);
					$data['tgl_tempo'] = $tgl_tempo;
					
			
				return $data;
			} else {
				return null;
			}
		}

		public function get_jenis_pin($pinjam_id){
			$sql_jepin = $this->db->select('pm.denda')
								  ->from('tx_angsuran as a')
								  ->join('tx_pinjaman as p','a.id_pinjaman = p.id_pinjaman','left')
								  ->join('tm_jenis_pinjaman as pm','p.jenis_pinjaman_id = pm.id_jenis_pinjaman')
								  ->where('p.id_pinjaman',$pinjam_id)
								  ->where('p.is_delete',0)
								  ->where('pm.is_delete',0)
								  ->where('a.is_delete',0)
								  ->get();
			if($sql_jepin->num_rows()>0){
				return $sql_jepin->row_array();
			}else{
				return null;
			}
		}

		public function getPinjaman_detai($where){
			$sql = "SELECT 
					p.id_pinjaman,p.kode,p.tgl_pinjam,p.jumlah_nominal,
					ROUND((p.jumlah_nominal * p.bunga / 100) * p.lama_angsuran) as bunga,
					p.biaya_adm,p.lama_angsuran,
					a.nis,a.nama_lengkap,d.nama_institusi_dept,a.tempat_lahir,a.tgl_lahir, a.kota,
					b.nama_barang,u.username,
					(CASE WHEN (p.lunas ='0') THEN 'Belum Lunas' 
					WHEN	(p.lunas = '1') THEN 'Lunas'
					END) as lunas_fix
					FROM `tx_pinjaman` as p
					LEFT JOIN tm_anggota as a on p.anggota_id = a.id_anggota
					LEFT JOIN tm_institusi_dept as d on a.intitusi_dept = d.id_institusi_dept
					LEFT JOIN tm_jenis_pinjaman as jp on p.jenis_pinjaman_id = jp.id_jenis_pinjaman
					LEFT JOIN tm_barang as b on p.barang_id = b.id_barang
					LEFT JOIN tm_user as u on p.insert_by = u.id_user
					WHERE $where";
			$data = $this->db->query($sql);

			if(!empty($data)){
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
// Pinjaman END

	// Angsuran START

		public function get_angsuran_id($pinjam_id){
			$sql = $this->db->select('*')
						->from('tx_angsuran')
						->where('id_pinjaman',$pinjam_id)
						->where('is_delete',0)
						->get();

			if($sql->num_rows()>0){
				return $sql->row_array();
			}else{
				return null;
			}
		}

		public function get_angsuran_id_desc($pinjam_id){
			$sql = $this->db->select('*')
						->from('tx_angsuran')
						->where('id_pinjaman',$pinjam_id)
						->where('is_delete',0)
						->order_by('id_angsuran','desc')
						->get();

			if($sql->num_rows()>0){
				return $sql->row_array();
			}else{
				return null;
			}
		}

		public function get_angsuran_id_res($pinjam_id){
			$sql = $this->db->select('*')
						->from('tx_angsuran as a')
						->join('tm_user as u','a.insert_by=u.id_user','left')
						->where('id_pinjaman',$pinjam_id)
						->where('a.is_delete',0)
						->get();

			if($sql->num_rows()>0){
				return $sql->result();
			}else{
				return null;
			}
		}

		public function count_angsuran($pinjam_id){
			$sql = $this->db->select('count(id_angsuran) as count_angs')
						->from('tx_angsuran')
						->where('id_pinjaman',$pinjam_id)
						->where('is_delete',0)
						->get();

			if($sql->num_rows()>0){
				return $sql->row_array();
			}else{
				return null;
			}
		}

	// Angsuran END
	
	
	}

		