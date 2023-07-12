<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Penjualan extends CI_Controller {

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
		$var['content'] = 'view-kasir';
		$var['js'] = 'js-persediaan';
		$this->load->view('view-index',$var);
	}

	public function load_persediaan(){
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
		$sql = "SELECT p.id_produk,p.sku_kode_produk,p.barcode,p.nama_produk,p.status_jual,p.jumlah_minimal,p.produk_by,
		r.nama_rak,s.nama_satuan,ps.jumlah_stok as stok,
		p.harga_beli,ps.id_stok,
		REPLACE(GROUP_CONCAT(phg.harga_jual),',','<br>') as harga_jual,
		REPLACE(GROUP_CONCAT(phg.marup),',','<br>') as marup
		FROM tx_produk as p
		LEFT JOIN tx_produk_stok as ps ON ps.id_produk = p.id_produk
		LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
		LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan 
		LEFT JOIN (SELECT p.id_produk,ph.id_harga,p.harga_beli,ph.harga_jual,(ph.harga_jual - p.harga_beli) as marup
		FROM tx_produk as p
		LEFT JOIN tx_produk_harga as ph ON p.id_produk = ph.id_produk) as phg ON p.id_produk = phg.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_produk " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function get_satuan(){
		$sql = $this->db->select('*')->from('tm_satuan')->where('id_satuan',$_POST['id_satuan'])->get()->row();
		$data = "/ ".$sql->nama_satuan;
		echo json_encode(array('msg'=>'Data find','res'=>$data));
	}

	public function get_data_master(){
		
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
		if(!empty($sql_rak) || !empty($sql_satuan)){
			echo json_encode(array(
									'status'=>1,
									'msg'=>'data is find',
									'rak'=>$sql_rak->result(),
									'satuan'=>$sql_satuan->result()
								)
							);
		}else{
			echo json_encode(array(
									'status'=>0,
									'msg'=>'data not found',                         
									'rak'=>null,
									'satuan'=>null
								)
							);
		}
	}

	public function get_data_master_persediaan(){
		$sql_supplier = $this->db->select('id_supplier,nama_supplier')
									 ->from('tm_supplier')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get();
		$sql_satuan = $this->db->select('id_satuan,nama_satuan')
									 ->from('tm_satuan')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get();
		
		if(!empty($sql_supplier) || !empty($sql_satuan)){
			echo json_encode(array(
									'status'=>1,
									'msg'=>'data is find',
									'satuan'=>$sql_satuan->result(),
									'supplier'=>$sql_supplier->result()
								)
							);
		}else{
			echo json_encode(array(
									'status'=>0,
									'msg'=>'data not found',
									'satuan'=>null,
									'supplier'=>null
								)
							);
		}
	}

	public function get_produk(){
		$id = $this->input->post('id_produk');
		$sql_data = "SELECT p.id_produk,p.nama_produk,p.satuan_utama,s.nama_satuan
						FROM `tx_produk` as p
						LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan
						WHERE p.id_produk = $id ";
		$data = $this->db->query($sql_data);

		$id_gudang = $this->session->userdata('gudang');
		// var_dump($id_gudang);
		$data_gudang = $this->db->select('nama_gudang')
							->from('tm_gudang')
							->where('id_gudang',$id_gudang)
							->get();

		if(!empty($data) || $data_gudang){
			echo json_encode(array('status'=>1,
								   'msg'=>'data is find',
								   'produk'=>$data->row(),
								   'gudang'=>$data_gudang->row(),
								));
		}else{
			echo json_encode(array('status'=>0,
								   'msg'=>'data not find',
								   'produk'=>null,
								   'gudang'=>null,
								));
		}
	}

	public function save_stok_produk(){
		$ext =0;
		$msg ="";
		$user = $this->session->userdata('id_user');
		$time = date('Y-m-d H:i;s');
		$jumlah_stok =0;
		$id_produk =  $_POST['id_produk'];
		$id_satuan =  $_POST['id_satuan'];
		$tgl_exp = date('Y-m-d',strtotime($_POST['exp_date']));
		$sql_jum = "SELECT SUM(jumlah_stok) as stok FROM `tx_produk_stok` WHERE id_produk = $id_produk";
		$jum = $this->db->query($sql_jum)->row();
		$cek = $this->db->get_where('tx_produk_detail',array('id_satuan'=>$_POST['id_satuan'],'id_produk'=>$id_produk));

		if($cek->num_rows()>0){
			$sql_jum = "SELECT id_produk,id_satuan,jumlah_produk_p 
							FROM `tx_produk_detail` 
							WHERE id_produk = $id_produk
							AND id_satuan = $id_satuan";
			$data_jum = $this->db->query($sql_jum)->row();
			
			$jumlah_stok += (int)$_POST['jumlah'] * (int)$data_jum -> jumlah_produk_p + (int)$jum->stok;
			$ext +=1;
		}else{
			$jumlah_stok += (int)$_POST['jumlah'] * 1 + (int)$jum->stok;
			$ext +=1;
		}

		$data = array(
			'id_produk' => $_POST['id_produk'],
			'id_gudang' => $this->session->userdata('gudang'),
			'jumlah_stok' => $jumlah_stok,
			'exp_date' => $tgl_exp,
			'id_supplier'=> $_POST['supplier'],
			'insert_date' => $time
		);

		$data_his = array(
			'id_produk' => $_POST['id_produk'],
			'id_gudang' => $this->session->userdata('gudang'),
			'jumlah_stok' => $jumlah_stok,
			'exp_date' => $tgl_exp,
			'id_supplier'=> $_POST['supplier'],
			'id_satuan' => $_POST['id_satuan'],
			'harga_beli' => $_POST['harga_beli'],
			'id_status_stok' => "1",
			'insert_by' => $user,
			'insert_date' => $time
		);

		if($ext > 0){
			if($_POST['id_stok'] == "null"){
				$data['insert_by'] = $user;
				$sql_inStok = $this->db->insert('tx_produk_stok',$data);
				if($sql_inStok){
					$sql_hisStok = $this->db->insert('tx_produk_stok_detail',$data_his);
					if($sql_hisStok){
						$ext += 1;
						$msg .= "Insert Data Success";
					}else{
						$msg .= "Gagal Insert Data His || Error Code : 3412";
					}
				}else{
					$msg .= "Gagal Insert Data Stok || Error Code : 3413";
				}
				
			}else{
				$data['update_by'] = $user;
				$sql_inStok = $this->db->where('id_stok',$_POST['id_stok'])->update('tx_produk_stok',$data);
				if($sql_inStok){
					$sql_hisStok = $this->db->insert('tx_produk_stok_detail',$data_his);
					
					if($sql_hisStok){
						$ext += 1;
						$msg .= "Insert Data Success";
					}else{
						$msg .= "Gagal Insert Data His || Error Code : 3412";
					}
				}else{
					$msg .= "Gagal Insert Data Stok || Error Code : 3413";
				}

			}
		}

		if($ext > 0){
			echo json_encode(array('status'=>1,'msg'=>$msg));
		}else{
			echo json_encode(array('status'=>0,'msg'=>$msg));
		}

		
	}

	public function kartu_stok(){
		$id = $this->uri->segment(3);
		$var['produk'] = $this->db->select('nama_produk')
								->from('tx_produk')
								->where('id_produk',$id)
								->get()->row();
		$var['id_produk'] = $id;
		$var['content'] = 'view-kartu-stok';
		$var['js'] = 'js-kartu_stok';
		$this->load->view('view-index',$var);
	}

	public function get_kartu_stok(){
		$id = $this->input->post('id_produk');
		$where = "";
		if($_POST['bulan'] !=='pil' && $_POST['tahun'] !==""){
			$bln_th = $_POST['tahun'].'-'.$_POST['bulan'];
			$where .=" AND DATE_FORMAT(ps.insert_date, '%Y-%m') = '$bln_th'";
		}

		if($_POST['id_gudang'] !=='pil'){
			$gd = $_POST['id_gudang'] ;
			$where .=" AND ps.id_gudang = $gd ";
		}

		if($_POST['kode_batch'] !==""){
			$kd = $_POST['kode_batch'];
			$where .=" OR ps.kode_batch LIKE '%$kd%'";
		}
		
		$sql = "SELECT ps.insert_date as tgl, ps.kode_batch, ps.exp_date,u.nama as petugas,
				sum(case when ps.id_status_stok = 1 then ps.jumlah_stok else 0 end) as masuk, 
				sum(case when ps.id_status_stok = 2 then ps.jumlah_stok else 0 end) as keluar,
				CONCAT(s.nama_status,' ','Stok',' ',p.nama_produk) as catat
				FROM `tx_produk_stok_detail` as ps
				LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
				LEFT JOIN tm_satus_stok as s ON ps.id_status_stok = s.id_status_stok
				LEFT JOIN tm_user as u ON ps.insert_by = u.id_user
				WHERE ps.is_delete = 0 AND p.id_produk =$id $where
				GROUP BY ps.id_stok_his";
		$data = $this->db->query($sql);

		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','data'=>$data->result()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data not Found','data'=>null));
		}
	}

	public function defecta(){
		$var['content'] = 'view-defecta';
		$var['js'] = 'js-defecta';
		$this->load->view('view-index',$var);
	}

	public function load_defecta(){
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
								 OR p.nama_produk like '%" . $searchValue . "%'	
								 OR p.jumlah_minimal like '%" . $searchValue . "%'	
								 OR r.nama_rak like '%" . $searchValue . "%'					
			) ";
		}


		if($_POST['status_jual'] =='2'){
			$where .= " AND IFNULL(ps.jumlah_stok, 0) = 0";
		}else{
			$where .= " AND IFNULL(p.jumlah_minimal, 0) > IFNULL(ps.jumlah_stok, 0)";
		}

		if($_POST['id_rak'] !='pil'){
			$where .= " AND p.id_rak ='".$_POST['id_rak']."'";
		}
	
		$where .=  $searchQuery .$jual.$rak;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_produk` as p 
		LEFT JOIN tx_produk_stok as ps ON ps.id_produk = p.id_produk
		where p.is_delete = 0 AND IFNULL(p.jumlah_minimal, 0) > IFNULL(ps.jumlah_stok, 0)";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM tx_produk as p
		LEFT JOIN tx_produk_stok as ps ON ps.id_produk = p.id_produk
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT p.id_produk,ps.id_stok,CONCAT(p.nama_produk,'<br>',p.sku_kode_produk) as nama_sku_produk,
				p.jumlah_minimal,ps.jumlah_stok as stok,
				IFNULL(p.jumlah_minimal, 0) as min,
				IFNULL(ps.jumlah_stok, 0) as sto
				FROM tx_produk as p
				LEFT JOIN tx_produk_stok as ps ON ps.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_produk " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function stok_kadaluarsa(){
		$var['content'] = 'view-stok-kadaluarsa';
		$var['js'] = 'js-stok-kadaluarsa';
		$this->load->view('view-index',$var);
	}

	public function load_kadaluarsa(){
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
								 OR p.nama_produk like '%" . $searchValue . "%'	
								 OR s.nama_supplier like '%" . $searchValue . "%'	
								 OR g.nama_gudang like '%" . $searchValue . "%'	
								 OR pd.exp_date like '%" . $searchValue . "%'					
								 OR pd.jumlah_stok like '%" . $searchValue . "%'	
			) ";
		}


		if($_POST['bulan'] !=="pil"){
			$bulan = $_POST['bulan'];
			$where .= " AND DATE_FORMAT(DATE_ADD(now(),INTERVAL +$bulan month), '%Y-%m') = DATE_FORMAT(pd.exp_date,'%Y-%m')";
		}
		

		if($_POST['filter_tanggal'] !==""){
			$tgl = date('Y-m-d',strtotime($_POST['filter_tanggal']));
			$where .= " AND pd.exp_date < '$tgl' ";
		}

		if($_POST['bulan'] =="pil" && $_POST['filter_tanggal'] ==""){
			$where .= " AND DATE_FORMAT(now(), '%Y-%m-%d') > pd.exp_date";
		}
	
		$where .= " AND pd.is_delete = 0 ".$searchQuery;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_produk_stok_detail` as pd
				LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
				LEFT JOIN tm_supplier as s on pd.id_supplier = s.id_supplier
				LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
				WHERE p.is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
				FROM `tx_produk_stok_detail` as pd
				LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
				LEFT JOIN tm_supplier as s on pd.id_supplier = s.id_supplier
				LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang 
				Where $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT p.nama_produk,p.sku_kode_produk,s.nama_supplier,g.nama_gudang,
				pd.exp_date,pd.jumlah_stok,pd.id_stok_detail,p.id_produk,
				DATE_FORMAT(now(), '%Y-%m-%d') as now_date
				FROM `tx_produk_stok_detail` as pd
				LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
				LEFT JOIN tm_supplier as s on pd.id_supplier = s.id_supplier
				LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
		WHERE $where
		GROUP BY pd.id_stok_detail
		order by pd.id_stok_detail " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function stok_opname(){
		$var['content'] = 'view-stok-opname';
		$var['js'] = 'js-stok-opname';
		$this->load->view('view-index',$var);
	}

	public function load_stok_opname(){
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
								 OR p.nama_produk like '%" . $searchValue . "%'	
								 OR r.nama_rak like '%" . $searchValue . "%'	
								 OR pd.jumlah_stok like '%" . $searchValue . "%'				
			) ";
		}

		if($_POST['id_rak'] !='pil'){
			$where .= " AND p.id_rak ='".$_POST['id_rak']."'";
		}
	
		$where .=  $searchQuery .$jual.$rak;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_produk_stok` 
		where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_produk_stok` as pd
		LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
		LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
		LEFT JOIN tx_produk_stok_opname as sp ON pd.id_stok = sp.id_stok
		LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT p.nama_produk,p.sku_kode_produk,g.nama_gudang,
				pd.exp_date,pd.jumlah_stok,p.id_produk,pd.id_stok,r.nama_rak,
				(CASE WHEN sp.tgl_so !=NULL THEN
						sp.tgl_so
					ELSE
						'Belum Pernah'
				END) as status_so
				FROM `tx_produk_stok` as pd
				LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
				LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
				LEFT JOIN tx_produk_stok_opname as sp ON pd.id_stok = sp.id_stok
				LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
		WHERE $where
		GROUP BY p.id_produk
		order by id_produk " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function get_stok_opname(){
		$id = $_POST['id_stok'];
		$sql = "SELECT p.nama_produk,p.sku_kode_produk,g.nama_gudang,
				pd.exp_date,p.id_produk,pd.id_stok,pd.jumlah_stok as stok_sistem,sp.stok_fisik,
				sp.catatan,sp.penyesuaian,pd.kode_batch
				FROM `tx_produk_stok` as pd
				LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
				LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
				LEFT JOIN tx_produk_stok_opname as sp ON pd.id_stok = sp.id_stok
				LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
				WHERE pd.id_stok = $id";
		$data = $this->db->query($sql);

		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','result'=>$data->row()));
		}else{
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','result'=>null));
		}
	}

	public function save_stok_opname(){
		$data = $this->input->post();
		$data_his = $this->input->post();

		if($_POST['id_stok_opname']){
			$sql = $this->db->insert('tx_produk_stok_opname',$data);
		}else{
			$sql = $this->db->where('id_produk_stok_opname',$data)->update('tx_produk_stok_opname',$data);
		}
	}

	

}