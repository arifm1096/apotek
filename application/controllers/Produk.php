<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Produk extends CI_Controller {

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
		$var['content'] = 'view-produk';
		$var['js'] = 'js-produk';
		$this->load->view('view-index',$var);
	}

	public function tambah_data(){
		$var['content'] = 'view-produk-add';
		$var['js'] = 'js-produk-add';
		$this->load->view('view-index',$var);
	}

	public function get_data_master(){
		$sql_jenis_produk = $this->db->select('id_jenis_produk,nama_jenis_produk')
									 ->from('tm_jenis_produk')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get();
		$sql_rak = $this->db->select('id_rak,nama_rak')
									 ->from('tm_rak')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get();
		$sql_satuan = $this->db->select('id_satuan,nama_satuan')
									 ->from('tm_jenis_produk')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get();
		if(!empty($sql_jenis_produk) || !empty($sql_rak) || !empty($sql_satuan)){
			echo json_encode(array(
									'status'=>1,
									'msg'=>'data is find',
									'jeins_produk'=>$sql_jenis_produk->result(),
									'rak'=>$sql_rak->result(),
									'satuan'=>$sql_satuan->result()
								)
							);
		}else{
			echo json_encode(array(
									'status'=>0,
									'msg'=>'data not found',
									'jeins_produk'=>null,
									'rak'=>null,
									'satuan'=>null
								)
							);
		}
	}

	public function get_master_satuan(){
		$sql_satuan = $this->db->select('id_satuan,nama_satuan')
									 ->from('tm_jenis_produk')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get();
		if( !empty($sql_satuan)){
			echo json_encode(array(
									'status'=>1,
									'msg'=>'data is find',
									'satuan'=>$sql_satuan->result()
								)
							);
		}else{
			echo json_encode(array(
									'status'=>0,
									'msg'=>'data not found',
									'satuan'=>null
								)
							);
		}
	}
}