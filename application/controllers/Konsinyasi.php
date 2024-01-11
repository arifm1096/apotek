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
		$this->load->model('model_konsinyasi');

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
		$var['id_konsinyasi'] = "0";
		$var['nama_menu'] = "Konsinyasi Masuk";
		$this->load->view('view-index',$var);
	}

	public function get_konsinyasi_select(){

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

		$sql_akun = "SELECT nama_akun,kd_akun,id_akun 
					FROM tm_akun";
		$data_akun = $this->db->query($sql_akun)->result();
		
		if(!empty($data)){
			echo json_encode(array('status'=>1,
								'msg'=>'Data Find',
								'produk'=>$data,
								'jenis_pembayaran'=>$data_jp,
								'satuan'=>$data_st,
								'user' => $data_user,
								'gudang'=>$data_gd,
								'akun'=>$data_akun,
								'supplier'=>$data_spl
							));
		}else{
			echo json_encode(array('status'=>0,
									'msg'=>'Data Find',
									'produk'=>null,
									'jenis_pembayaran'=>null,
									'satuan'=>null,
									'user' => null,
									'gudang'=>null,
									'kas'=>null,
									'supplier'=>null
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

	public function save_produk_konsinyasi(){
		$data = $this->input->post();
		$id = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();
		$tgl_exp = $_POST['tgl_exp'];
		$ext = 0;

		if($_POST['id_konsinyasi_p']!==""){
			unset($data['id_konsinyasi_p']);
			$data['id_konsinyasi'] = $_POST['id_konsinyasi_p'];
		}
		unset($data['id_konsinyasi_p']);
		if($_POST['id_konsinyasi_detail']==""){
			unset($data['tgl_exp']);
			$data['insert_by'] = $id;
			$data['insert_date'] = $datetime->time;
			$data['is_selesai'] = 1;
			$data['tgl_exp'] = date('Y-m-d',strtotime($tgl_exp));
			$sql = $this->db->insert('tx_konsinyasi_detail',$data);
			if($sql){
				$ext += 1;
			}

		}else{
			unset($data['id_konsinyasi_detail']);
			$data['update_by'] = $id;
			$sql = $this->db->where('id_konsinyasi_detail',$_POST['id_konsinyasi_detail'])->update('tx_konsinyasi_detail',$data);
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

	public function load_detail_konsinyasi(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
		// $searchValue = $_POST['text'];
		$where ='kd.is_delete = 0 ';
		
		
		if($_POST['id']==""){
			$where .= "  AND kd.is_selesai = 1 ";
		}else{
			$id = $_POST['id'];
			$where .= "  AND kd.id_konsinyasi =  $id";
		}
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
			 					OR kd.kode_ksu like '%" . $searchValue . "%'
								 OR s.nama_satuan like '%" . $searchValue . "%'
								 OR kd.id_konsinyasi like '%" . $searchValue . "%'				
			) ";
		}

	
		$where .=  $searchQuery ;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM tx_konsinyasi_detail
		where is_delete = 0 and is_selesai = 1";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_konsinyasi_detail` as kd
		LEFT JOIN tx_produk as p ON kd.id_produk = p.id_produk
		LEFT JOIN tm_satuan as s ON kd.id_satuan = s.id_satuan
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT kd.id_konsinyasi_detail,p.id_produk,s.id_satuan,p.nama_produk,kd.kode_ksu,kd.tgl_exp,
		kd.harga_beli,kd.harga_pokok,kd.jumlah_konsinyasi,s.nama_satuan,kd.ppn
		FROM `tx_konsinyasi_detail` as kd
		LEFT JOIN tx_produk as p ON kd.id_produk = p.id_produk
		LEFT JOIN tm_satuan as s ON kd.id_satuan = s.id_satuan
		WHERE $where
		order by kd.id_konsinyasi_detail " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function hapus_detail_konsinyasi(){
		$id = $_POST['id'];
		$id = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();
			$data = array(
			'delete_by' => $id,
			'delete_date' => $datetime->time,
			'is_delete'=>1
			);

			$ext = $this->db->where('id_konsinyasi_detail',$_POST['id'])
							->update('tx_konsinyasi_detail', $data);
			if($ext){
				echo json_encode(array('status'=>1,'msg'=>'Data Berhasil DiHapus'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Gagal DiHapus'));
			}
	}

	public function get_data_detail_konsinyasi(){
		$id = $_POST['id'];
		$data = $this->db->select('*')
						 ->from('tx_konsinyasi_detail')
						 ->where('id_konsinyasi_detail',$id)
						 ->get();
		if($data->num_rows()>0){
			echo json_encode(array('status'=>1,'msg'=>'Data Is FInd','result'=>$data->row()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Not FInd','result'=>null));
		}
	}

	public function hapus_konsinyasi(){
		$id = $_POST['id'];
		$id = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();
			$data = array(
			'delete_by' => $id,
			'delete_date' => $datetime->time,
			'is_delete'=>1
			);

			$ext = $this->db->where('id_konsinyasi',$_POST['id'])
							->update('tx_konsinyasi_detail', $data);

			$ext = $this->db->where('id_konsinyasi',$_POST['id'])
							->update('tx_konsinyasi', $data);

			if($ext){
				echo json_encode(array('status'=>1,'msg'=>'Data Berhasil DiHapus'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Gagal DiHapus'));
			}
	}

	public function save_konsinyasi(){
		$ext = 0;
		$data = $this->input->post();
		$id = $this->session->userdata('id_user');
		$id_gudang = $this->session->userdata('gudang');
		$datetime = $this->db->select('now() as time')->get()->row();
		unset($data['tgl_faktur']);
		unset($data['tgl_terima']);
		unset($data['jatuh_tempo']);
		$data['tgl_faktur'] = date('Y-m-d', strtotime($_POST['tgl_faktur']));
		$data['tgl_terima'] = date('Y-m-d', strtotime($_POST['tgl_terima']));
		$data['jatuh_tempo'] = date('Y-m-d', strtotime($_POST['jatuh_tempo']));

		if($data['id_konsinyasi']=="0"){
			if($data['no_faktur'] ==""){
				unset($data['no_faktur']);
				$data['no_faktur'] = $this->model_konsinyasi->get_no_faktur($id);
			}

			$data['insert_by'] = $id;
			$data['insert_date'] = $datetime->time;
			unset($data['id_konsinyasi']);
			$this->db->insert('tx_konsinyasi', $data);
			$insert_id = $this->db->insert_id();
			// $insert_id = "14";
			$up_data = array(
								'is_selesai'=>2,
								'id_konsinyasi'=> $insert_id
							);

			$ext = $this->db->where('is_delete',0)
							->where('is_selesai',1)
							->where('insert_by',$id)
							->update('tx_konsinyasi_detail',$up_data);

			$sql_produk = $this->db->select('id_produk')
								->from('tx_konsinyasi_detail')
								->where('id_konsinyasi',$insert_id)
								->where('is_selesai',2)
								->where('is_delete',0)
								->get()
								->result();
			$in_id_produk = " (";

			foreach ($sql_produk as $key => $val) {
				$in_id_produk .= "'$val->id_produk',";
			}

			$in_fix_id = rtrim($in_id_produk, ",").")";

			$sql_qty = "SELECT kd.id_produk, kd.jumlah_konsinyasi, if(ps.jumlah_stok IS NULL,0,ps.jumlah_stok) as jumlah_stok, (kd.jumlah_konsinyasi + if(ps.jumlah_stok IS NULL,0,ps.jumlah_stok)) as tot_qty,
						k.id_supplier,kd.id_satuan,kd.tgl_exp
						FROM `tx_konsinyasi_detail` as kd
						LEFT JOIN tx_konsinyasi as k on kd.id_konsinyasi = k.id_konsinyasi
						LEFT JOIN tx_produk_stok as ps ON kd.id_produk = ps.id_produk
						WHERE kd.id_konsinyasi = $insert_id AND is_selesai = 2 AND kd.is_delete = 0 AND ps.id_produk IN $in_fix_id";
			$data_qty = $this->db->query($sql_qty)->result();

			$up_id_produk = " (";
			foreach ($data_qty as $key => $vall) {
				$sql_up = "UPDATE `tx_produk_stok` SET jumlah_stok ='$vall->tot_qty' WHERE id_produk = '$vall->id_produk' AND id_gudang = $id_gudang";
				$up_qty = $this->db->query($sql_up);

				$sql_in_detail = "INSERT INTO `tx_produk_stok_detail` (id_produk,id_gudang,id_supplier,id_status_stok,jumlah_stok,insert_by,insert_date) VALUE
									('$vall->id_produk','$id_gudang','$vall->id_supplier','5','$vall->jumlah_konsinyasi','$id','$datetime->time')";
				$in_detail = $this->db->query($sql_in_detail);

				$up_id_produk .= "'$val->id_produk',";
			}

			$up_praram = rtrim($up_id_produk, ",").")";
			if($up_praram == " ()"){
				$up_fix_id = "('')";
			}else{
				$up_fix_id = $up_praram;
			}


			$sql_qty_in = "SELECT kd.id_produk, kd.jumlah_konsinyasi, if(ps.jumlah_stok IS NULL,0,ps.jumlah_stok) as jumlah_stok, (kd.jumlah_konsinyasi + if(ps.jumlah_stok IS NULL,0,ps.jumlah_stok)) as tot_qty,
						k.id_supplier,kd.id_satuan,kd.tgl_exp
						FROM `tx_konsinyasi_detail` as kd
						LEFT JOIN tx_konsinyasi as k on kd.id_konsinyasi = k.id_konsinyasi
						LEFT JOIN tx_produk_stok as ps ON kd.id_produk = ps.id_produk
						WHERE kd.id_konsinyasi = $insert_id AND is_selesai = 2 AND kd.is_delete = 0 AND kd.id_produk NOT IN $up_fix_id";
			$data_qty_in = $this->db->query($sql_qty_in)->result();

			foreach ($data_qty_in as $key => $valll) {
				$sql_in = "INSERT `tx_produk_stok`(id_produk,id_gudang,id_supplier,jumlah_stok,exp_date,insert_by,insert_date) VALUES
							('$valll->id_produk','$id_gudang','$valll->id_supplier','$valll->tot_qty','$valll->tgl_exp','$id','$datetime->time')";
				$up_qty = $this->db->query($sql_in);

				$sql_in_detail = "INSERT INTO `tx_produk_stok_detail` (id_produk,id_gudang,id_supplier,id_status_stok,jumlah_stok,insert_by,insert_date) VALUE
									('$valll->id_produk','$id_gudang','$valll->id_supplier','5','$valll->jumlah_konsinyasi','$id','$datetime->time')";
				$in_detail = $this->db->query($sql_in_detail);

				$up_id_produk .= "$val->id_produk,";
			}

			if($ext){
				$ext += 0;
			}
		}else{
			$data['update_by'] = $id;
			$data['update_date'] = $datetime->time;
			$ext = $this->db->where('id_konsinyasi',$data['id_konsinyasi'])
							->update('tx_konsinyasi', $data);
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

	public function load_konsinyasi(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue1 = $_POST['search']['value'];
		$searchValue = $_POST['text'];
		
		$where = " k.is_delete = 0 AND kd.is_selesai = 2 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
			 					OR k.no_faktur like '%" . $searchValue . "%'			
			) ";
		}

		if($_POST['tgl1'] !='' && $_POST['tgl2'] !=''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(k.tgl_terima,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}

		
	
		$where .=  $searchQuery ;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_konsinyasi` 
		where is_delete = 0
		GROUP BY id_konsinyasi";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_konsinyasi` as k
		LEFT JOIN tx_konsinyasi_detail as kd ON k.id_konsinyasi = kd.id_konsinyasi
		LEFT JOIN tx_produk  as p ON kd.id_produk = p.id_produk
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT 
		k.id_konsinyasi,
		k.no_faktur,
		k.tgl_terima,
		REPLACE(GROUP_CONCAT(p.nama_produk),',','<br>') as produk,
		REPLACE(GROUP_CONCAT(kd.jumlah_konsinyasi),',','<br>') as jumlah_konsinyasi_p
		FROM `tx_konsinyasi` as k
		LEFT JOIN tx_konsinyasi_detail as kd ON k.id_konsinyasi = kd.id_konsinyasi
		LEFT JOIN tx_produk  as p ON kd.id_produk = p.id_produk
		WHERE $where
		GROUP BY k.id_konsinyasi
		order by k.id_konsinyasi " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function edit_konsinyasi(){
		$id_r = $this->uri->segment('3');
		$var['content'] = 'view-buat-konsinyasi';
		$var['js'] = 'js-buat-konsinyasi';
		$var['id_konsinyasi'] = $id_r;
		$var['nama_menu'] = "Detail Konsinyasi";
		$this->load->view('view-index',$var);
	}

	public function get_data_konsinyasi(){
		$id = $_POST['id'];

		$data = $this->db->select('*')
						 ->from('tx_konsinyasi')
						 ->where('id_konsinyasi',$id)
						 ->get();
		if($data->num_rows()>0){
			echo json_encode(array('status'=>1,'msg'=>'Data Is FInd','result'=>$data->row()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Not FInd','result'=>null));
		}
	}

	public function export_konsinyasi(){
		
	}
	// end retrun

	public function status_konsiyasi(){
		$var['content'] = 'view-status_konsinyasi';
		$var['js'] = 'js-status_konsinyasi';
		$this->load->view('view-index',$var);
	}

	public function load_status_konsinyasi(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue1 = $_POST['search']['value'];
		$searchValue = $_POST['text'];
		
		$where = " k.is_delete = 0 AND kd.is_selesai = 2 AND kd.status = 0 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
			 					OR k.no_faktur like '%" . $searchValue . "%'			
			) ";
		}

		if($_POST['tgl1'] !='' && $_POST['tgl2'] !=''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(k.tgl_terima,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}

		
	
		$where .=  $searchQuery ;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_konsinyasi` 
		where is_delete = 0
		GROUP BY id_konsinyasi";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_konsinyasi` as k
		LEFT JOIN tx_konsinyasi_detail as kd ON k.id_konsinyasi = kd.id_konsinyasi
		LEFT JOIN tx_produk  as p ON kd.id_produk = p.id_produk
		LEFT JOIN tm_supplier as s ON k.id_supplier = s.id_supplier
		WHERE $where
		GROUP BY k.id_konsinyasi";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT 
		k.id_konsinyasi,
		k.no_faktur,
		k.tgl_terima,
		s.nama_supplier,
		REPLACE(GROUP_CONCAT(p.nama_produk),',','<br>') as produk,
		REPLACE(GROUP_CONCAT(kd.jumlah_konsinyasi),',','<br>') as jumlah_konsinyasi_p,
		sum(kd.harga_pokok) as nom_harga_pokok
		FROM `tx_konsinyasi` as k
		LEFT JOIN tx_konsinyasi_detail as kd ON k.id_konsinyasi = kd.id_konsinyasi
		LEFT JOIN tx_produk  as p ON kd.id_produk = p.id_produk
		LEFT JOIN tm_supplier as s ON k.id_supplier = s.id_supplier
		WHERE $where
		GROUP BY k.id_konsinyasi
		order by k.id_konsinyasi " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function get_data_konsiyasi(){
		$id_konsiyasi = $this->input->post('id_konsinyasi');

		$sql_kon_detail ="SELECT p.nama_produk,kd.tgl_exp,kd.jumlah_konsinyasi,harga_pokok,kd.id_konsinyasi_detail,
						kd.id_konsinyasi,kd.id_konsinyasi_detail,ps.jumlah_stok
						FROM `tx_konsinyasi_detail` as kd
						LEFT JOIN tx_produk as p ON kd.id_produk = p.id_produk
						LEFT JOIN tx_produk_stok as ps ON kd.id_produk = ps.id_produk
						WHERE kd.status = 0 AND kd.id_konsinyasi = $id_konsiyasi";
		$data_kon_detail = $this->db->query($sql_kon_detail)->result();

		$sql_kon = "SELECT k.no_faktur,s.nama_supplier,k.tgl_terima,k.jatuh_tempo
		FROM `tx_konsinyasi` as k
		LEFT JOIN tm_supplier as s ON k.id_supplier = s.id_supplier
		WHERE k.id_konsinyasi = $id_konsiyasi";
		$data_kon = $this->db->query($sql_kon)->row();

		$data_detail ="";
		$no = 1;
			if(!empty($data_kon_detail)){
				foreach ($data_kon_detail as $key => $val) {
				$data_detail .="<tr><td>".$no++."</td>".
					"<td>".$val->nama_produk."</td>".
					"<td>".date('d-m-Y', strtotime($val->tgl_exp))."</td>".
					"<td>".$val->jumlah_stok."</td>".
					"<td>".number_format($val->harga_pokok,0,',','.')."</td>".
					"<td> <button type='button' class='btn btn-outline-danger btn-sm ml-1' onclick='retur($val->id_konsinyasi_detail,$val->id_konsinyasi)'>RETURE</i></button></td></tr>";
				}
			}
			
		
		if(!empty($data_kon_detail) || !empty($data_kon)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','detail_konsiyasi'=>$data_detail,'konsinyasi'=>$data_kon));
		}else{
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','detail_konsiyasi'=>null,'konsiyasi'=>null));
		}

	}

	public function retur_konsiyasi(){
		$id_detail = $this->input->post('id');
		$tgl_retur = date('Y-m-d', strtotime($_POST['tgl_retur']));
		$id = $this->session->userdata('id_user');
		$id_gudang = $this->session->userdata('gudang');
		$datetime = $this->db->select('now() as time')->get()->row();

			$sql_qty = "SELECT kd.id_produk, kd.jumlah_konsinyasi, if(ps.jumlah_stok IS NULL,0,ps.jumlah_stok) as jumlah_stok, 
						(kd.jumlah_konsinyasi + if(ps.jumlah_stok IS NULL,0,ps.jumlah_stok)) as tot_qty,
						(if(ps.jumlah_stok IS NULL,0,ps.jumlah_stok) - if(ps.jumlah_stok IS NULL,0,ps.jumlah_stok)) as sisa,
						k.id_supplier,kd.id_satuan,kd.tgl_exp
						FROM `tx_konsinyasi_detail` as kd
						LEFT JOIN tx_konsinyasi as k on kd.id_konsinyasi = k.id_konsinyasi
						LEFT JOIN tx_produk_stok as ps ON kd.id_produk = ps.id_produk
						WHERE is_selesai = 2 AND kd.is_delete = 0 AND kd.`status` = 0 AND kd.id_konsinyasi_detail = $id_detail";
			$data_qty = $this->db->query($sql_qty)->result();

			
			foreach ($data_qty as $key => $vall) {
				$sql_up = "UPDATE `tx_produk_stok` SET jumlah_stok ='$vall->sisa' WHERE id_produk = '$vall->id_produk' AND id_gudang = $id_gudang";
				$up_qty = $this->db->query($sql_up);

				$sql_in_detail = "INSERT INTO `tx_produk_stok_detail` (id_produk,id_gudang,id_supplier,id_status_stok,jumlah_stok,insert_by,insert_date) VALUE
									('$vall->id_produk','$id_gudang','$vall->id_supplier','6','$vall->jumlah_stok','$id','$datetime->time')";
				$in_detail = $this->db->query($sql_in_detail);
			}

			$sql_up = "UPDATE tx_konsinyasi_detail SET status = 2, tgl_retur = '$tgl_retur', update_by = '$id', update_date= '$datetime->time'
			WHERE is_selesai = 2 AND is_delete = 0 AND `status` = 0 AND id_konsinyasi_detail = $id_detail";

			$ext_up = $this->db->query($sql_up);

			if($ext_up){
				echo json_encode(array('status'=>1,'msg'=>'Produk Success Diretur'));
			}else{
				echo json_encode(array('status'=>1,'msg'=>'Produk Gagal Diretur'));
			}

	}

	public function get_data_konsinyasi_det(){
		$id = $_POST['id_konsinyasi'];
		$sql_det = "SELECT kd.id_konsinyasi_detail,kd.id_konsinyasi,p.nama_produk,kd.jumlah_konsinyasi,s.nama_satuan, CONCAT(p.nama_produk,' ',jumlah_konsinyasi,' ',s.nama_satuan) as produk_nm 
					FROM tx_konsinyasi_detail as kd 
					LEFT JOIN tx_produk  as p ON kd.id_produk = p.id_produk
					LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan
					WHERE kd.id_konsinyasi = $id AND kd.is_delete = 0
					GROUP BY kd.id_konsinyasi_detail";
		$sql_det = $this->db->query($sql_det)->result();
		// echo $this->db->last_query();
			$table ="";
			$no = 1;
			if(!empty($sql_det)){
				$table .= "<table>
						 <tr>
						 	<th>No</th>
							<th>Produk</th>
							<th>Qty</th>
							<th>Satuan</th>
						 </tr>";
				foreach ($sql_det as $key => $val) {
					$n = $no++;
					$table .= "<tr>
								<td>$n</td>
								<td>$val->nama_produk</td>
								<td>$val->jumlah_konsinyasi</td>
								<td>$val->nama_satuan</td>
							  </tr>";
				}
				$table .= "</table>";
			}
			
		
		$sql_kon = "SELECT 
					k.id_konsinyasi,
					k.no_faktur,
					k.tgl_terima,
					s.nama_supplier,
					sum(kd.harga_pokok) as nom_harga_pokok,
					sum(kd.ppn) as nom_harga_pokok
					FROM `tx_konsinyasi` as k
					LEFT JOIN tx_konsinyasi_detail as kd ON k.id_konsinyasi = kd.id_konsinyasi
					LEFT JOIN tx_produk  as p ON kd.id_produk = p.id_produk
					LEFT JOIN tm_supplier as s ON k.id_supplier = s.id_supplier
					WHERE kd.id_konsinyasi = $id 
					GROUP BY k.id_konsinyasi";
		$sql_kon = $this->db->query($sql_kon);

		if(!empty($sql_det) || !empty($sql_kon)){
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','detail'=>$table,'konsinyasi'=>$sql_kon->row()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Not Find','detail'=>null,'konsinyasi'=>null));
		}
	}

	public function bayar_konsiyasi(){
		$id_kon = $this->input->post('id_konsinyasi');
		$data = $this->input->post();
		$id = $this->session->userdata('id_user');
		$id_gudang = $this->session->userdata('gudang');
		$datetime = $this->db->select('now() as time')->get()->row();
		$ext = 0;

		$sql_up = "UPDATE tx_konsinyasi_detail SET status = 1, update_by = '$id', update_date= '$datetime->time'
			WHERE is_selesai = 2 AND is_delete = 0 AND `status` = 0 AND id_konsinyasi = $id_kon";
		$ext_up = $this->db->query($sql_up);
		if($ext_up){
			$ext += 1;
		}

		unset($data['id_konsinyasi']);
		unset($data['tgl_trans']);

		$data['tgl_trans'] = date('Y-m-d', strtotime($_POST['tgl_trans']));
		$sql = $this->db->insert('tx_trans_keu',$data);
			if($sql){
				$ext += 1;
			}

		if($ext > 1){
			echo json_encode(array('status'=>1,'msg'=>'Konsiyasi Success DIbayar'));
		}else{
			echo json_encode(array('status'=>1,'msg'=>'Konsiyasi Gagal DIbayar'));
		}
	}

}