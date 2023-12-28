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

		$var['periode'] = $bulan.' '.$tahun;
		$var['penjualan'] = $this->Model_home->get_penjualan($where);
		$var['penjualan_tertolak'] = $this->Model_home->get_penjualan_tertolak($where);
		
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
		$var['content'] = 'view-home-persedian';
		$var['js'] = 'js-home';
		$this->load->view('view-index',$var);
	}
}