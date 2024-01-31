<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'vendor/autoload.php';
require_once 'application/third_party/fpdf/fpdf.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

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
		$this->load->model('model_produk');
		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
	}

	public function index(){
		$var['content'] = 'view-produk';
		$var['js'] = 'js-produk';
		$this->load->view('view-index',$var);
	}

	public function excel(){
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
     
        $sheet->setCellValue('A1', "No");
        $sheet->setCellValue('B1', "Rute");
        $sheet->setCellValue('C1', "Jabatan");
        $sheet->setCellValue('D1', "Golongan");
        $sheet->setCellValue('E1', "Status Penumpang");
        $sheet->setCellValue('F1', "Gaji Jalan");
        $sheet->setCellValue('G1', "Bonus Tabung");
        $sheet->setCellValue('H1', "Jumlah Point(Desimal)");
        
        // $no = 1; // Untuk penomoran tabel, di awal set dengan 1
        // $numrow = 3; // Set baris pertama untuk isi tabel adalah baris ke 4
        // foreach($data_laporan as $data){ // Lakukan looping pada variabel siswa
        //   $sheet->setCellValue('A'.$numrow, $no);
        //   $sheet->setCellValue('B'.$numrow, $data['nama_rute']);
        //   $sheet->setCellValue('C'.$numrow, $data['nama_jabatan']);
        //   $sheet->setCellValue('D'.$numrow, $data['nama_golongan']);
        //   $sheet->setCellValue('E'.$numrow, $data['nama_status']);
        //   $sheet->setCellValue('F'.$numrow, $data['gaji']);
        //   $sheet->setCellValue('G'.$numrow, $data['tabung']);
        //   $sheet->setCellValue('H'.$numrow, $data['total_point']);
        //   $no++; // Tambah 1 setiap kali looping
        //   $numrow++; // Tambah 1 setiap kali looping
        // }

        $writer = new Xlsx($spreadsheet);
        
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=master_produk.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');

    
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

	public function export_data_produk(){
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
     
        $sheet->setCellValue('A1', "No");
        $sheet->setCellValue('B1', "SKU KODE");
        $sheet->setCellValue('C1', "Nama Produk");
        $sheet->setCellValue('D1', "Produk By");
        $sheet->setCellValue('E1', "Nama Rak");
		$sheet->setCellValue('F1', "Jumlah Minimal");
		$sheet->setCellValue('G1', "Nama Satuan");
		$sheet->setCellValue('H1', "Status Jual");

		$where = " p.is_delete = 0 ";

		$searchQuery = "";
		$searchValue = $_GET['text'];
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

		if($_GET['jual'] !='pil'){
			$where .= " AND p.status_jual ='".$_GET['jual']."'";
		}

		if($_GET['rak'] !='pil'){
			$where .= " AND p.id_rak ='".$_GET['rak']."'";
		}


		$sql ="SELECT p.sku_kode_produk,p.nama_produk,p.produk_by,r.nama_rak,p.jumlah_minimal,s.nama_satuan,j.nama_jual
				FROM tx_produk as p
				LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
				LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan 
				LEFT JOIN tm_jual as j on p.status_jual = j.id_jual 
				WHERE $where";

		$data_jual = $this->db->query($sql)->result_array();
		echo $this->db->last_query();
        $no = 1; // Untuk penomoran tabel, di awal set dengan 1
        $numrow = 2; // Set baris pertama untuk isi tabel adalah baris ke 4
        foreach($data_jual as $data){ // Lakukan looping pada variabel siswa
          $sheet->setCellValue('A'.$numrow, $no);
          $sheet->setCellValue('B'.$numrow, $data['sku_kode_produk']);
          $sheet->setCellValue('C'.$numrow, $data['nama_produk']);
          $sheet->setCellValue('D'.$numrow, $data['produk_by']);
          $sheet->setCellValue('E'.$numrow, $data['nama_rak']);
		  $sheet->setCellValue('F'.$numrow, $data['jumlah_minimal']);
		  $sheet->setCellValue('G'.$numrow, $data['nama_satuan']);
		  $sheet->setCellValue('H'.$numrow, $data['nama_jual']);
          $no++; // Tambah 1 setiap kali looping
          $numrow++; // Tambah 1 setiap kali looping
        }

        $writer = new Xlsx($spreadsheet);
        
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=Master Produk.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
	}

	public function export_pdf_produk(){

		$where = " p.is_delete = 0 ";

		$searchQuery = "";
		$searchValue = $_GET['text'];
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

		if($_GET['jual'] !='pil'){
			$where .= " AND p.status_jual ='".$_GET['jual']."'";
		}

		if($_GET['rak'] !='pil'){
			$where .= " AND p.id_rak ='".$_GET['rak']."'";
		}


		$sql ="SELECT p.sku_kode_produk,p.nama_produk,p.produk_by,r.nama_rak,p.jumlah_minimal,s.nama_satuan,j.nama_jual
				FROM tx_produk as p
				LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
				LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan 
				LEFT JOIN tm_jual as j on p.status_jual = j.id_jual 
				WHERE $where";

		$var['data_produk'] = $this->db->query($sql)->result();
		$id_user = $this->session->userdata('id_user');
		$sql = "SELECT w.nama_wilayah,w.alamat,w.no_hp,w.logo
				FROM tm_user as u 
				LEFT JOIN tm_wilayah as w ON u.gudang = w.id_wilayah
				WHERE u.id_user = $id_user";
		$var['kop'] = $this->db->query($sql)->row();
        
		ob_start();
		$this->load->view('print/print-produk-pdf',$var);
		$html = ob_get_contents();
			ob_end_clean();
			require_once('./assets/html2pdf/html2pdf.class.php');
		$resolution = array(215, 330);
		$pdf = new HTML2PDF('P',$resolution,'en', true, 'UTF-8', array(4, 2, 3, 2));
		$pdf->WriteHTML($html);
		$pdf->Output('REKAP MASTER PRODUK.pdf', 'L');

       
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
		$str_name = $_POST['nama_produk'];
		$jen_pro = strtoupper(substr($_POST['jenis_produk'],0,2)); 
		$arr = (explode(" ",$str_name));
		$str_ksu ="";
		$arrlength = count($arr);
	
		for($x = 0; $x < $arrlength; $x++) {
			$str_lop = strtoupper($arr[$x]);
			$str_ksu .=substr($str_lop,0,3);
		}

		$str_ksu_fix = $jen_pro." - ".$str_ksu;
		$cek = $this->db->get_where('tx_produk',array('sku_kode_produk',$str_ksu_fix));
		if($cek->num_rows()>0){
			echo json_encode(array('status'=>0,'msg'=>'Tambahakan Karater Dibelakang Untuk Pembeda','result' => $str_ksu_fix));
		}else{
			echo json_encode(array('status'=>1,'msg'=>'Data find','result'=>$str_ksu_fix));
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
		$id_produk ="";
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
			'margin'=>$_POST['margin'],
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
												'id_produk' => $produk,
												'harga_jual' => $_POST['harga_jual'],
												'id_jenis_harga' => '4',
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

	public function get_id_produk(){
		$id =$_POST['id'];
		if(!empty($id)){
			$where ="id_produk = $id";
			$where_p ="p.id_produk = $id";
			$produk = $this->model_produk->get_produk($where_p);
			// echo $this->db->last_query();
			$satuan = $this->model_produk->get_produk_detail($where_p);
			
			$harga = $this->model_produk->get_produk_harga($where);

			if(!empty($produk) || !empty($satuan) || !empty($harga)){
				echo json_encode(array('status'=>1,'produk'=>$produk,'satuan'=>$satuan,'harga'=>$harga));
			}else{
				echo json_encode(array('status'=>0,'produk'=>null,'satuan'=>null,'harga'=>null));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'error Param Null','produk'=>null,'satuan'=>null,'harga'=>null));
		}
	}

	public function hapus_satuan (){
		$data = $this->input->post();
		$data['delete_by'] = $this->session->userdata('id_user');
		$data['delete_date'] = date('Y-m-d H:m');
		$data['is_delete'] = 1;

		if(!empty($data['id_produk_detail'])){
			$sql = $this->db->where('id_produk_detail',$data['id_produk_detail'])->update('tx_produk_detail',$data);
			if($sql){
				echo json_encode(array('status'=>1,'msg'=>'Delete Data Success'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Delete Data Filed'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Data | Code 2312'));
		}
	}

	public function hapus_harga_jenis(){
		$data = $this->input->post();
		$data['delete_by'] = $this->session->userdata('id_user');
		$data['delete_date'] = date('Y-m-d H:m');
		$data['is_delete'] = 1;

		if(!empty($data['id_harga'])){
			$sql = $this->db->where('id_harga',$data['id_harga'])->update('tx_produk_harga',$data);
			if($sql){
				echo json_encode(array('status'=>1,'msg'=>'Delete Data Success'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Delete Data Filed'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Data | Code 2312'));
		}
	}

	public function hapus_produk(){
		$data = $this->input->post();
		$data['delete_by'] = $this->session->userdata('id_user');
		$data['delete_date'] = date('Y-m-d H:m');
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

	
	public function save_edit_produk(){
		$data = $this->input->post();
		$id_produk =$_POST['id_produk'];
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
			'margin'=>$_POST['margin'],
		);

		$produk = $this->db->where('id_produk',$id_produk)->update('tx_produk',$data_produk);
		
		if($produk){
			$no += 1;
		}

			if(!empty($_POST['satuan']) && !empty($_POST['jumlah_produk']) && !empty($_POST['jumlah_produk_p'])){
				$id_satuan = $_POST['satuan'];
				$jumlah_produk = $_POST['jumlah_produk'];
				$jumlah_produk_p = $_POST['jumlah_produk_p'];
				$arr_fix =[];
				$count = 0;
				foreach ($jumlah_produk as $key => $value) {
					'"'.array_push($arr_fix, '("'.$id_produk.'"',
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
			}
			
			

		// harga Produk
			// harga Utama
				$data_harga_utama = array(
												'id_produk' => $id_produk,
												'harga_jual' => $_POST['harga_jual'],
												'id_jenis_harga' => '4',
												'insert_by'=>$user,
												'insert_date'=>$time->jam
				);
				if(!empty($_POST['id_harga'])){
					$sql = $this->db->where('id_harga',$_POST['id_harga'])->update('tx_produk_harga',$data_harga_utama);
					if($sql){
						$no += 1;
					}
				}else{
					$sql = $this->db->insert('tx_produk_harga',$data_harga_utama);
					if($sql){
						$no += 1;
					}
				}
				
			// fleksibel
				if(!empty($_POST['harga_fleksibel']) && !empty($_POST['ket']) ){
					$harga_fleksibel = $_POST['harga_fleksibel'];
					$ket = $_POST['ket'];
					$jenis_harga = 1;
					$arr_fix_flek =[];
					$count_flek = 0;
					foreach ($harga_fleksibel as $key => $value) {
						'"'.array_push($arr_fix_flek, '("'.$id_produk.'"',
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
				}
				

			// grosir
				if(!empty($_POST['harga_grosir']) && !empty($_POST['jumlah_satuan'])){
					$harga_grosir = $_POST['harga_grosir'];
					$jumlah_satuan = $_POST['jumlah_satuan'];
					$jenis_harga1 = 2;
					$arr_fix_gros =[];
					$count_gros = 0;
					foreach ($harga_grosir as $key => $value) {
						'"'.array_push($arr_fix_gros, '("'.$id_produk.'"',
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
				}
				

			// Member
				if(!empty($_POST['harga_member']) && !empty($_POST['status_aktif'])){
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
						
						'"'.array_push($arr_fix_mem, '("'.$id_produk.'"',
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
				}
		
		if($no > 1){
			echo json_encode(array('status'=>1,'msg'=>'Success Insert Data'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Insert Data'));
		}
	}

	public function laporan(){
		$var['content'] = 'view-produk-lap';
		$var['js'] = 'js-produk-lap';
		$this->load->view('view-index',$var);
	}

}