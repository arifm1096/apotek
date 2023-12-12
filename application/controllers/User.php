<?php

class User extends CI_Controller{

    function __construct() {
        parent::__construct();
        $this->load->model('model_user');
		$this->load->model('model_master');
		date_default_timezone_set("Asia/Bangkok");

		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
    }

    public function dataUser() {
        $var['content'] = 'view-listuser';
		$var['js']		= 'js-listuser';
 		$this->load->view('view-index',$var);
	}
	
	public function load_user(){
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
			$searchQuery .= " and (u.username like '%" . $searchValue . "%'
								 OR h.nama like '%" . $searchValue . "%'					
			) ";
		}
	
		$where = " u.is_delete = 0 " . $searchQuery . "";
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM tm_user where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tm_user` as u
		LEFT JOIN tm_hak_akses as h ON u.hak_akses = h.id_hak_akses
		LEFT JOIN tm_wilayah as w ON u.gudang = w.id_wilayah
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT u.id_user,u.nama as nama_akun,u.username,h.nama,u.hak_akses,u.aktif as id_aktif,u.gudang,w.nama_wilayah,
		(CASE WHEN (u.aktif ='y') THEN 'Aktif' 
		WHEN	(u.aktif = 'n') THEN 'Tidak Aktif'
		END) as is_aktif
		FROM `tm_user` as u
		LEFT JOIN tm_hak_akses as h ON u.hak_akses = h.id_hak_akses
		LEFT JOIN tm_wilayah as w ON u.gudang = w.id_wilayah
		WHERE $where
		order by u.id_user " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function get_hak_akses(){
		$data = $this->db->select('*')
						->from('tm_hak_akses')
						->where('is_delete',0)
						->where('aktif','y')
						->get();
		if(!empty($data)){
			echo json_encode(array('status'=>0,'message'=>'data is find','result'=>$data->result()));
		}else{
			echo json_encode(array('status'=>0,'message'=>'data is find','result'=>null));
		}
	}

	public function get_wilayah(){
		$data = $this->db->select('*')
						->from('tm_wilayah')
						->where('is_delete',0)
						->where('aktif','y')
						->get();
		if(!empty($data)){
			echo json_encode(array('status'=>0,'message'=>'data is find','result'=>$data->result()));
		}else{
			echo json_encode(array('status'=>0,'message'=>'data is find','result'=>null));
		}
	}

	public function save_user(){
		$id = $_POST['id'];
		$nama = $_POST['nama'];
		$username = $_POST['username'];
		$password = $_POST['password'];
		$hak_akses = $_POST['hak_akses'];
		$aktif = $_POST['aktif'];
		$wilayah = $_POST['gudang'];

		if ($password !=="") {
			$encrypt_password = md5(sha1($password));
			$password_fix = substr($encrypt_password,9,20);
		} else {
			$password_fix = "";
		}
	

		$data = array(
						'username'=> $username,
						'nama' => $nama,
						'gudang'=>$wilayah,
						'password'=> $password_fix,
						'hak_akses'=> $hak_akses,
						'aktif' => $aktif
					);

		if(empty($id)){
			$cek_data = $this->db
							 ->select('*')
							 ->from('tm_user')
							 ->where('username',$username)
							 ->get();
			if($cek_data->num_rows() == 0){
			$insert = $this->db->insert('tm_user',$data);
				if($insert){
					echo json_encode(array('status'=>1,'msg'=>'Input Data Success'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Input Data Falied'));
				}
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Sudah Ada'));
			}
		}else{
			$update = $this->db->where('id_user',$id)->update('tm_user',$data);
			if($update){
				echo json_encode(array('status'=>1,'msg'=>'Update Data Success'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Update Data Falied'));
			}
		}
	}
	
	public function hapususer() {
        $id = $_POST['id'];
		$delete_by = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i:s');
		$update = $this->db->where('id_user',$id)
						   ->update('tm_user',array(
													'is_delete' => 1,
													'delete_by' => $delete_by,
													'delete_date' => $time
						   						   )
									);
									// echo $this->db->last_query();
		if($update){
			echo json_encode(array('status'=>1,'msg'=>'Update Data Success'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Update Data Falied'));
		}
    }

	// End Data User

// Star Wilayah

	public function data_wilayah(){
		$var['content'] = 'view-wilayah';
		$var['js'] = 'js-wilayah';
		$this->load->view('view-index',$var);
	}
	
	public function load_wilayah(){
		// Read Value mjlklklkjhjkh
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
			$searchQuery .= " and (nama_wilayah like '%" . $searchValue . "%'
								 OR alamat like '%" . $searchValue . "%'					
			) ";
		}
	
		$where = " is_delete = 0 " . $searchQuery . "";
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tm_wilayah` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tm_wilayah`
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT id_wilayah,nama_wilayah,alamat,aktif,no_hp,nama_print,logo,(CASE WHEN (aktif ='y') THEN 'Aktif' 
		WHEN	(aktif = 'n') THEN 'Tidak Aktif'
		END) as is_aktif
		FROM `tm_wilayah`
		WHERE $where
		order by id_wilayah " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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
	public function save_wilayah(){
		$data = $this->input->post();
		$cek = $this->db->get_where('tm_wilayah',array('nama_wilayah'=>$_POST['nama_wilayah'],'is_delete'=>0));

		if($_FILES["logo"]["name"] !=""){
			$allowed_ext = array("jpg","png","jpeg","JPG","PNG","JPEG"); 
			$get_ext = explode('.', $_FILES["logo"]["name"]);
			$ext = end($get_ext);
				if(in_array($ext, $allowed_ext)){
						$nm = str_replace(".","",$_FILES["logo"]["name"]);
						$name =  $nm. '.' . $ext; 
						$path = "./assets/images/logo/". $name;
						move_uploaded_file($_FILES["logo"]["tmp_name"], $path);
						$data['logo'] = $name;
					
				} else {
					echo json_encode(array('status' => '0','message'=>'Format image tidak sesuai'));
				}
		}else{
			unset($data['logo']);
		}
		

		if(empty($data['id_wilayah'])){
			if($cek->num_rows() == 0){
				$sql = $this->db->insert('tm_wilayah',$data);
					if($sql){
						echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
					}else{
						echo json_encode(array('status'=>0,'msg'=>'Error 3423 || Gagal Menyimpan'));
					}
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Sudah Ada'));
			}
		}else{
			$sql = $this->db->where('id_wilayah',$data['id_wilayah'])->update('tm_wilayah',$data);
				if($sql){
					echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Error 3422 || Gagal Menyimpan'));
				}
		}
		
	}
	
	public function hapus_wilayah(){
		$id = $_POST['id'];
		$delete_by = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i:s');
		$update = $this->db->where('id_wilayah',$id)
						   ->update('tm_wilayah',array(
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

// End Wilayah

// Star Hak Akses
	public function data_hak_akses(){
		$var['content'] = 'view-hak_akses';
		$var['js'] = 'js-hak_akses';
		$this->load->view('view-index',$var);
	}
	public function load_hak_akses(){
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
			$searchQuery .= " and (nama like '%" . $searchValue . "%'
								 OR ket like '%" . $searchValue . "%'					
			) ";
		}
	
		$where = " is_delete = 0 " . $searchQuery . "";
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tm_hak_akses` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tm_hak_akses`
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT id_hak_akses,nama,ket,aktif,(CASE WHEN (aktif ='y') THEN 'Aktif' 
		WHEN	(aktif = 'n') THEN 'Tidak Aktif'
		END) as is_aktif 
		FROM `tm_hak_akses`
		WHERE $where
		order by id_hak_akses " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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
	public function save_hak_akses(){
		$data = $this->input->post();
		$cek = $this->db->get_where('tm_hak_akses',array('nama'=>$_POST['nama'],'is_delete'=>0));

		if(empty($data['id_hak_akses'])){
			if($cek->num_rows() == 0){
				$sql = $this->db->insert('tm_hak_akses',$data);
					if($sql){
						echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
					}else{
						echo json_encode(array('status'=>0,'msg'=>'Error 3423 || Gagal Menyimpan'));
					}
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Sudah Ada'));
			}
		}else{
			$sql = $this->db->where('id_hak_akses',$data['id_hak_akses'])->update('tm_hak_akses',$data);
				if($sql){
					echo json_encode(array('status'=>1,'msg' =>'Sukses Data Tersimpan'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Error 3422 || Gagal Menyimpan'));
				}
		}
		
	}
	public function hapus_hak_akses(){
		$id = $_POST['id'];
		$delete_by = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i:s');
		$update = $this->db->where('id_hak_akses',$id)
						   ->update('tm_hak_akses',array(
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
// Star Hak Akses

}

?>