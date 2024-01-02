<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	
	function __construct(){
		parent::__construct();
		$this->load->helper('tgl_indo_helper');
		$this->load->model('Model_home');

		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
	}

	public function index(){
		$this->load->model('Model_home');
		$datetime = $this->db->select("DATE_FORMAT(NOW(),'%m') as bulan,DATE_FORMAT(NOW(),'%Y') as tahun, NOW() AS tgl")->get()->row();
		$bulan = bulan($datetime->bulan);
		$tahun = $datetime->tahun;

		$tgl_p = $datetime->tahun.'-'.$datetime->bulan;
		$tgl1 = $tgl_p.'-01 00:00:00';
		$tgl2 = $tgl_p.'-31 23:59:59';
		$where = " AND insert_date between '$tgl1' AND '$tgl2'";

		$var['periode'] = $bulan.' '.$tahun;
		$var['penjualan'] = $this->Model_home->get_penjualan($where);
		$var['penjualan_tertolak'] = $this->Model_home->get_penjualan_tertolak($where);

		$tgl11 = $tgl_p.'-01 00:00:00';
		$tgl12 = $tgl_p.'-07 23:59:59';
		$where1 = " AND insert_date between '$tgl11' AND '$tgl12'";
		$var['penjualan_1'] = $this->Model_home->get_penjualan($where1);

		$tgl21 = $tgl_p.'-08 00:00:00';
		$tgl22 = $tgl_p.'-14 23:59:59';
		$where2 = " AND insert_date between '$tgl21' AND '$tgl22'";
		$var['penjualan_2'] = $this->Model_home->get_penjualan($where2);

		$tgl31 = $tgl_p.'-15 00:00:00';
		$tgl32 = $tgl_p.'-21 23:59:59';
		$where3 = " AND insert_date between '$tgl31' AND '$tgl32'";
		$var['penjualan_3'] = $this->Model_home->get_penjualan($where3);

		$tgl41 = $tgl_p.'-22 00:00:00';
		$tgl42 = $tgl_p.'-31 23:59:59';
		$where1 = " AND insert_date between '$tgl41' AND '$tgl42'";
		$var['penjualan_4'] = $this->Model_home->get_penjualan($where1);


		$var['content'] = 'view-home';
		$var['js'] = 'js-home';
		$this->load->view('view-index',$var);
	}

	public function pembelian(){
		$this->load->model('Model_home');
		$datetime = $this->db->select("DATE_FORMAT(NOW(),'%m') as bulan,DATE_FORMAT(NOW(),'%Y') as tahun, NOW() AS tgl")->get()->row();
		$bulan = bulan($datetime->bulan);
		$tahun = $datetime->tahun;

		$tgl_p = $datetime->tahun.'-'.$datetime->bulan;
		$tgl1 = $tgl_p.'-01 00:00:00';
		$tgl2 = $tgl_p.'-31 23:59:59';
		$where = " AND insert_date between '$tgl1' AND '$tgl2'";

		$var['pesan_aktif'] = $this->Model_home->get_data_pesan_aktif();
		$var['pesan_tempo'] = $this->Model_home->get_data_jatuh_tempo();
		$var['ren_tot'] = $this->Model_home->get_rencana_beli();
		$var['pes_akt'] = $this->Model_home->get_pesanan_aktif();
		$var['faktur'] = $this->Model_home->get_fakture();
		$var['beli'] = $this->Model_home->get_tot_beli($tgl1,$tgl2);
		$var['retur'] = $this->Model_home->get_retur($tgl1,$tgl2);
		
		$var['content'] = 'view-home-pembelian';
		$var['js'] = 'js-home';
		$this->load->view('view-index',$var);
	}

	public function penjualan(){
		$this->load->model('Model_home');
		$this->load->model('Model_laporan');
		$datetime = $this->db->select("DATE_FORMAT(NOW(),'%m') as bulan,DATE_FORMAT(NOW(),'%Y') as tahun, NOW() AS tgl")->get()->row();
		$bulan = bulan($datetime->bulan);
		$tahun = $datetime->tahun;

		$tgl_p = $datetime->tahun.'-'.$datetime->bulan;
		$tgl1 = $tgl_p.'-01 00:00:00';
		$tgl2 = $tgl_p.'-31 23:59:59';
		$where = " AND insert_date between '$tgl1' AND '$tgl2'";

		$var['periode'] = $bulan.' '.$tahun;
		// $var['penjualan'] = $this->Model_home->get_penjualan($where);

		$tgl_p = $datetime->bulan.'-'.$datetime->tahun;
		$tgl_awal = '01-'.$tgl_p;
		$tgl_akhir = '31'.$tgl_p;
		$m_kes = $this->Model_laporan->get_lap_margin_kasir($tgl1,$tgl2);
		$m_res = $this->Model_laporan->get_lap_margin_resep($tgl1,$tgl2);
		$var['margin'] = (int) $m_kes->tot_margin + (int) $m_res->tot_margin;

		$pen_dok = $this->Model_laporan->get_lap_pen_dok($tgl1,$tgl2);
		$pen_kas = $this->Model_laporan->get_lap_pen_kas($tgl1,$tgl2);
		$var['penjualan'] = (int) $pen_dok->tot_harga_jual + (int) $pen_kas->tot_harga_jual;
		$var['produk'] = $this->Model_home->get_produk_terlaris();
		
		$var['content'] = 'view-home-penjualan';
		$var['js'] = 'js-home';
		$this->load->view('view-index',$var);
	}

	public function persediaan(){
		$this->load->model('Model_home');
		$this->load->model('Model_laporan');
		$datetime = $this->db->select("DATE_FORMAT(DATE_ADD(NOW(), INTERVAL -1 MONTH),'%Y-%m') as bulan_kemarin,DATE_FORMAT(NOW(),'%m') as bulan,DATE_FORMAT(NOW(),'%Y') as tahun, NOW() AS tgl")
							->get()->row();
		$bulan = bulan($datetime->bulan);
		$tahun = $datetime->tahun;

		$tgl_p = $datetime->tahun.'-'.$datetime->bulan;
		$tgl1 = $tgl_p.'-01 00:00:00';
		$tgl2 = $tgl_p.'-31 23:59:59';
		$where = " AND insert_date between '$tgl1' AND '$tgl2'";

		$pen_dok = $this->Model_laporan->get_lap_pen_dok($tgl1,$tgl2);
		$pen_kas = $this->Model_laporan->get_lap_pen_kas($tgl1,$tgl2);
		$var['penjualan'] = (int) $pen_dok->tot_harga_jual + (int) $pen_kas->tot_harga_jual;
		$var['periode'] = $bulan.' '.$tahun;
		$var['pesediaan'] = $this->Model_laporan->get_lap_modal();
		$var['produk'] = $this->Model_home->get_data_produk();
		$tgl_a = '2000-01-01 00:00:00';
		$tgl_b = $datetime->bulan_kemarin.'-31 23:59:59';
		$var['persediaan_awal'] = $this->Model_home->get_persedian($tgl_a,$tgl_b);
		$var['persediaan_akhir'] = $this->Model_home->get_persedian($tgl_a,$tgl2);

		$tot_kadaluarsa = $this->Model_home->get_tot_kadaluarsa();
		$exp = [];
		$data = [];

		foreach ($tot_kadaluarsa as $key => $val) {
			$date_exp = strtotime($val->exp_date);
			$date_now =  strtotime($val->tgl_now);
			
			if($date_exp <= $date_now){
				array_push($exp,1);
				array_push($data,(object)[
					'nama_produk' => $val->nama_produk,
					'jumlah_stok' => $val->jumlah_stok,
					'exp_date' => $val->exp_date
				]);
			}
		}
		$tot_data = array_sum($exp);
		
		$var['exp_tot'] = $tot_data;
		$var['exp_data'] = $data;

		$tot_kadaluarsa_3mn = $this->Model_home->get_tot_kadaluarsa_3mn();
		$exp_3mn = [];
		$data_3mn = [];

		foreach ($tot_kadaluarsa_3mn as $key => $val) {
			$date_exp = strtotime($val->exp_date);
			$date_now =  strtotime($val->tgl_3m);
			$date_to = strtotime($val->tgl_now);
			
			if($date_to <= $date_exp && $date_exp <= $date_now){
				array_push($exp_3mn,1);
				array_push($data_3mn,(object)[
					'nama_produk' => $val->nama_produk,
					'jumlah_stok' => $val->jumlah_stok,
					'exp_date' => $val->exp_date
				]);
			}
		}
		
		$tot_data_3mn = array_sum($exp_3mn);
		$var['exp_tot_3mn'] = $tot_data_3mn;
		$var['exp_data_3mn'] = $data_3mn;

		$var['content'] = 'view-home-persedian';
		$var['js'] = 'js-home';
		$this->load->view('view-index',$var);
	}

	
}