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
		
		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
	}

	public function index(){
		$this->load->model('Model_home');
		$var['penjualan'] = $this->Model_home->get_sum_penjualan();
		$var['stok'] = $this->Model_home->get_sum_stok();
		$var['pembelian'] = $this->Model_home->get_sum_pembelian();
		$var['uang'] = $this->Model_home->get_sum_tot_uang();
		$var['content'] = 'view-home';
		$var['js'] = 'js-home';
		$this->load->view('view-index',$var);
	}

	public function pembelian(){
		$var['content'] = 'view-home-pembelian';
		$var['js'] = 'js-home';
		$this->load->view('view-index',$var);
	}

	public function penjualan(){
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