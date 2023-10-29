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

	public function get_filter_penjualan(){
		$sql = $this->db->select('*')
						->from('tm_bulan')
						->get();
		$data = $sql->result();

		$sql_shif = $this->db->select('*')
						->from('tm_shif')
						->where('is_delete',0)
						->where('aktif','1')
						->get();
		$data_shif = $sql_shif->result();

		if(!empty($sql)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','result'=>$data,'shif'=>$data_shif));
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

// start dokter
	public function data_dokter(){
		$var['content'] = 'view-dokter';
		$var['js'] = 'js-dokter';
		$this->load->view('view-index',$var);
	}
	public function load_dokter(){
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
			$searchQuery .= " and (nama_dokter like '%" . $searchValue . "%'
								OR kode_dokter like '%" . $searchValue . "%'
								OR no_hp like '%" . $searchValue . "%'
								OR alamat like '%" . $searchValue . "%'	
								OR klinik_rs like '%" . $searchValue . "%'					
			) ";
		}

		$where = " is_delete = 0 " . $searchQuery . "";

		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tm_dokter` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];

		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tm_dokter`
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];

		// Fetch Records
		$sql = "SELECT kode_dokter,nama_dokter,username,alamat,klinik_rs,no_hp
		FROM `tm_dokter`
		WHERE $where
		order by id_dokter " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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
	public function save_dokter(){
		$data = $this->input->post();
		$cek = $this->db->get_where('tm_dokter',array('nama_dokter'=>$_POST['nama_dokter'],'is_delete'=>0));
		unset($data['password']);
		$data['password'] = md5(sha1($_POST['password']));

		if(empty($data['id_dokter'])){
			if($cek->num_rows() == 0){
				$sql = $this->db->insert('tm_dokter',$data);
					if($sql){
						echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
					}else{
						echo json_encode(array('status'=>0,'msg'=>'Error 3423 || Gagal Menyimpan'));
					}
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Sudah Ada'));
			}
		}else{
			if($_POST['password'] == ""){
				unset($data['password']);
			}
			$sql = $this->db->where('id_dokter',$data['id_dokter'])->update('tm_dokter',$data);
				if($sql){
					echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Error 3422 || Gagal Menyimpan'));
				}
		}
		
	}
	public function hapus_dokter(){
		$id = $_POST['id'];
		$delete_by = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i:s');
		$update = $this->db->where('id_dokter',$id)
							->update('tm_dokter',array(
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
// end dokter

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
								 OR kd_statuan like '%" . $searchValue . "%'
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
		$sql = "SELECT id_satuan,kd_statuan,nama_satuan,ket,aktif,(CASE WHEN (aktif ='y') THEN 'Aktif' 
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

// start rak
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

// start shif
	public function data_shif(){
		$var['content'] = 'view-shif';
		$var['js'] = 'js-shif';
		$this->load->view('view-index',$var);
	}
	public function load_shif(){
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
			$searchQuery .= " and (nama_shif like '%" . $searchValue . "%'					
			) ";
		}
	
		$where = " is_delete = 0 " . $searchQuery . "";
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tm_shif` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tm_shif`
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT id_shif,nama_shif,jam_pulang,jam_masuk,aktif,(CASE WHEN (aktif ='1') THEN 'Aktif' 
		WHEN	(aktif = '0') THEN 'Tidak Aktif'
		END) as is_aktif 
		FROM `tm_shif`
		WHERE $where
		order by id_shif " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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
	public function save_shif(){
		$data = $this->input->post();
		$cek = $this->db->get_where('tm_shif',array('nama_shif'=>$_POST['nama_shif'],'is_delete'=>0));

		if(empty($data['id_shif'])){
			if($cek->num_rows() == 0){
				$sql = $this->db->insert('tm_shif',$data);
					if($sql){
						echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
					}else{
						echo json_encode(array('status'=>0,'msg'=>'Error 3423 || Gagal Menyimpan'));
					}
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Sudah Ada'));
			}
		}else{
			$sql = $this->db->where('id_shif',$data['id_shif'])->update('tm_shif',$data);
				if($sql){
					echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Error 3422 || Gagal Menyimpan'));
				}
		}
		
	}

	public function hapus_shif(){
		$id = $_POST['id'];
		$delete_by = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i:s');
		$update = $this->db->where('id_shif',$id)
						   ->update('tm_shif',array(
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

	public function close_shif(){
		 $sql_time = $this->db->select('now() AS time ')->get()->row();
		$update = $this->db->where('close',0)
						   ->update('tx_log_shif',array(
													'close' => 1,
													'tgl_close'=>$sql_time->time
						   						   )
									);
									// echo $this->db->last_query();
		if($update){
			echo json_encode(array('status'=>1,'msg'=>'Close Shif Success, Silahkan Logout'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Close Shif Falied'));
		}
	}
// End shif

}

?>