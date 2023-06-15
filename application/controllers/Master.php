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
// Star Hak Akses

}

?>