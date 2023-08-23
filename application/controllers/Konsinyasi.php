<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Konsinyasi extends CI_Controller {

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
		$this->load->model('model_pembelian');

		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
		
	}

	// start retrun
	public function data_konsinyasi(){
		$var['content'] = 'view-data_konsinyasi';
		$var['js'] = 'js-data_konsinyasi';
		$this->load->view('view-index',$var);
	}


	public function konsinyasi_buat(){
		$var['content'] = 'view-buat-konsinyasi';
		$var['js'] = 'js-buat-konsinyasi';
		$var['id_konsinyasi'] = "";
		$this->load->view('view-index',$var);
	}

	public function get_reture_select(){

		$sql_spl = "SELECT nama_supplier,id_supplier FROM `tm_supplier` WHERE is_delete = 0 ORDER BY nama_supplier asc";
		$data_spl = $this->db->query($sql_spl)->result();
		
		$sql = "SELECT nama_produk,id_produk FROM `tx_produk` WHERE is_delete = 0 ORDER BY nama_produk asc";
		$data = $this->db->query($sql)->result();

		$sql_jp = "SELECT nama_pembayaran,id_pembayaran FROM `tm_pembayaran`";
		$data_jp = $this->db->query($sql_jp)->result();

		$sql_st = "SELECT nama_satuan,id_satuan FROM `tm_satuan` where is_delete = 0";
		$data_st = $this->db->query($sql_st)->result();

		$sql_user = "SELECT nama,id_user FROM `tm_user` where is_delete = 0";
		$data_user = $this->db->query($sql_user)->result();
		
		$sql_gd = "SELECT nama_wilayah,id_wilayah FROM `tm_wilayah` where is_delete = 0";
		$data_gd = $this->db->query($sql_gd)->result();

		$sql_pem = "SELECT nama_pembayaran,id_pembayaran FROM `tm_pembayaran`";
		$data_pem = $this->db->query($sql_pem)->result();

		$sql_sp = "SELECT no_sp 
					FROM `tx_beli_pesan`
					WHERE is_delete = 0
					GROUP BY no_sp";
		$data_sp = $this->db->query($sql_sp)->result();
		
		if(!empty($data)){
			echo json_encode(array('status'=>1,
								'msg'=>'Data Find',
								'produk'=>$data,
								'jenis_pembayaran'=>$data_jp,
								'satuan'=>$data_st,
								'user' => $data_user,
								'gudang'=>$data_gd,
								'no_sp'=>$data_sp,
								'supplier'=>$data_spl,
								'pembayaran'=>$data_pem
							));
		}else{
			echo json_encode(array('status'=>0,
									'msg'=>'Data Find',
									'produk'=>null,
									'jenis_pembayaran'=>null,
									'satuan'=>null,
									'user' => null,
									'gudang'=>null,
									'no_sp'=>null,
									'supplier'=>null,
									'pembayaran'=>null
								));
		}
	}

	public function get_ksu(){
		$id_pro = $_POST['id_produk'];
		$data = $this->db->select('sku_kode_produk as kode')
						 ->from('tx_produk')
						 ->where('id_produk',$id_pro)
						 ->get();
			if(!empty($data)){
				echo json_encode(array('status'=>1,'msg'=>'Data is find','result'=>$data->row()));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data not find','result'=>null));
			}

	}

	public function save_produk_retur(){
		$data = $this->input->post();
		$id = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();
		$tgl_exp = $_POST['tgl_exp'];
		$ext = 0;

		if($_POST['id_retur_p']!==""){
			unset($data['id_retur_p']);
			$data['id_retur'] = $_POST['id_retur_p'];
		}

		if($_POST['id_detail_retur']==""){
			unset($data['tgl_exp']);
			$data['insert_by'] = $id;
			$data['insert_date'] = $datetime->time;
			$data['is_selesai'] = 1;
			$data['tgl_exp'] = date('Y-m-d',strtotime($tgl_exp));
			$sql = $this->db->insert('tx_retur_detail',$data);
			if($sql){
				$ext += 1;
			}

		}else{
			unset($data['id_detail_retur']);
			$data['update_by'] = $id;
			$sql = $this->db->where('id_detail_retur',$_POST['id_detail_retur'])->update('tx_retur_detail',$data);
			if($sql){
				$ext += 1;
			}
		}
		if($ext > 0){
			echo json_encode(array('status'=>1,'msg'=>'Data Berhasil Disimpan'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Gagal Disimpan'));
		}
	}

	public function load_detail_retur(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
		// $searchValue = $_POST['text'];
		$where ='rd.is_delete = 0';
		
		
		if($_POST['id']==""){
			$where .= "  AND rd.is_selesai = 1 ";
		}else{
			$id = $_POST['id'];
			$where .= "  AND rd.id_retur =  $id";
		}
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
			 					OR rd.kode_ksu like '%" . $searchValue . "%'
								 OR s.nama_satuan like '%" . $searchValue . "%'
								 OR rd.id_retur like '%" . $searchValue . "%'				
			) ";
		}

	
		$where .=  $searchQuery ;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM tx_retur_detail
		where is_delete = 0 and is_selesai = 1";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_retur_detail` as rd
		LEFT JOIN tx_produk as p ON rd.id_produk = p.id_produk
		LEFT JOIN tm_satuan as s ON rd.id_satuan = s.id_satuan
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT rd.id_detail_retur,p.id_produk,s.id_satuan,p.nama_produk,rd.kode_ksu,rd.tgl_exp,rd.harga,rd.jumlah_produk_beli,rd.jumlah_retur,rd.keterangan
		FROM `tx_retur_detail` as rd
		LEFT JOIN tx_produk as p ON rd.id_produk = p.id_produk
		LEFT JOIN tm_satuan as s ON rd.id_satuan = s.id_satuan
		WHERE $where
		order by rd.id_detail_retur " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
		$data = $this->db->query($sql)->result();
	
		// Response
		$output = array(
			"draw" => intval($draw),
			"iTotalRecords" => $totalRecords,
			"iTotalDisplayRecords" => $totalRecordsFilter,
			"aaData" => $data
		); 
		echo json_encode($output);
	}

	public function hapus_detail_retur(){
		$id = $_POST['id'];
		$id = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();
			$data = array(
			'delete_by' => $id,
			'delete_date' => $datetime->time,
			'is_delete'=>1
			);

			$ext = $this->db->where('id_detail_retur',$_POST['id'])
							->update('tx_retur_detail', $data);
			if($ext){
				echo json_encode(array('status'=>1,'msg'=>'Data Berhasil DiHapus'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Gagal DiHapus'));
			}
	}

	public function get_data_detail_retur(){
		$id = $_POST['id'];
		$data = $this->db->select('*')
						 ->from('tx_retur_detail')
						 ->where('id_detail_retur',$id)
						 ->get();
		if($data->num_rows()>0){
			echo json_encode(array('status'=>1,'msg'=>'Data Is FInd','result'=>$data->row()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Not FInd','result'=>null));
		}
	}

	public function save_retur(){
		$ext = 0;
		$data = $this->input->post();
		$id = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();
		unset($data['tgl_retur']);
		unset($data['tgl_pesan']);
		$data['tgl_retur'] = date('Y-m-d', strtotime($_POST['tgl_retur']));
		$data['tgl_pesan'] = date('Y-m-d', strtotime($_POST['tgl_pesan']));
		if($data['id_retur']==""){
			if($data['no_faktur'] ==""){
				unset($data['no_faktur']);
				$data['no_faktur'] = $this->model_pembelian->get_no_faktur($id);
			}

			$data['insert_by'] = $id;
			$data['insert_date'] = $datetime->time;
			$this->db->insert('tx_retur', $data);
			$insert_id = $this->db->insert_id();
			$up_data = array(
								'is_selesai'=>2,
								'id_retur'=> $insert_id
							);

			$ext = $this->db->where('is_delete',0)
							->where('is_selesai',1)
							->where('insert_by',$id)
							->update('tx_retur_detail',$up_data);

			if($ext){
				$ext += 0;
			}
		}else{
			$data['update_by'] = $id;
			$data['update_date'] = $datetime->time;
			$ext = $this->db->where('id_retur',$data['id_retur'])
							->update('tx_retur', $data);
			if($ext){
				$ext += 0;
			}
		}

		if($ext > 0){
			echo json_encode(array('status'=>1,'msg'=>'Data Berhasil Disimpan'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Gagal Disimpan'));
		}
	}

	public function load_retur(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue1 = $_POST['search']['value'];
		$searchValue = $_POST['text'];
		
		$where = " r.is_delete = 0 AND rd.is_selesai = 2 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
			 					OR r.no_faktur like '%" . $searchValue . "%'			
			) ";
		}

		if($_POST['tgl1'] !='' && $_POST['tgl2'] !=''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(r.tgl_retur,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}else{
			$where .= "AND DATE_FORMAT(r.tgl_retur,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
		}

		
	
		$where .=  $searchQuery ;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_retur` 
		where is_delete = 0
		GROUP BY id_retur";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_retur` as r
		LEFT JOIN tx_retur_detail as rd ON r.id_retur = rd.id_retur
		LEFT JOIN tx_produk  as p ON rd.id_produk = p.id_produk
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT 
		r.id_retur,
		r.no_faktur,
		r.tgl_retur,
		REPLACE(GROUP_CONCAT(p.nama_produk),',','<br>') as produk,
		REPLACE(GROUP_CONCAT(rd.jumlah_retur),',','<br>') as jumlah_retur_p
		FROM `tx_retur` as r
		LEFT JOIN tx_retur_detail as rd ON r.id_retur = rd.id_retur
		LEFT JOIN tx_produk  as p ON rd.id_produk = p.id_produk
		WHERE $where
		GROUP BY r.id_retur
		order by r.id_retur " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
		$data = $this->db->query($sql)->result();
	
		// Response
		$output = array(
			"draw" => intval($draw),
			"iTotalRecords" => $totalRecords,
			"iTotalDisplayRecords" => $totalRecordsFilter,
			"aaData" => $data
		); 
		echo json_encode($output);
	}

	public function edit_retur(){
		$id_r = $this->uri->segment('3');
		$var['content'] = 'view-buat-retur';
		$var['js'] = 'js-buat-retur';
		$var['id_retur'] = $id_r;
		$this->load->view('view-index',$var);
	}

	public function get_data_retur(){
		$id = $_POST['id'];

		$data = $this->db->select('*')
						 ->from('tx_retur')
						 ->where('id_retur',$id)
						 ->get();
		if($data->num_rows()>0){
			echo json_encode(array('status'=>1,'msg'=>'Data Is FInd','result'=>$data->row()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Not FInd','result'=>null));
		}
	}
	// end retrun


}