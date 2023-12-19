<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	require 'vendor/autoload.php';
	use PhpOffice\PhpSpreadsheet\Spreadsheet;
	use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
class Laporan extends CI_Controller {
	
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
		$this->load->model('Model_laporan');
		
		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
	}

	// Laporan Penjualan
	public function data_penjualan(){
		$var['content'] = 'view-lap-penjualan';
		$var['js'] = 'js-lap_penjualan';
		$this->load->view('view-index',$var);
	}

	public function load_sum_pejualan(){
		$where = "is_delete = 0 AND is_selesai = 1 ";
		$searchValue = $_POST['text'];
		if ($searchValue != '') {
			$where .= " and (nama_produk like '%" . $searchValue . "%'
			 					OR no_nota like '%" . $searchValue . "%'			
			) ";
		}

		if($_POST['tgl1'] !=='' && $_POST['tgl2'] !==''){
			$tgl1 = date('Y-m-d',strtotime($_POST['tgl1'])).' 00:00:00';
			$tgl2 = date('Y-m-d',strtotime($_POST['tgl2'])).' 23:59:00';
			$where .= " AND insert_date BETWEEN '$tgl1' AND '$tgl2'";
		}else{
			$where .= "AND DATE_FORMAT(insert_date,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
		}

		$sql = "SELECT SUM(total_harga) AS total,SUM(jumlah_produk) AS qty_pro FROM tx_jual where $where";
		$data = $this->db->query($sql)->row();

		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','result'=>$data));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Not Find','result'=>null));
		}
	}

	public function load_data_penjualan(){
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
		$where = " j.is_delete = 0 AND j.is_selesai = 1 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (j.nama_produk like '%" . $searchValue . "%'
			 					OR j.no_nota like '%" . $searchValue . "%'
								 OR s.nama_satuan like '%" . $searchValue . "%'				
			) ";
		}

		if($_POST['tgl1'] !=='' && $_POST['tgl2'] !==''){
			$tgl1 = date('Y-m-d',strtotime($_POST['tgl1'])).' 00:00:00';
			$tgl2 = date('Y-m-d',strtotime($_POST['tgl2'])).' 23:59:00';
			$where .= " AND j.insert_date BETWEEN '$tgl1' AND '$tgl2'";
		}else{
			$where .= "AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
		}
	
		$where .=  $searchQuery .$jual.$rak;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_jual` as j
		where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_jual` as j
		LEFT JOIN tm_satuan as s ON j.id_satuan = s.id_satuan
		LEFT JOIN tx_produk_stok as ps ON j.id_produk = ps.id_produk
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT j.id_produk,j.id_jual,j.nama_produk,j.jumlah_produk,s.nama_satuan,
		CONCAT(j.jumlah_produk,' ',s.nama_satuan) as jumlah_nama_satuan,
		j.total_harga,ps.jumlah_stok,j.no_nota
		FROM `tx_jual` as j
		LEFT JOIN tm_satuan as s ON j.id_satuan = s.id_satuan
		LEFT JOIN tx_produk_stok as ps ON j.id_produk = ps.id_produk
		WHERE $where
		order by id_jual " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function export_data_penjualan(){
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('B1',"Apotik Nawasena 24 JAM");
        $sheet->setCellValue('A2', "No");
        $sheet->setCellValue('B2', "No Nota");
        $sheet->setCellValue('C2', "Nama Produk");
        $sheet->setCellValue('D2', "Jumlah");
        $sheet->setCellValue('E2', "Satuan");
		$sheet->setCellValue('F2', "Total Penjualan");

		$where = " j.is_delete = 0 AND j.is_selesai = 1 ";

		$searchValue = $_GET['text'];
		if ($searchValue != '') {
			$where .= " AND (j.nama_produk like '%" . $searchValue . "%'
			 					OR j.no_nota like '%" . $searchValue . "%'
								 OR s.nama_satuan like '%" . $searchValue . "%'				
			) ";
		}

		if($_GET['tgl1'] !=='' && $_GET['tgl2'] !==''){
			$tgl1 = date('Y-m-d',strtotime($_GET['tgl1'])).' 00:00:00';
			$tgl2 = date('Y-m-d',strtotime($_GET['tgl2'])).' 23:59:00';
			$where .= " AND j.insert_date BETWEEN '$tgl1' AND '$tgl2'";
		}else{
			$where .= "AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
		}


		$sql ="SELECT j.id_produk,j.id_jual,j.nama_produk,j.jumlah_produk,s.nama_satuan,
		j.jumlah_produk,s.nama_satuan,
		j.total_harga,ps.jumlah_stok,j.no_nota
		FROM `tx_jual` as j
		LEFT JOIN tm_satuan as s ON j.id_satuan = s.id_satuan
		LEFT JOIN tx_produk_stok as ps ON j.id_produk = ps.id_produk
		WHERE $where";

		$data_jual = $this->db->query($sql)->result_array();

		$sql = "SELECT SUM(j.total_harga) AS total,SUM(j.jumlah_produk) AS qty_pro FROM tx_jual as j where $where";
		$data_sum = $this->db->query($sql)->row();

		// var_dump($data_sum);

        $no = 1; // Untuk penomoran tabel, di awal set dengan 1
        $numrow = 3;
		$fot = 4; // Set baris pertama untuk isi tabel adalah baris ke 4
        foreach($data_jual as $data){ // Lakukan looping pada variabel siswa
          $sheet->setCellValue('A'.$numrow, $no);
          $sheet->setCellValue('B'.$numrow, $data['no_nota']);
          $sheet->setCellValue('C'.$numrow, $data['nama_produk']);
          $sheet->setCellValue('D'.$numrow, $data['jumlah_produk']);
          $sheet->setCellValue('E'.$numrow, $data['nama_satuan']);
		  $sheet->setCellValue('F'.$numrow, $data['total_harga']);
		  
          $no++; // Tambah 1 setiap kali looping
          $numrow++; // Tambah 1 setiap kali looping
		  $fot++;
        }
		$sheet->setCellValue('C'.$fot, "Total :");
		$sheet->setCellValue('D'.$fot, $data_sum->qty_pro);
		$sheet->setCellValue('F'.$fot, $data_sum->total);
		$sheet->getStyle('C'.$fot,)->getFont()->setBold(true);
		$sheet->getStyle('F'.$fot,)->getFont()->setBold(true);
		$sheet->getStyle('D'.$fot,)->getFont()->setBold(true);

        $writer = new Xlsx($spreadsheet);
        
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=Laporan_Penjualan.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
	}

	// Laporan Penjualan End

	// Laporan Stok
	public function data_stok(){
		$var['content'] = 'view-lap-persediaan';
		$var['js'] = 'js-lap-persediaan';
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
		p.harga_beli,ps.id_stok
		FROM tx_produk as p
		LEFT JOIN tx_produk_stok as ps ON ps.id_produk = p.id_produk
		LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
		LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan
		WHERE $where
		order by p.id_produk " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function export_data_stok(){
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('B1',"Apotik Nawasena 24 JAM");
        $sheet->setCellValue('A2', "No");
        $sheet->setCellValue('B2', "Nama Produk");
        $sheet->setCellValue('C2', "SKU");
        $sheet->setCellValue('D2', "Jumlah Stok");

		$searchValue = $_GET['text'];
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

		if($_GET['status_jual'] !='pil'){
			$where .= " AND p.status_jual ='".$_GET['status_jual']."'";
		}

		if($_GET['id_rak'] !='pil'){
			$where .= " AND p.id_rak ='".$_GET['id_rak']."'";
		}
	
		$where .=  $searchQuery .$jual.$rak;


		$sql ="SELECT p.id_produk,p.sku_kode_produk,p.barcode,p.nama_produk,p.status_jual,p.jumlah_minimal,p.produk_by,
		r.nama_rak,s.nama_satuan,ps.jumlah_stok as stok,
		p.harga_beli,ps.id_stok
		FROM tx_produk as p
		LEFT JOIN tx_produk_stok as ps ON ps.id_produk = p.id_produk
		LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
		LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan
		WHERE $where";

		$data_stok = $this->db->query($sql)->result_array();
		// var_dump($data_stok);

        $no = 1; // Untuk penomoran tabel, di awal set dengan 1
        $numrow = 3;
        foreach($data_stok as $data){ // Lakukan looping pada variabel siswa
          $sheet->setCellValue('A'.$numrow, $no);
          $sheet->setCellValue('C'.$numrow, $data['nama_produk']);
          $sheet->setCellValue('D'.$numrow, $data['sku_kode_produk']);
          $sheet->setCellValue('E'.$numrow, $data['nama_satuan']);
		  $sheet->setCellValue('F'.$numrow, $data['stok']);
		  
          $no++; // Tambah 1 setiap kali looping
          $numrow++; // Tambah 1 setiap kali looping
        }

        $writer = new Xlsx($spreadsheet);
        $tgl = date('Y-m-d_H-i');
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=Laporan_Stok_'.$tgl.'.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
	}

	// Laporan Stok

	public function laporan_modal(){
		$var['content'] = 'view-lap-modal';
		$var['js'] = 'js-lap_modal';
		$this->load->view('view-index',$var);
	}

	public function load_modal(){
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
		$where = " ps.is_delete = 0 AND p.is_delete = 0 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.sku_kode_produk like '%" . $searchValue . "%'
								 OR p.barcode like '%" . $searchValue . "%'
								 OR p.nama_produk like '%" . $searchValue . "%'					
			) ";
		}

		if($_POST['tgl1'] !='' && $_POST['tgl2'] !=''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(p.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}
	
		$where .=  $searchQuery .$jual.$rak;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_produk` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_produk_stok` as ps
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT ps.id_stok,p.sku_kode_produk,p.nama_produk,p.harga_beli,ps.jumlah_stok, (p.harga_beli * ps.jumlah_stok) as total_harga
		FROM `tx_produk_stok` as ps
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		WHERE $where
		order by p.id_produk " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
		$data = $this->db->query($sql)->result();

		$sql_tot = "SELECT 
		sum(p.harga_beli * ps.jumlah_stok) as total_nominal,
		sum(ps.jumlah_stok) as total_produk
		FROM `tx_produk_stok` as ps
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		WHERE $where";

		$data_tot = $this->db->query($sql_tot)->row();
		// Response
		$output = array(
			"draw" => intval($draw),
			"iTotalRecords" => $totalRecords,
			"iTotalDisplayRecords" => $totalRecordsFilter,
			"aaData" => $data,
			"total_nominal" => "Rp. ".number_format($data_tot->total_nominal,0,',','.'),
			"total_produk" => $data_tot->total_produk." Produk"
		); 
		echo json_encode($output);
	}

	public function export_excel_modal(){
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('B1',"Apotik Nawasena 24 JAM");
		$sheet->setCellValue('A2', "Total Modal");
		$sheet->setCellValue('C2', "Total Produk");
        $sheet->setCellValue('A3', "No");
        $sheet->setCellValue('B3', "SKU");
        $sheet->setCellValue('C3', "Nama Produk");
        $sheet->setCellValue('D3', "Harga Beli");
		$sheet->setCellValue('E3', "Jumlah Stok");
		$sheet->setCellValue('F3', "Total Beli");

		$where = " ps.is_delete = 0 AND p.is_delete = 0 ";

		$sql = "SELECT ps.id_stok,p.sku_kode_produk,p.nama_produk,p.harga_beli,ps.jumlah_stok, (p.harga_beli * ps.jumlah_stok) as total_harga
		FROM `tx_produk_stok` as ps
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		WHERE $where";

		$data_res = $this->db->query($sql)->result_array();

		$sql_tot = "SELECT 
		sum(p.harga_beli * ps.jumlah_stok) as total_nominal,
		sum(ps.jumlah_stok) as total_produk
		FROM `tx_produk_stok` as ps
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		WHERE $where";

		$data_tot = $this->db->query($sql_tot)->row();
		$sheet->setCellValue('B2', $data_tot->total_nominal);
		$sheet->setCellValue('D2', $data_tot->total_produk);
		
        $no = 1; // Untuk penomoran tabel, di awal set dengan 1
        $numrow = 4;
        foreach($data_res as $data){ // Lakukan looping pada variabel siswa
          $sheet->setCellValue('A'.$numrow, $no);
		  $sheet->setCellValue('B'.$numrow, $data['sku_kode_produk']);
          $sheet->setCellValue('C'.$numrow, $data['nama_produk']);
          $sheet->setCellValue('D'.$numrow, $data['harga_beli']);
          $sheet->setCellValue('E'.$numrow, $data['jumlah_stok']);
		  $sheet->setCellValue('F'.$numrow, $data['total_harga']);
          $no++; // Tambah 1 setiap kali looping
          $numrow++; // Tambah 1 setiap kali looping
        }

        $writer = new Xlsx($spreadsheet);
        $tgl = date('Y-m-d_H-i');
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=Laporan_Stok_'.$tgl.'.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
	}

	public function export_pdf_modal(){
		$where = " ps.is_delete = 0 AND p.is_delete = 0 ";
		$sql = "SELECT ps.id_stok,p.sku_kode_produk,p.nama_produk,p.harga_beli,ps.jumlah_stok, (p.harga_beli * ps.jumlah_stok) as total_harga
		FROM `tx_produk_stok` as ps
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		WHERE $where";

		$var['data'] = $this->db->query($sql)->result_array();

		$sql_tot = "SELECT 
		sum(p.harga_beli * ps.jumlah_stok) as total_nominal,
		sum(ps.jumlah_stok) as total_produk
		FROM `tx_produk_stok` as ps
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		WHERE $where";

		$var['tot'] = $this->db->query($sql_tot)->row();
		$id_user = $this->session->userdaya('id_user');
		$sql = "SELECT w.nama_wilayah,w.alamat,w.no_hp
				FROM tm_user as u 
				LEFT JOIN tm_wilayah as w ON u.gudang = w.id_wilayah
				WHERE u.id_user = $id_user";
		$var['kop'] = $this->db->query($sql)->row();

		ob_start();
		$this->load->view('print/print-modal-anggota',$var);
		$html = ob_get_contents();
			ob_end_clean();
			require_once('./assets/html2pdf/html2pdf.class.php');
		$resolution = array(215, 330);
		$pdf = new HTML2PDF('P',$resolution,'en', true, 'UTF-8', array(4, 2, 3, 2));
		$pdf->WriteHTML($html);
		$pdf->Output('korwil.pdf', 'P');
	}

	public function laporan_margin(){
		$var['content'] = 'view-lap-margin';
		$var['js'] = 'js-lap_margin';
		$this->load->view('view-index',$var);
	}

	public function load_margin(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
		// $searchValue = $_POST['text'];
		$where = " j.is_delete = 0 AND j.is_selesai = 1 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
			 					OR j.no_nota like '%" . $searchValue . "%'
								 OR p.sku_kode_produk like '%" . $searchValue . "%'				
			) ";
		}

		if($_POST['tgl1'] !=='' && $_POST['tgl2'] !==''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}
		
		$where .=  $searchQuery;
	
		// Total number records without filtering
		$sql_count = "SELECT COUNT(b.allcount) as allcount
		FROM(
		SELECT count(*) as allcount
		FROM `tx_jual` as j
		where is_delete = 0
		GROUP BY id_produk) as b";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT COUNT(b.id_jual) as allcount
		FROM(
		SELECT j.id_jual
				FROM `tx_jual` as j
				LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
				WHERE $where
				GROUP BY p.id_produk) as b";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
		
		// Fetch Records
		$sql = "SELECT j.id_jual,p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - (sum(j.jumlah_produk) * j.harga_beli) as margin
		FROM `tx_jual` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_jual " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
		$data = $this->db->query($sql)->result();

		$sql_tot = "SELECT 
		sum(tx.tot_produk_jual) as tot_produk_terjual,
		sum(tx.harga_beli) as tot_harga_beli,
		sum(tx.tot_harga_beli) as sub_tot_harga_beli,
		sum(tx.harga_jual) as tot_harga_jual,
		sum(tx.tot_harga_jual) as sub_tot_harga_jual,
		sum(tx.margin) as tot_margin 
		FROM
		(SELECT j.id_jual,p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - (sum(j.jumlah_produk) * j.harga_beli) as margin
		FROM `tx_jual` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk) as tx";

		$data_tot = $this->db->query($sql_tot)->row();
	
		// Response
		$output = array(
			"draw" => intval($draw),
			"iTotalRecords" => $totalRecords,
			"iTotalDisplayRecords" => $totalRecordsFilter,
			"aaData" => $data,
			"tot_produk" => $data_tot->tot_produk_terjual,
			"tot_harga_beli" => "Rp. ".number_format($data_tot->tot_harga_beli,0,',','.'),
			"sub_tot_harga_beli" => "Rp. ".number_format($data_tot->sub_tot_harga_beli,0,',','.'),
			"tot_harga_jual" => "Rp. ".number_format($data_tot->tot_harga_jual,0,',','.'),
			"sub_tot_harga_jual" => "Rp. ".number_format($data_tot->sub_tot_harga_jual,0,',','.'),
			"total_margin" => "Rp. ".number_format($data_tot->tot_margin,0,',','.'),
		); 
		echo json_encode($output);
	}

	public function export_excel_margin(){
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('B1',"Apotik Nawasena 24 JAM");
		$sheet->setCellValue('A2', "Total Modal");
        $sheet->setCellValue('A3', "No");
        $sheet->setCellValue('B3', "SKU");
        $sheet->setCellValue('C3', "Nama Produk");
        $sheet->setCellValue('D3', "Total Terjual");
		$sheet->setCellValue('E3', "Harga Beli");
		$sheet->setCellValue('F3', "Total Harga Beli");
		$sheet->setCellValue('G3', "Harga Jual");
		$sheet->setCellValue('H3', "Total Harga Jual");
		$sheet->setCellValue('I3', "Margin");

		$where = " j.is_delete = 0 AND j.is_selesai = 1";
		
		if($_GET['tgl1'] !=='' && $_GET['tgl2'] !==''){
			$tgl1 = $_GET['tgl1'];
			$tgl2 = $_GET['tgl2'];
			$where .= " AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}

		$sql = "SELECT j.id_jual,p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - (sum(j.jumlah_produk) * j.harga_beli) as margin
		FROM `tx_jual` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_jual ";
		$data_res = $this->db->query($sql)->result_array();

		$sql_tot = "SELECT 
		sum(tx.tot_produk_jual) as tot_produk_terjual,
		sum(tx.harga_beli) as tot_harga_beli,
		sum(tx.tot_harga_beli) as sub_tot_harga_beli,
		sum(tx.harga_jual) as tot_harga_jual,
		sum(tx.tot_harga_jual) as sub_tot_harga_jual,
		sum(tx.margin) as tot_margin 
		FROM
		(SELECT j.id_jual,p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - (sum(j.jumlah_produk) * j.harga_beli) as margin
		FROM `tx_jual` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk) as tx";

		$data_tot = $this->db->query($sql_tot)->row();

		$sheet->setCellValue('B2', $data_tot->tot_margin);
		
        $no = 1; // Untuk penomoran tabel, di awal set dengan 1
        $numrow = 4;
        foreach($data_res as $data){ // Lakukan looping pada variabel siswa
          $sheet->setCellValue('A'.$numrow, $no);
		  $sheet->setCellValue('B'.$numrow, $data['sku_kode_produk']);
          $sheet->setCellValue('C'.$numrow, $data['nama_produk']);
          $sheet->setCellValue('D'.$numrow, $data['tot_produk_jual']);
          $sheet->setCellValue('E'.$numrow, $data['harga_beli']);
		  $sheet->setCellValue('F'.$numrow, $data['tot_harga_beli']);
		  $sheet->setCellValue('G'.$numrow, $data['harga_jual']);
		  $sheet->setCellValue('H'.$numrow, $data['tot_harga_jual']);
		  $sheet->setCellValue('I'.$numrow, $data['margin']);
          $no++; // Tambah 1 setiap kali looping
          $numrow++; // Tambah 1 setiap kali looping
        }

        $writer = new Xlsx($spreadsheet);
        $tgl = date('Y-m-d_H-i');
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=Laporan_Margin_'.$tgl.'.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
	}

	public function export_pdf_margin(){
		$where = " j.is_delete = 0 AND j.is_selesai = 1";
		
		if($_GET['tgl1'] !=='' && $_GET['tgl2'] !==''){
			$tgl1 = $_GET['tgl1'];
			$tgl2 = $_GET['tgl2'];
			$where .= " AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}

		$sql = "SELECT j.id_jual,p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - (sum(j.jumlah_produk) * j.harga_beli) as margin
		FROM `tx_jual` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_jual ";
		$var['data'] = $this->db->query($sql)->result();

		$sql_tot = "SELECT 
		sum(tx.tot_produk_jual) as tot_produk_terjual,
		sum(tx.harga_beli) as tot_harga_beli,
		sum(tx.tot_harga_beli) as sub_tot_harga_beli,
		sum(tx.harga_jual) as tot_harga_jual,
		sum(tx.tot_harga_jual) as sub_tot_harga_jual,
		sum(tx.margin) as tot_margin 
		FROM
		(SELECT j.id_jual,p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - (sum(j.jumlah_produk) * j.harga_beli) as margin
		FROM `tx_jual` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk) as tx";

		$var['data_tot'] = $this->db->query($sql_tot)->row();

		$id_user = $this->session->userdata('id_user');
		$sql = "SELECT w.nama_wilayah,w.alamat,w.no_hp,w.logo
				FROM tm_user as u 
				LEFT JOIN tm_wilayah as w ON u.gudang = w.id_wilayah
				WHERE u.id_user = $id_user";
		$var['kop'] = $this->db->query($sql)->row();
        
		ob_start();
		$this->load->view('print/print-margin-pdf',$var);
		$html = ob_get_contents();
			ob_end_clean();
			require_once('./assets/html2pdf/html2pdf.class.php');
		$resolution = array(215, 330);
		$pdf = new HTML2PDF('P',$resolution,'en', true, 'UTF-8', array(4, 2, 3, 2));
		$pdf->WriteHTML($html);
		$pdf->Output('REKAP DATA MARGIN.pdf', 'L');
	}

	public function laporan_margin_dok(){
		$var['content'] = 'view-lap-margin-doc';
		$var['js'] = 'js-lap_margin_doc';
		$this->load->view('view-index',$var);
	}

	public function load_margin_dok(){
		// Read Value 
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
		// $searchValue = $_POST['text'];
		$where = " j.is_delete = 0 AND j.is_selesai = 1 AND j.status = 1 or j.status = 3 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
			 					OR j.no_nota like '%" . $searchValue . "%'
								 OR p.sku_kode_produk like '%" . $searchValue . "%'				
			) ";
		}

		if($_POST['tgl1'] !=='' && $_POST['tgl2'] !==''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}
		
		$where .=  $searchQuery;
	
		// Total number records without filtering
		$sql_count = "SELECT COUNT(b.allcount) as allcount
		FROM(
		SELECT count(*) as allcount
		FROM `tx_resep_detail` as j
		where is_delete = 0
		GROUP BY id_produk) as b";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT COUNT(b.id_resep_detail) as allcount
		FROM(
		SELECT j.id_resep_detail
				FROM `tx_resep_detail` as j
				LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
				WHERE $where
				GROUP BY p.id_produk) as b";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
		
		// Fetch Records
		$sql = "SELECT p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - sum(j.harga_beli) as margin
		FROM `tx_resep_detail` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_resep_detail " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
		$data = $this->db->query($sql)->result();

		$sql_tot = "SELECT sum(tx.margin) as tot_margin 
		FROM
		(SELECT j.id_resep_detail,p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - sum(j.harga_beli) as margin
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk) as tx";

		$data_tot = $this->db->query($sql_tot)->row();
		
	
		// Response
		$output = array(
			"draw" => intval($draw),
			"iTotalRecords" => $totalRecords,
			"iTotalDisplayRecords" => $totalRecordsFilter,
			"aaData" => $data,
			"total_nominal" => "Rp. ".number_format($data_tot->tot_margin,0,',','.'),
		); 
		echo json_encode($output);
	}

	public function export_excel_margin_dok(){
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('B1',"Apotik Nawasena 24 JAM");
		$sheet->setCellValue('A2', "Total Modal");
        $sheet->setCellValue('A3', "No");
        $sheet->setCellValue('B3', "SKU");
        $sheet->setCellValue('C3', "Nama Produk");
        $sheet->setCellValue('D3', "Total Terjual");
		$sheet->setCellValue('E3', "Harga Beli");
		$sheet->setCellValue('F3', "Total Harga Beli");
		$sheet->setCellValue('G3', "Harga Jual");
		$sheet->setCellValue('H3', "Total Harga Jual");
		$sheet->setCellValue('I3', "Margin");

		$where = " j.is_delete = 0 AND j.is_selesai = 1 AND j.status = 1 or j.status = 3";
		
		if($_GET['tgl1'] !=='' && $_GET['tgl2'] !==''){
			$tgl1 = $_GET['tgl1'];
			$tgl2 = $_GET['tgl2'];
			$where .= " AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}

		$sql = "SELECT j.id_resep_detail,p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - sum(j.harga_beli) as margin
		FROM `tx_resep_detail` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_resep_detail ";
		$data_res = $this->db->query($sql)->result_array();

		$sql_tot = "SELECT sum(tx.margin) as tot_margin 
		FROM
		(SELECT j.id_resep_detail,p.id_produk,p.sku_kode_produk,p.nama_produk,
		sum(j.jumlah_produk) as tot_produk_jual, 
		j.harga_beli,
		sum(j.jumlah_produk) * j.harga_beli as tot_harga_beli, 
		j.harga_jual, 
		sum(j.total_harga) as tot_harga_jual,
		sum(j.total_harga) - sum(j.harga_beli) as margin
		FROM `tx_resep_detail` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk) as tx";

		$data_tot = $this->db->query($sql_tot)->row();

		$sheet->setCellValue('B2', $data_tot->tot_margin);
		
        $no = 1; // Untuk penomoran tabel, di awal set dengan 1
        $numrow = 4;
        foreach($data_res as $data){ // Lakukan looping pada variabel siswa
          $sheet->setCellValue('A'.$numrow, $no);
		  $sheet->setCellValue('B'.$numrow, $data['sku_kode_produk']);
          $sheet->setCellValue('C'.$numrow, $data['nama_produk']);
          $sheet->setCellValue('D'.$numrow, $data['tot_produk_jual']);
          $sheet->setCellValue('E'.$numrow, $data['harga_beli']);
		  $sheet->setCellValue('F'.$numrow, $data['tot_harga_beli']);
		  $sheet->setCellValue('G'.$numrow, $data['harga_jual']);
		  $sheet->setCellValue('H'.$numrow, $data['tot_harga_jual']);
		  $sheet->setCellValue('I'.$numrow, $data['margin']);
          $no++; // Tambah 1 setiap kali looping
          $numrow++; // Tambah 1 setiap kali looping
        }

        $writer = new Xlsx($spreadsheet);
        $tgl = date('Y-m-d_H-i');
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=Laporan_Margin_'.$tgl.'.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
	}

	public function laporan_beli_langsung(){
		$var['content'] = 'view-lap-langsung';
		$var['js'] = 'js-lap_langsung';
		$this->load->view('view-index',$var);
	}

	public function load_beli_langsung(){
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
		// $searchValue = $_POST['text'];
		$where = " psd.is_delete = 0 AND p.is_delete = 0 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
								 OR p.sku_kode_produk like '%" . $searchValue . "%'				
			) ";
		}

		if($_POST['tgl1'] !=='' && $_POST['tgl2'] !==''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(psd.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}
		
		$where .=  $searchQuery;
	
		// Total number records without filtering
		$sql_count = "SELECT COUNT(b.allcount) as allcount
		FROM(
		SELECT count(*) as allcount
		FROM `tx_produk_stok_detail` as j
		where is_delete = 0
		GROUP BY id_produk) as b";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT COUNT(b.id_produk) as allcount
		FROM(
		SELECT p.id_produk
		FROM `tx_produk_stok_detail` as psd
		LEFT JOIN tx_produk as p on psd.id_produk = p.id_produk
				WHERE $where
				GROUP BY p.id_produk) as b";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
		
		// Fetch Records
		$sql = "SELECT p.sku_kode_produk,p.nama_produk,psd.harga_beli as hrpsd,p.harga_beli as hrp,
		CASE WHEN psd.harga_beli = 0 THEN p.harga_beli ELSE psd.harga_beli END as harga_beli,
		sum(psd.jumlah_stok) as stok,
		sum(psd.jumlah_stok) * CASE WHEN psd.harga_beli = 0 THEN p.harga_beli ELSE psd.harga_beli END as tot_harga_beli
		FROM `tx_produk_stok_detail` as psd
		LEFT JOIN tx_produk as p on psd.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_stok_detail " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
		$data = $this->db->query($sql)->result();

		$sql_tot = "SELECT 
		sum(psd.jumlah_stok) * CASE WHEN psd.harga_beli = 0 THEN p.harga_beli ELSE psd.harga_beli END as tot_harga_beli
		FROM `tx_produk_stok_detail` as psd
		LEFT JOIN tx_produk as p on psd.id_produk = p.id_produk
		WHERE $where";

		$data_tot = $this->db->query($sql_tot)->row();
		
	
		// Response
		$output = array(
			"draw" => intval($draw),
			"iTotalRecords" => $totalRecords,
			"iTotalDisplayRecords" => $totalRecordsFilter,
			"aaData" => $data,
			"total_nominal" => "Rp. ".number_format($data_tot->tot_harga_beli,0,',','.'),
		); 
		echo json_encode($output);
	}

	public function laporan_beli_rencana(){
		$var['content'] = 'view-lap-rencana';
		$var['js'] = 'js-lap_rencana';
		$this->load->view('view-index',$var);
	}

	public function load_beli_rencana(){
		$draw = $_POST['draw'];
		$row = $_POST['start'];
		$rowperpage = $_POST['length']; // Rows display per page
		$columnIndex = $_POST['order'][0]['column']; // Column index
		$columnName = $_POST['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $_POST['order'][0]['dir']; // asc or desc
		$searchValue = $_POST['search']['value'];
		// $searchValue = $_POST['text'];
		$where = " psd.is_delete = 0 AND p.is_delete = 0 AND psd.status_terima = 1 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
								 OR p.sku_kode_produk like '%" . $searchValue . "%'				
			) ";
		}

		if($_POST['tgl1'] !=='' && $_POST['tgl2'] !==''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(psd.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}
		
		$where .=  $searchQuery;
	
		// Total number records without filtering
		$sql_count = "SELECT COUNT(b.allcount) as allcount
		FROM(
		SELECT count(*) as allcount
		FROM `tx_beli_rencana`
		where is_delete = 0
		GROUP BY id_produk) as b";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT COUNT(b.id_produk) as allcount
		FROM(
		SELECT p.id_produk
		FROM `tx_beli_rencana` as psd
		LEFT JOIN tx_produk as p on psd.id_produk = p.id_produk
				WHERE $where
				GROUP BY p.id_produk) as b";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
		
		// Fetch Records
		$sql = "SELECT p.sku_kode_produk,p.nama_produk,psd.harga_beli as hrpsd,p.harga_beli as hrp,
		CASE WHEN psd.harga_beli = 0 THEN p.harga_beli ELSE psd.harga_beli END as harga_beli,
		sum(psd.jumlah_produk) as stok,
		sum(psd.jumlah_produk) * CASE WHEN psd.harga_beli = 0 THEN p.harga_beli ELSE psd.harga_beli END as tot_harga_beli
		FROM `tx_beli_rencana`as psd
		LEFT JOIN tx_produk as p on psd.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_rencana_beli " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
		$data = $this->db->query($sql)->result();

		$sql_tot = "SELECT 
		sum(psd.jumlah_produk) * CASE WHEN psd.harga_beli = 0 THEN p.harga_beli ELSE psd.harga_beli END as tot_harga_beli
		FROM `tx_beli_rencana` as psd
		LEFT JOIN tx_produk as p on psd.id_produk = p.id_produk
		WHERE $where";

		$data_tot = $this->db->query($sql_tot)->row();
		// Response
		$output = array(
			"draw" => intval($draw),
			"iTotalRecords" => $totalRecords,
			"iTotalDisplayRecords" => $totalRecordsFilter,
			"aaData" => $data,
			"total_nominal" => "Rp. ".number_format($data_tot->tot_harga_beli,0,',','.'),
		); 
		echo json_encode($output);
	}

	public function laporan_keuangan(){
		$var['content'] = 'view-lap-keu';
		$var['js'] = 'js-lap-keu';
		$this->load->view('view-index',$var);
	}

	public function load_laporan_keu(){
		// $tgl_awal = date('Y-m-d',strtotime($_POST['tgl1'])).' 00:00:00';
		// $tgl_akhir = date('Y-m-d',strtotime($_POST['tgl2'])).' 23:59:00';

		$tgl_awal = $_POST['tgl1'];
		$tgl_akhir = $_POST['tgl2'];
		

		// var_dump($tgl_awal.' - '. $tgl_akhir);

		$modal = $this->Model_laporan->get_lap_modal();
		$margin_kas = $this->Model_laporan->get_lap_margin_kasir($tgl_awal,$tgl_akhir);
		$margin_res = $this->Model_laporan->get_lap_margin_resep($tgl_awal,$tgl_akhir);
		$pen_dok = $this->Model_laporan->get_lap_pen_dok($tgl_awal,$tgl_akhir);
		$pen_kas = $this->Model_laporan->get_lap_pen_kas($tgl_awal,$tgl_akhir);
		$pem_kas = $this->Model_laporan->get_lap_pem_kas($tgl_awal,$tgl_akhir);
		$pem_dok = $this->Model_laporan->get_lap_pem_dok($tgl_awal,$tgl_akhir);

		// echo $this->db->last_query();

		$var['tot_modal'] = number_format($modal->total_modal,0,',','.');
		$var['tot_margin_kas'] = number_format($margin_kas->tot_margin,0,',','.');
		$var['tot_margin_res'] = number_format($margin_res->tot_margin,0,',','.');
		$var['tot_pen_dok'] = number_format($pen_dok->tot_harga_jual,0,',','.');
		$var['tot_pen_kas'] = number_format($pen_kas->tot_harga_jual,0,',','.');
		$var['tot_pem_kas'] = number_format($pem_kas->tot_harga_beli,0,',','.');
		$var['tot_pem_dok'] = number_format($pem_dok->tot_harga_beli,0,',','.');

		$tot_m = (int) $margin_kas->tot_margin + (int) $margin_res->tot_margin;
		$var['tot_margin'] = number_format($tot_m,0,',','.');

		$tot_p = (int) $pen_dok->tot_harga_jual + (int) $pen_kas->tot_harga_jual;
		$var['tot_penjualan'] = number_format($tot_p,0,',','.');

		$tot_pm = (int) $pem_dok->tot_harga_beli + (int) $pem_kas->tot_harga_beli;
		$var['tot_pembelian'] = number_format($tot_pm,0,',','.');
		// total_laba
		$laba_rugi = $tot_m ;
		$var['laba_rugi'] = number_format($laba_rugi,0,',','.');

		if($tgl_awal !== "" && $tgl_akhir !==""){
			echo json_encode(array('status'=>1,'msg'=>'Masukan Periode Tanggal Terlebih dahulu.!!','res'=>$var));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Masukan Periode Tanggal Terlebih dahulu.!!','res'=>null));
		}

	}

	public function export_data_keu(){
		// $tgl_awal = date('Y-m-d',strtotime($_GET['tgl1'])).' 00:00:00';
		// $tgl_akhir = date('Y-m-d',strtotime($_GET['tgl2'])).' 23:59:00';

		$tgl_awal = $_GET['tgl1'];
		$tgl_akhir = $_GET['tgl2'];

		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('A1',"Apotik Nawasena 24 JAM");
        $sheet->setCellValue('A2', "MODAL");
        $sheet->setCellValue('A3', "PEMASUKAN");
        $sheet->setCellValue('A4', "MARGIN PENJUALAN KASIR");
        $sheet->setCellValue('A5', "MARGIN RESEP DOKTER");
        $sheet->setCellValue('A6', "JUMLAH MARGIN");
		$sheet->setCellValue('A7', "-- PENJULAN --");
		$sheet->setCellValue('A8', "TOTAL PENJULAN KASIR");
		$sheet->setCellValue('A9', "TOTAL PENJUALAN RESEP DOKTER");
		$sheet->setCellValue('A10', "TOTAL PENJULAN");
		$sheet->setCellValue('A11', "-- PEMBELIAN --");
		$sheet->setCellValue('A12', "TOTAL PEMBELIAN KASIR");
		$sheet->setCellValue('A13', "TOTAL PEMBELIAN RESEP DOKTER");
		$sheet->setCellValue('A14', "TOTAL PEMBELIAN");
		$sheet->setCellValue('A15', "-- LABA --");
		$sheet->setCellValue('A16', "TOTAL PENJULAN");
		$sheet->setCellValue('A17', "TOTAL PEMBELIAN");
		$sheet->setCellValue('A18', "LABA BERSIH");

		$modal = $this->Model_laporan->get_lap_modal();
		$margin_kas = $this->Model_laporan->get_lap_margin_kasir($tgl_awal,$tgl_akhir);
		$margin_res = $this->Model_laporan->get_lap_margin_resep($tgl_awal,$tgl_akhir);
		$pen_dok = $this->Model_laporan->get_lap_pen_dok($tgl_awal,$tgl_akhir);
		$pen_kas = $this->Model_laporan->get_lap_pen_kas($tgl_awal,$tgl_akhir);
		$pem_kas = $this->Model_laporan->get_lap_pem_kas($tgl_awal,$tgl_akhir);
		$pem_dok = $this->Model_laporan->get_lap_pem_dok($tgl_awal,$tgl_akhir);

		$tot_modal = number_format($modal->total_modal,0,',','.');
		$tot_margin_kas = number_format($margin_kas->tot_margin,0,',','.');
		$tot_margin_res = number_format($margin_res->tot_margin,0,',','.');
		$tot_pen_dok = number_format($pen_dok->tot_harga_jual,0,',','.');
		$tot_pen_kas = number_format($pen_kas->tot_harga_jual,0,',','.');
		$tot_pem_kas = number_format($pem_kas->tot_harga_beli,0,',','.');
		$tot_pem_dok = number_format($pem_dok->tot_harga_beli,0,',','.');

		$tot_m = (int) $margin_kas->tot_margin + (int) $margin_res->tot_margin;
		$tot_margin = number_format($tot_m,0,',','.');

		$tot_p = (int) $pen_dok->tot_harga_jual + (int) $pen_kas->tot_harga_jual;
		$tot_penjualan = number_format($tot_p,0,',','.');

		$tot_pm = (int) $pem_dok->tot_harga_beli + (int) $pem_kas->tot_harga_beli;
		$tot_pembelian = number_format($tot_pm,0,',','.');
		// total_laba
		$laba_rugi = $tot_m ;
		$laba_rugi_X = number_format($laba_rugi,0,',','.');

		
		
		$sheet->setCellValue('B2', $tot_modal);
		
        $sheet->setCellValue('B4', $tot_margin_kas);
        $sheet->setCellValue('B5', $tot_margin_res);
        $sheet->setCellValue('B6', $tot_margin);
		
		$sheet->setCellValue('B8', $tot_pen_kas);
		$sheet->setCellValue('B9', $tot_pen_dok);
		$sheet->setCellValue('B10', $tot_penjualan);
		
		$sheet->setCellValue('B12', $tot_pem_kas);
		$sheet->setCellValue('B13', $tot_pem_dok);
		$sheet->setCellValue('B14', $tot_pembelian);
		
		$sheet->setCellValue('B16', $tot_penjualan);
		$sheet->setCellValue('B17', $tot_pembelian);
		$sheet->setCellValue('B18', $laba_rugi_X);
        
		$sheet->getStyle('B16')->getFont()->setBold(true);
		$sheet->getStyle('B17')->getFont()->setBold(true);
		$sheet->getStyle('B18')->getFont()->setBold(true);

        $writer = new Xlsx($spreadsheet);
        
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=LAPORAN_KEUANGAN.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
	}


		// Laporan Penjualan
		public function data_penjualan_tertolak(){
			$var['content'] = 'view-lap-penjualan';
			$var['js'] = 'js-lap_penjualan';
			$this->load->view('view-index',$var);
		}
	
		public function load_sum_pejualan_tertolak(){
			$where = "is_delete = 0 AND is_selesai = 1 ";
			$searchValue = $_POST['text'];
			if ($searchValue != '') {
				$where .= " and (nama_produk like '%" . $searchValue . "%'
									 OR no_nota like '%" . $searchValue . "%'			
				) ";
			}
	
			if($_POST['tgl1'] !=='' && $_POST['tgl2'] !==''){
				$tgl1 = date('Y-m-d',strtotime($_POST['tgl1'])).' 00:00:00';
				$tgl2 = date('Y-m-d',strtotime($_POST['tgl2'])).' 23:59:00';
				$where .= " AND insert_date BETWEEN '$tgl1' AND '$tgl2'";
			}else{
				$where .= "AND DATE_FORMAT(insert_date,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
			}
	
			$sql = "SELECT SUM(total_harga) AS total,SUM(jumlah_produk) AS qty_pro FROM tx_jual where $where";
			$data = $this->db->query($sql)->row();
	
			if(!empty($data)){
				echo json_encode(array('status'=>1,'msg'=>'Data Is Find','result'=>$data));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Not Find','result'=>null));
			}
		}
	
		public function load_data_penjualan_tertolak(){
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
			$where = " j.is_delete = 0 AND j.is_selesai = 1 ";
		
			// Search
			$searchQuery = "";
			if ($searchValue != '') {
				$searchQuery .= " and (j.nama_produk like '%" . $searchValue . "%'
									 OR j.no_nota like '%" . $searchValue . "%'
									 OR s.nama_satuan like '%" . $searchValue . "%'				
				) ";
			}
	
			if($_POST['tgl1'] !=='' && $_POST['tgl2'] !==''){
				$tgl1 = date('Y-m-d',strtotime($_POST['tgl1'])).' 00:00:00';
				$tgl2 = date('Y-m-d',strtotime($_POST['tgl2'])).' 23:59:00';
				$where .= " AND j.insert_date BETWEEN '$tgl1' AND '$tgl2'";
			}else{
				$where .= "AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
			}
		
			$where .=  $searchQuery .$jual.$rak;
		
			// Total number records without filtering
			$sql_count = "SELECT count(*) as allcount
			FROM `tx_jual` as j
			where is_delete = 0";
			$records = $this->db->query($sql_count)->row_array();
			$totalRecords = $records['allcount'];
		
			// Total number records with filter
			$sql_filter = "SELECT count(*) as allcount
			FROM `tx_jual` as j
			LEFT JOIN tm_satuan as s ON j.id_satuan = s.id_satuan
			LEFT JOIN tx_produk_stok as ps ON j.id_produk = ps.id_produk
			WHERE $where";
			$records = $this->db->query($sql_filter)->row_array();
			$totalRecordsFilter = $records['allcount'];
		
			// Fetch Records
			$sql = "SELECT j.id_produk,j.id_jual,j.nama_produk,j.jumlah_produk,s.nama_satuan,
			CONCAT(j.jumlah_produk,' ',s.nama_satuan) as jumlah_nama_satuan,
			j.total_harga,ps.jumlah_stok,j.no_nota
			FROM `tx_jual` as j
			LEFT JOIN tm_satuan as s ON j.id_satuan = s.id_satuan
			LEFT JOIN tx_produk_stok as ps ON j.id_produk = ps.id_produk
			WHERE $where
			order by id_jual " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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
	
		public function export_data_penjualan_tertolak(){
			$spreadsheet = new Spreadsheet();
			$sheet = $spreadsheet->getActiveSheet();
			$sheet->setCellValue('B1',"Apotik Nawasena 24 JAM");
			$sheet->setCellValue('A2', "No");
			$sheet->setCellValue('B2', "No Nota");
			$sheet->setCellValue('C2', "Nama Produk");
			$sheet->setCellValue('D2', "Jumlah");
			$sheet->setCellValue('E2', "Satuan");
			$sheet->setCellValue('F2', "Total Penjualan");
	
			$where = " j.is_delete = 0 AND j.is_selesai = 1 ";
	
			$searchValue = $_GET['text'];
			if ($searchValue != '') {
				$where .= " AND (j.nama_produk like '%" . $searchValue . "%'
									 OR j.no_nota like '%" . $searchValue . "%'
									 OR s.nama_satuan like '%" . $searchValue . "%'				
				) ";
			}
	
			if($_GET['tgl1'] !=='' && $_GET['tgl2'] !==''){
				$tgl1 = date('Y-m-d',strtotime($_GET['tgl1'])).' 00:00:00';
				$tgl2 = date('Y-m-d',strtotime($_GET['tgl2'])).' 23:59:00';
				$where .= " AND j.insert_date BETWEEN '$tgl1' AND '$tgl2'";
			}else{
				$where .= "AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
			}
	
	
			$sql ="SELECT j.id_produk,j.id_jual,j.nama_produk,j.jumlah_produk,s.nama_satuan,
			j.jumlah_produk,s.nama_satuan,
			j.total_harga,ps.jumlah_stok,j.no_nota
			FROM `tx_jual` as j
			LEFT JOIN tm_satuan as s ON j.id_satuan = s.id_satuan
			LEFT JOIN tx_produk_stok as ps ON j.id_produk = ps.id_produk
			WHERE $where";
	
			$data_jual = $this->db->query($sql)->result_array();
	
			$sql = "SELECT SUM(j.total_harga) AS total,SUM(j.jumlah_produk) AS qty_pro FROM tx_jual as j where $where";
			$data_sum = $this->db->query($sql)->row();
	
			// var_dump($data_sum);
	
			$no = 1; // Untuk penomoran tabel, di awal set dengan 1
			$numrow = 3;
			$fot = 4; // Set baris pertama untuk isi tabel adalah baris ke 4
			foreach($data_jual as $data){ // Lakukan looping pada variabel siswa
			  $sheet->setCellValue('A'.$numrow, $no);
			  $sheet->setCellValue('B'.$numrow, $data['no_nota']);
			  $sheet->setCellValue('C'.$numrow, $data['nama_produk']);
			  $sheet->setCellValue('D'.$numrow, $data['jumlah_produk']);
			  $sheet->setCellValue('E'.$numrow, $data['nama_satuan']);
			  $sheet->setCellValue('F'.$numrow, $data['total_harga']);
			  
			  $no++; // Tambah 1 setiap kali looping
			  $numrow++; // Tambah 1 setiap kali looping
			  $fot++;
			}
			$sheet->setCellValue('C'.$fot, "Total :");
			$sheet->setCellValue('D'.$fot, $data_sum->qty_pro);
			$sheet->setCellValue('F'.$fot, $data_sum->total);
			$sheet->getStyle('C'.$fot,)->getFont()->setBold(true);
			$sheet->getStyle('F'.$fot,)->getFont()->setBold(true);
			$sheet->getStyle('D'.$fot,)->getFont()->setBold(true);
	
			$writer = new Xlsx($spreadsheet);
			
			ob_end_clean();
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename=Laporan_Penjualan.xls'); 
			header('Cache-Control: max-age=0');
			$writer->save('php://output');
		}
	
		// Laporan Penjualan End

}