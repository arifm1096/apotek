<?php

class Master extends CI_Controller{

    function __construct() {
        parent::__construct();
        $this->load->model('model_user');
		$this->load->model('model_master');
		date_default_timezone_set("Asia/Bangkok");

		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
    }

	public function get_filter_stok(){
		$sql = $this->db->select('*')
						->from('tm_bulan')
						->get();
		$data = $sql->result();

		$sql_gud = $this->db->select('*')
						->from('tm_gudang')
						->where('is_delete',0)
						->where('aktif','y')
						->get();
		$data_gud = $sql_gud->result();

		if(!empty($sql)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','result'=>$data,'gudang'=>$data_gud));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data not Find','result'=>null));
		}
	}

	public function get_filter_defecta(){
		
		$kondisi = array(
					array('id'=>1,'nama_kondisi'=>'Stok Dibawah Minimal'),
					array('id'=>2,'nama_kondisi'=>'Stok Kosong')
				);

		$sql_gud = $this->db->select('*')
						->from('tm_gudang')
						->where('is_delete',0)
						->where('aktif','y')
						->get();
		$data_gud = $sql_gud->result();

		if(!empty($sql_gud)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','kondisi'=>$kondisi,'gudang'=>$data_gud));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data not Find','kondisi'=>null,'gudang'=>null));
		}
	}

	public function get_filter_kadaluarsa(){
		$sql_gud = $this->db->select('*')
						->from('tm_kadaluarsa')
						->get();
		$kondisi = $sql_gud->result();

		if(!empty($sql_gud)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','kondisi'=>$kondisi));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data not Find','kondisi'=>null));
		}
	}

	public function get_filter_so(){
		

		$sql_rak = $this->db->select('*')
						->from('tm_rak')
						->where('is_delete',0)
						->where('aktif','y')
						->get();
		$data_rak = $sql_rak->result();

		if(!empty($sql_rak)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','rak'=>$data_rak));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data not Find','kondisi'=>null,'gudang'=>null));
		}
	}

