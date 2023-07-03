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

	public function load_produk(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue1 = $_POST['search']['value'];
		$searchValue = $_POST['text'];
		$jual ='';
		$rak ='';
		$where = " p.is_delete = 0 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.sku_kode_produk like '%" . $searchValue . "%'
								 OR p.barcode like '%" . $searchValue . "%'
								 OR p.nama_produk like '%" . $searchValue . "%'	
								 OR p.jumlah_minimal like '%" . $searchValue . "%'	
								 OR p.produk_by like '%" . $searchValue . "%'	
								 OR r.nama_rak like '%" . $searchValue . "%'	
								 OR s.nama_satuan like '%" . $searchValue . "%'					
			) ";
		}

		if($_POST['status_jual'] !='pil'){
			$where .= " AND p.status_jual ='".$_POST['status_jual']."'";
		}

		if($_POST['id_rak'] !='pil'){
			$where .= " AND p.id_rak ='".$_POST['id_rak']."'";
		}
	
		$where .=  $searchQuery .$jual.$rak;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_produk` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM tx_produk as p
		LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
		LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan 
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT p.id_produk,p.sku_kode_produk,p.barcode,p.nama_produk,p.status_jual,p.jumlah_minimal,p.produk_by,p.status_jual,
		r.nama_rak,s.nama_satuan
		FROM tx_produk as p
		LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
		LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan 
		WHERE $where
		order by id_produk " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
		$data = $this->db->query($sql)->result();
		// echo $this->db->last_query();
	
		// Response
		$output = array(
			"draw" => intval($draw),
			"iTotalRecords" => $totalRecords,
			"iTotalDisplayRecords" => $totalRecordsFilter,
			"aaData" => $data
		); 
		echo json_encode($output);
	}

	public function tambah_data(){
		$var['content'] = 'view-produk-add';
		$var['js'] = 'js-produk-add';
		$this->load->view('view-index',$var);
	}

	public function get_satuan(){
		$sql = $this->db->select('*')->from('tm_satuan')->where('id_satuan',$_POST['id_satuan'])->get()->row();
		$data = "/ ".$sql->nama_satuan;
		echo json_encode(array('msg'=>'Data find','res'=>$data));
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

	public function get_data_master_filter(){
		$sql_rak = $this->db->select('id_rak,nama_rak')
									 ->from('tm_rak')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get();
		$sql_jual = $this->db->select('id_jual,nama_jual')
									 ->from('tm_jual')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get();
		
		if(!empty($sql_jenis_produk) || !empty($sql_rak) || !empty($sql_satuan)){
			echo json_encode(array(
									'status'=>1,
									'msg'=>'data is find',
									'jual'=>$sql_jual->result(),
									'rak'=>$sql_rak->result()
								)
							);
		}else{
			echo json_encode(array(
									'status'=>0,
									'msg'=>'data not found',
									'jual'=>null,
									'rak'=>null
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

	function get_kode_ksu(){
		$str_name = $_POST['jenis_produk']." ".$_POST['nama_produk']  ;
		$arr = (explode(" ",$str_name));
		$str_ksu ="";
		$arrlength = count($arr);
	
		for($x = 0; $x < $arrlength; $x++) {
			$str_lop = strtoupper($arr[$x]);
			$str_ksu .=substr($str_lop,0,2);
		}
		$cek = $this->db->get_where('tx_produk',array('sku_kode_produk',$str_ksu));
		if($cek->num_rows()>0){
			echo json_encode(array('status'=>0,'msg'=>'Tambahakan Karater Dibelakang Untuk Pembeda','result' => $str_ksu));
		}else{
			echo json_encode(array('status'=>1,'msg'=>'Data find','result'=>$str_ksu));
		}
	}

	public function insert_produk($post_data){
		$this->db->insert('tx_produk', $post_data);
		$insert_id = $this->db->insert_id();
		return  $insert_id;
		if (!empty($insert_id)) {
			return  $insert_id;
		}else{
			return false;
		}

	}

	public function update_produk($post_data,$id){
		$data = $this->db->where('id_produk',$id)
				 ->update('tx_produk', $post_data);
		
		if (!empty($insert_id)) {
			return  $insert_id;
		}else{
			return false;
		}

	}
	
	public function save_produk(){
		$insert_id ="";
		$no = 0;
		$user = $this->session->userdata('id_user');
		$sql = "SELECT NOW() as jam";
		$time = $this->db->query($sql)->row();
		$data_produk = array(
			'nama_produk' => $_POST['nama_produk'],
			'sku_kode_produk' => $_POST['sku_kode_produk'],
			'barcode'=> $_POST['barcode'],
			'satuan_utama' => $_POST['satuan_utama'],
			'jumlah_minimal'=> $_POST['jumlah_minimal'],
			'produk_by' =>$_POST['produk_by'],
			'harga_beli'=>$_POST['harga_beli'],
			'status_jual'=>$_POST['status_jual'],
			'id_rak'=>$_POST['id_rak'],
			'id_jenis_produk'=>$_POST['id_jenis_produk'],
		);

		$produk = $this->insert_produk($data_produk);
		if(!empty($produk)){
			
			$id_satuan = $_POST['satuan'];
			$jumlah_produk = $_POST['jumlah_produk'];
			$jumlah_produk_p = $_POST['jumlah_produk_p'];
			$arr_fix =[];
			$count = 0;
			foreach ($jumlah_produk as $key => $value) {
				'"'.array_push($arr_fix, '("'.$produk.'"',
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
				$no += 1;
			}

		// harga Produk
			// harga Utama
				$sql = $this->db->insert('tx_produk_harga',
											array(
												'harga_jual' => $_POST['harga_jual'],
												'id_jenis_harga' => '5',
												'insert_by'=>$user,
												'insert_date'=>$time->jam
											));
				if($sql){
					$no += 1;
				}
			// fleksibel
				$harga_fleksibel = $_POST['harga_fleksibel'];
				$ket = $_POST['ket'];
				$jenis_harga = 1;
				$arr_fix_flek =[];
				$count_flek = 0;
				foreach ($harga_fleksibel as $key => $value) {
					'"'.array_push($arr_fix_flek, '("'.$produk.'"',
						'"'.$harga_fleksibel[$count_flek].'"',
						'"'.$ket[$count_flek].'"',
						'"'.$jenis_harga.'"',
						'"'.$user.'"',
						'"'.$time->jam.'")',
					);
					$count_flek++;
				}
				$data_fix_flek = implode(",",$arr_fix_flek);
				$str_sql_flek = "INSERT INTO `tx_produk_harga` (`id_produk`, `harga_jual`, `ket`, `id_jenis_harga`, `insert_by`, `insert_date`) VALUES
							$data_fix_flek";
							
				$sql_flek = $this->db->query($str_sql_flek);
				if ($sql_flek) {
					$no += 1;
				}

			// grosir
				$harga_grosir = $_POST['harga_grosir'];
				$jumlah_satuan = $_POST['jumlah_satuan'];
				$jenis_harga1 = 2;
				$arr_fix_gros =[];
				$count_gros = 0;
				foreach ($harga_grosir as $key => $value) {
					'"'.array_push($arr_fix_gros, '("'.$produk.'"',
						'"'.$harga_grosir[$count_gros].'"',
						'"'.$jumlah_satuan[$count_gros].'"',
						'"'.$jenis_harga1.'"',
						'"'.$user.'"',
						'"'.$time->jam.'")',
					);
					$count_gros++;
				}
				$data_fix_gros = implode(",",$arr_fix_gros);
				$str_sql_gros = "INSERT INTO `tx_produk_harga` (`id_produk`, `harga_jual`, `jumlah_per_satuan`, `id_jenis_harga`, `insert_by`, `insert_date`) VALUES
							$data_fix_gros";
							
				$sql_gros = $this->db->query($str_sql_gros);
				if ($sql_gros) {
					$no += 1;
				}

			// Member
				$harga_member = $_POST['harga_member'];
				// if($_POST['status_aktif']!=="y"){
				// 	$status_ak = "n";
				// }else{
				// 	$status_ak = $_POST['status_aktif'];
				// }
				$status_aktif = $_POST['status_aktif'];
				$jenis_harga2 = 3;
				$arr_fix_mem =[];
				$count_mem = 0;
				foreach ($harga_member as $key => $value) {
					
					'"'.array_push($arr_fix_mem, '("'.$produk.'"',
						'"'.$harga_member[$count_mem].'"',
						'"'.$status_aktif[$count_mem].'"',
						'"'.$jenis_harga2.'"',
						'"'.$user.'"',
						'"'.$time->jam.'")',
					);
					$count_mem++;
				}
				$data_fix_mem = implode(",",$arr_fix_mem);
				$str_sql_mem = "INSERT INTO `tx_produk_harga` (`id_produk`, `harga_jual`, `aktif`, `id_jenis_harga`, `insert_by`, `insert_date`) VALUES
							$data_fix_mem";
							
				$sql_mem = $this->db->query($str_sql_mem);
				if ($sql_mem) {
					$no += 1;
				}

		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error param id | Kode : 5762'));
		}
		
		if($no > 1){
			echo json_encode(array('status'=>1,'msg'=>'Success Insert Data'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Insert Data'));
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

}