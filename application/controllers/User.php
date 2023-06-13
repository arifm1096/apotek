<?php

class User extends CI_Controller{

    function __construct() {
        parent::__construct();
        $this->load->model('model_user');
		$this->load->model('model_master');
		date_default_timezone_set("Asia/Bangkok");

		// if($this->session->userdata('status') != "islogin_admin"){
		// 	redirect(base_url("login"));
		// }
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
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT u.id_user,u.username,h.nama,u.hak_akses,u.aktif as id_aktif,
		(CASE WHEN (u.aktif ='y') THEN 'Aktif' 
		WHEN	(u.aktif = 'n') THEN 'Tidak Aktif'
		END) as is_aktif
		FROM `tm_user` as u
		LEFT JOIN tm_hak_akses as h ON u.hak_akses = h.id_hak_akses
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
						->get();
		if(!empty($data)){
			echo json_encode(array('status'=>0,'message'=>'data is find','result'=>$data->result()));
		}else{
			echo json_encode(array('status'=>0,'message'=>'data is find','result'=>null));
		}
	}

	public function save_user(){
		$id = $_POST['id'];
		$username = $_POST['username'];
		$password = $_POST['password'];
		$level = $_POST['level'];
		$aktif = $_POST['aktif'];

		if ($password !=="") {
			$encrypt_password = md5(sha1($password));
			$password_fix = substr($encrypt_password,9,20);
		} else {
			$password_fix = "";
		}
	

		$data = array(
						'username'=> $username,
						'password'=> $password_fix,
						'level'=> $level,
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

}

?>