// Star Hak Akses
	public function data_supplier(){
		$var['content'] = 'view-supplier';
		$var['js'] = 'js-supplier';
		$this->load->view('view-index',$var);
	}
	public function load_supplier(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (nama_supplier like '%" . $searchValue . "%'
								 OR kode_supplier like '%" . $searchValue . "%'
								 OR alamat like '%" . $searchValue . "%'					
			) ";
		}
	
		$where = " is_delete = 0 " . $searchQuery . "";
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tm_supplier` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tm_supplier`
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT id_supplier,kode_supplier,nama_supplier,alamat,aktif,(CASE WHEN (aktif ='y') THEN 'Aktif' 
		WHEN	(aktif = 'n') THEN 'Tidak Aktif'
		END) as is_aktif 
		FROM `tm_supplier`
		WHERE $where
		order by id_supplier " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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
	public function save_supplier(){
		$data = $this->input->post();
		$cek = $this->db->get_where('tm_supplier',array('nama_supplier'=>$_POST['nama_supplier'],'is_delete'=>0));

		if(empty($data['id_supplier'])){
			if($cek->num_rows() == 0){
				$sql = $this->db->insert('tm_supplier',$data);
					if($sql){
						echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
					}else{
						echo json_encode(array('status'=>0,'msg'=>'Error 3423 || Gagal Menyimpan'));
					}
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Sudah Ada'));
			}
		}else{
			$sql = $this->db->where('id_supplier',$data['id_supplier'])->update('tm_supplier',$data);
				if($sql){
					echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Error 3422 || Gagal Menyimpan'));
				}
		}
		
	}
	public function hapus_supplier(){
		$id = $_POST['id'];
		$delete_by = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i:s');
		$update = $this->db->where('id_supplier',$id)
						   ->update('tm_supplier',array(
													'is_delete' => 1,
													'delete_by' => $delete_by,
													'delete_date' => $time
						   						   )
									);
									// echo $this->db->last_query();
		if($update){
			echo json_encode(array('status'=>1,'msg'=>'Hapus Data Success'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Hapus Data Falied'));
		}
	}
// end Hak Akses

// start pelanggan
	public function data_pelanggan(){
		$var['content'] = 'view-pelanggan';
		$var['js'] = 'js-pelanggan';
		$this->load->view('view-index',$var);
	}
	public function load_pelanggan(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (nama_pelanggan like '%" . $searchValue . "%'
								 OR kode_pelanggan like '%" . $searchValue . "%'
								 OR no_hp like '%" . $searchValue . "%'
								 OR alamat like '%" . $searchValue . "%'					
			) ";
		}
	
		$where = " is_delete = 0 " . $searchQuery . "";
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tm_pelanggan` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tm_pelanggan`
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT id_pelanggan,kode_pelanggan,nama_pelanggan,alamat,no_hp,aktif,(CASE WHEN (aktif ='y') THEN 'Aktif' 
		WHEN	(aktif = 'n') THEN 'Tidak Aktif'
		END) as is_aktif 
		FROM `tm_pelanggan`
		WHERE $where
		order by id_pelanggan " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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
	public function save_pelanggan(){
		$data = $this->input->post();
		$cek = $this->db->get_where('tm_pelanggan',array('nama_pelanggan'=>$_POST['nama_pelanggan'],'is_delete'=>0));

		if(empty($data['id_pelanggan'])){
			if($cek->num_rows() == 0){
				$sql = $this->db->insert('tm_pelanggan',$data);
					if($sql){
						echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
					}else{
						echo json_encode(array('status'=>0,'msg'=>'Error 3423 || Gagal Menyimpan'));
					}
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Sudah Ada'));
			}
		}else{
			$sql = $this->db->where('id_pelanggan',$data['id_pelanggan'])->update('tm_pelanggan',$data);
				if($sql){
					echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Error 3422 || Gagal Menyimpan'));
				}
		}
		
	}
	public function hapus_pelanggan(){
		$id = $_POST['id'];
		$delete_by = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i:s');
		$update = $this->db->where('id_pelanggan',$id)
						   ->update('tm_pelanggan',array(
													'is_delete' => 1,
													'delete_by' => $delete_by,
													'delete_date' => $time
						   						   )
									);
									// echo $this->db->last_query();
		if($update){
			echo json_encode(array('status'=>1,'msg'=>'Hapus Data Success'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Hapus Data Falied'));
		}
	}
// end pelanggan

// start Satuan
	public function data_satuan(){
		$var['content'] = 'view-satuan';
		$var['js'] = 'js-satuan';
		$this->load->view('view-index',$var);
	}
	public function load_satuan(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (nama_satuan like '%" . $searchValue . "%'
								 OR kd_satuan like '%" . $searchValue . "%'
								 OR ket like '%" . $searchValue . "%'					
			) ";
		}
	
		$where = " is_delete = 0 " . $searchQuery . "";
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tm_satuan` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tm_satuan`
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT id_satuan,kd_satuan,nama_satuan,ket,aktif,(CASE WHEN (aktif ='y') THEN 'Aktif' 
		WHEN	(aktif = 'n') THEN 'Tidak Aktif'
		END) as is_aktif 
		FROM `tm_satuan`
		WHERE $where
		order by id_satuan " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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
	public function save_satuan(){
		$data = $this->input->post();
		$cek = $this->db->get_where('tm_satuan',array('nama_satuan'=>$_POST['nama_satuan'],'is_delete'=>0));

		if(empty($data['id_satuan'])){
			if($cek->num_rows() == 0){
				$sql = $this->db->insert('tm_satuan',$data);
					if($sql){
						echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
					}else{
						echo json_encode(array('status'=>0,'msg'=>'Error 3423 || Gagal Menyimpan'));
					}
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Sudah Ada'));
			}
		}else{
			$sql = $this->db->where('id_satuan',$data['id_satuan'])->update('tm_satuan',$data);
				if($sql){
					echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Error 3422 || Gagal Menyimpan'));
				}
		}
		
	}
	public function hapus_satuan(){
		$id = $_POST['id'];
		$delete_by = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i:s');
		$update = $this->db->where('id_satuan',$id)
						   ->update('tm_satuan',array(
													'is_delete' => 1,
													'delete_by' => $delete_by,
													'delete_date' => $time
						   						   )
									);
									// echo $this->db->last_query();
		if($update){
			echo json_encode(array('status'=>1,'msg'=>'Hapus Data Success'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Hapus Data Falied'));
		}
	}
// End Satuan

// start Satuan
	public function data_rak(){
		$var['content'] = 'view-rak';
		$var['js'] = 'js-rak';
		$this->load->view('view-index',$var);
	}
	public function load_rak(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (nama_rak like '%" . $searchValue . "%'					
			) ";
		}
	
		$where = " is_delete = 0 " . $searchQuery . "";
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tm_rak` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tm_rak`
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT id_rak,nama_rak,aktif,(CASE WHEN (aktif ='y') THEN 'Aktif' 
		WHEN	(aktif = 'n') THEN 'Tidak Aktif'
		END) as is_aktif 
		FROM `tm_rak`
		WHERE $where
		order by id_rak " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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
	public function save_rak(){
		$data = $this->input->post();
		$cek = $this->db->get_where('tm_rak',array('nama_rak'=>$_POST['nama_rak'],'is_delete'=>0));

		if(empty($data['id_rak'])){
			if($cek->num_rows() == 0){
				$sql = $this->db->insert('tm_rak',$data);
					if($sql){
						echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
					}else{
						echo json_encode(array('status'=>0,'msg'=>'Error 3423 || Gagal Menyimpan'));
					}
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Sudah Ada'));
			}
		}else{
			$sql = $this->db->where('id_rak',$data['id_rak'])->update('tm_rak',$data);
				if($sql){
					echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Error 3422 || Gagal Menyimpan'));
				}
		}
		
	}
	public function hapus_rak(){
		$id = $_POST['id'];
		$delete_by = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i:s');
		$update = $this->db->where('id_rak',$id)
						   ->update('tm_rak',array(
													'is_delete' => 1,
													'delete_by' => $delete_by,
													'delete_date' => $time
						   						   )
									);
									// echo $this->db->last_query();
		if($update){
			echo json_encode(array('status'=>1,'msg'=>'Hapus Data Success'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Hapus Data Falied'));
		}
	}
// End rak

}

?>