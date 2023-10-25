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

		if($_POST['tgl1'] !='' && $_POST['tgl2'] !=''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
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

		if($_POST['tgl1'] !='' && $_POST['tgl2'] !=''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}else{
			$where .= "AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
		}

		// else{
		// 	$where .= " AND  DATE_FORMAT(j.insert_date,'%Y-%m-%d')  = DATE_FORMAT(NOW(),'%Y-%m-%d')";
		// }
	
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
		$sheet->setCellValue('A1',"Apotik Nawasena 24 JAM");
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

		if($_GET['tgl1'] !='' && $_GET['tgl2'] !=''){
			$tgl1 = $_GET['tgl1'];
			$tgl2 = $_GET['tgl2'];
			$where .= " AND DATE_FORMAT(j.insert_date,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
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
		$searchValue1 = $_POST['search']['value'];
		$searchValue = $_POST['text'];
		$where = " j.is_delete = 0 AND j.is_selesai = 1 AND p.is_delete = 0 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
			 					OR j.no_nota like '%" . $searchValue . "%'
								 OR p.sku_kode_produk like '%" . $searchValue . "%'				
			) ";
		}

		if($_POST['tgl1'] !='' && $_POST['tgl2'] !=''){
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
		$sql = "SELECT j.id_jual,p.sku_kode_produk,p.nama_produk,
		p.harga_beli,
		sum(j.jumlah_produk) as tot_produk_jual,
		(p.harga_beli * sum(j.jumlah_produk)) as tot_harga_beli,
		sum(j.harga_jual) as tot_harga_jual,
		(sum(j.harga_jual) - p.harga_beli * sum(j.jumlah_produk)) as margin
		FROM `tx_jual` as j
		LEFT JOIN tx_produk as p ON j.id_produk = p.id_produk
		WHERE $where
		GROUP BY p.id_produk
		order by id_jual " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

}