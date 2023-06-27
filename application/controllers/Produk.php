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
									 ->from('tm_satuan')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get();
		if(!empty($sql_jenis_produk) || !empty($sql_rak) || !empty($sql_satuan)){
			echo json_encode(array(
									'status'=>1,
									'msg'=>'data is find',
									'jenis_produk'=>$sql_jenis_produk->result(),
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
									 ->from('tm_satuan')
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

	public function save_produk_name(){
		$data = $this->input->post();
		$user = $this->session->userdata('id_user');
		$time = date('Y-m-d H:m');
		$param = 0;

		if($data['id_produk']==""){
			$data['insert_by'] = $user;
			$data['insert_date'] = $time;
			$sql = $this->db->insert('tx_produk',$data);
			if($sql){
				$param += 1;
			}
		}else{
			$data['update_by'] = $user;
			$data['update_date'] = $time;
			$sql = $this->db->where('id_produk',$data)->update('tx_produk',$data);
			if($sql){
				$param += 1;
			}
		}

		$id_param = $this->db->select('id_produk,s.nama_satuan')
							 ->from('tx_produk as p')
							 ->join('tm_satuan as s','p.satuan_utama = s.id_satuan','left')
							 ->where('p.is_delete',0)
							 ->where('p.insert_by',$user)
							 ->order_by('p.id_produk',"desc")
							 ->get();
							 $param_id = $id_param->row();
		if($param >= 1){
			echo json_encode(array('status'=>1,'msg'=>'Success Save Data','param'=>$param_id));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Filed Save Data','param'=>null));
		}
	}

	public function hapus_produk(){
		$data = $this->input->post();
		$user = $this->session->userdata('id_user');
		$time = date('Y-m-d H:m');
		$data['is_delete'] = 1;

		if(!empty($data['id_produk'])){
			$sql = $this->db->where('id_produk',$data['id_produk'])->update('tx_produk',$data);
			if($sql){
				echo json_encode(array('status'=>1,'msg'=>'Delete Data Success'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Delete Data Filed'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Data | Code 2312'));
		}
	}

	public function save_satuan(){
		$no = 0;
		$user = $this->session->userdata('id_user');
		$sql = "SELECT NOW() as jam";
		$time = $this->db->query($sql)->row();
		$id_satuan = $_POST['id_satuan'];
		$jumlah_produk = $_POST['jumlah_produk'];
		$jumlah_produk_p = $_POST['jumlah_produk_p'];
		$data_in = $this->input->post();
		$arr_fix =[];
		$count = 0;
		  foreach ($jumlah_produk as $key => $value) {
			'"'.array_push($arr_fix, '("'.$_POST['id_produk'].'"',
				'"'.$id_satuan[$count].'"',
				'"'.$jumlah_produk[$count].'"',
				'"'.$jumlah_produk_p[$count].'"',
				'"'.$user.'"',
				'"'.$time->jam.'")',
			);
			$count++;
		 }
		 
		 $data_fix = implode(",",$arr_fix);
		 
		 $str_sql = "INSERT INTO `tx_produk_detail` (`id_produk`, `id_satuan`, `jumlah_produk`, `jumlah_produk_p`, `insert_by`, `insert_date`) VALUES
		 			$data_fix";
					
		 $sql = $this->db->query($str_sql);
			if ($sql) {
				$no++;
			}
		 	$data_param = $this->db->select('id_produk_detail')
						->from('tx_produk_detail')
						->where('id_produk',$_POST['id_produk'])
						->get();
			$param = $data_param->result();

		 if($no > 0){
			echo json_encode(array('status'=> 1,'msg'=>'Save Data Satuan Berhasil','param'=>$param));
		 }else{
			echo json_encode(array('status'=> 1,'msg'=>'Save Data Satuan Berhasil','param'=>0));
		 }

		
	}
}