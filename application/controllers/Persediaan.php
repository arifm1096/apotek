<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Persediaan extends CI_Controller {

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
		$var['content'] = 'view-persediaan';
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
		REPLACE(GROUP_CONCAT(phg.nama_jenis_harga),',','<br>') as nama_harga, phg.id_jenis_harga,
		REPLACE(GROUP_CONCAT(phg.marup),',','<br>') as margin
		FROM tx_produk as p
		LEFT JOIN tx_produk_stok as ps ON ps.id_produk = p.id_produk
		LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
		LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan 
		LEFT JOIN (SELECT p.id_produk,ph.id_jenis_harga,ph.id_harga,p.harga_beli,ph.harga_jual,(ph.harga_jual - p.harga_beli) as marup, jg.nama_jenis_harga
					FROM tx_produk as p
					LEFT JOIN tx_produk_harga as ph ON p.id_produk = ph.id_produk
					LEFT JOIN tm_jenis_harga as jg ON ph.id_jenis_harga = jg.id_jenis_harga
				   ) as phg ON p.id_produk = phg.id_produk
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
		$ext = 0;
		$msg ="";
		$user = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();
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
			'insert_date' => $datetime->time
		);

		$data_his = array(
			'id_produk' => $_POST['id_produk'],
			'id_gudang' => $this->session->userdata('gudang'),
			'jumlah_stok' => $_POST['jumlah'],
			'exp_date' => $tgl_exp,
			'id_supplier'=> $_POST['supplier'],
			'id_satuan' => $_POST['id_satuan'],
			'harga_beli' => $_POST['harga_beli'],
			'id_status_stok' => "1",
			'insert_by' => $user,
			'insert_date' => $datetime->time
		);

		if($ext > 0){
			if($_POST['id_stok'] == "null"){
				$data['insert_by'] = $user;
				$this->db->insert('tx_produk_stok',$data);
				$insert_id = $this->db->insert_id();
				if($insert_id !== 0){
					$data_his['id_stok'] = $insert_id;
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
		
		$sql = "SELECT ps.insert_date as tgl, ps.kode_batch, p.sku_kode_produk,ps.exp_date,u.nama as petugas,
				sum(case when s.status_in_out = 1 then ps.jumlah_stok else 0 end) as masuk, 
				sum(case when s.status_in_out = 0 then ps.jumlah_stok else 0 end) as keluar,
				CONCAT(s.nama_status,' ','Stok',' ',p.nama_produk) as catat
				FROM `tx_produk_stok_detail` as ps
				LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
				LEFT JOIN tm_satus_stok as s ON ps.id_status_stok = s.id_status_stok
				LEFT JOIN tm_user as u ON ps.insert_by = u.id_user
				WHERE ps.is_delete = 0 AND p.id_produk =$id $where
				GROUP BY ps.id_stok_detail";
		$data = $this->db->query($sql);

		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','data'=>$data->result()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data not Found','data'=>null));
		}
	}

	public function get_stok_produk(){
		$id = $_POST['id_produk'];
		$sql ="SELECT ps.id_stok,p.nama_produk,g.nama_gudang,psd.exp_date,p.satuan_utama,ps.id_supplier,p.harga_beli,ps.jumlah_stok
				FROM `tx_produk_stok` as ps
				LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
				LEFT JOIN tm_gudang as g ON ps.id_gudang = g.id_gudang
				LEFT JOIN (SELECT id_stok,id_produk,harga_beli,exp_date,id_satuan,id_supplier
				FROM `tx_produk_stok_detail`
				WHERE id_produk = $id
				ORDER BY id_stok_detail DESC
				LIMIT 1) as psd ON ps.id_produk = psd.id_produk
				WHERE ps.id_produk = $id";
		
		$ext = $this->db->query($sql);

		if($ext){
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','data'=>$ext->row()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Null','data'=>null));
		}
	}

	public function save_edit_stok(){
		$user = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();
		$id = $_POST['id_stok'];
		$id_p = $_POST['id_produk'];
		$jumlah = $_POST['jumlah_stok'];
		if($id !==""){
			$data = array(
				'jumlah_stok' =>$jumlah,
				'update_by'=> $user,
				'update_date'=> $datetime->time
			);
			$sql = $this->db->where('id_stok',$id)->update('tx_produk_stok',$data);

			$sql_d = "SELECT id_stok,id_produk,harga_beli,exp_date,id_satuan,id_supplier,id_stok_detail
			FROM `tx_produk_stok_detail`
			WHERE id_produk = $id_p
			ORDER BY id_stok_detail DESC
			LIMIT 1";

			$data_p = $this->db->query($sql_d)->row();
			$id_psd = $data_p->id_stok_detail;
			// var_dump($id_psd);
			$sql_psd = $this->db->where('id_stok_detail',$id_psd)->update('tx_produk_stok_detail',$data);

			if($sql && $sql_psd){
				echo json_encode(array('status'=>1,'msg'=>'Stok Success DiPerbarui'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Stok Gagal DiPerbarui'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Parameter Null'));
		}
	}

	public function export_excel_kartu_stok(){
		$id = $_GET['id_produk'];
		$where = "";
		if($_GET['bulan'] !=='pil' && $_GET['tahun'] !==""){
			$bln_th = $_GET['tahun'].'-'.$_GET['bulan'];
			$where .=" AND DATE_FORMAT(ps.insert_date, '%Y-%m') = '$bln_th'";
		}

		if($_GET['id_gudang'] !=='pil'){
			$gd = $_GET['id_gudang'] ;
			$where .=" AND ps.id_gudang = $gd ";
		}

		if($_GET['kode_batch'] !==""){
			$kd = $_GET['kode_batch'];
			$where .=" OR ps.kode_batch LIKE '%$kd%'";
		}
		
		$sql = "SELECT ps.insert_date as tgl, ps.kode_batch, p.sku_kode_produk,ps.exp_date,u.nama as petugas,
				sum(case when s.status_in_out = 1 then ps.jumlah_stok else 0 end) as masuk, 
				sum(case when s.status_in_out = 0 then ps.jumlah_stok else 0 end) as keluar,
				CONCAT(s.nama_status,' ','Stok',' ',p.nama_produk) as catat
				FROM `tx_produk_stok_detail` as ps
				LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
				LEFT JOIN tm_satus_stok as s ON ps.id_status_stok = s.id_status_stok
				LEFT JOIN tm_user as u ON ps.insert_by = u.id_user
				WHERE ps.is_delete = 0 AND p.id_produk =$id $where
				GROUP BY ps.id_stok_detail";
		$data = $this->db->query($sql)->result();
		// var_dump($data);

		$pro = $this->db->select('nama_produk')
						->from('tx_produk')
						->where('id_produk',$id)
						->get()
						->row();
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('A1', "Nama Produk");
		$sheet->setCellValue('B1', $pro->nama_produk);
        $sheet->setCellValue('A2', "No");
        $sheet->setCellValue('B2', "Tanggal");
        $sheet->setCellValue('C2', "Catatan Transaksi");
        $sheet->setCellValue('D2', "Kode KSU");
        $sheet->setCellValue('E2', "Expired");
		$sheet->setCellValue('F2', "Petugas");
		$sheet->setCellValue('G2', "Masuk");
		$sheet->setCellValue('H2', "Keluar");
		$sheet->setCellValue('I2', "Sisa");

		$no = 2; // Untuk penomoran tabel, di awal set dengan 1
        $numrow = 3; // Set baris pertama untuk isi tabel adalah baris ke 4
		$sisa = 0;

        foreach($data as $val){ // Lakukan looping pada variabel siswa
          $sheet->setCellValue('A'.$numrow, $no);
          $sheet->setCellValue('B'.$numrow, $val->tgl);
          $sheet->setCellValue('C'.$numrow, $val->catat);
          $sheet->setCellValue('D'.$numrow, $val->sku_kode_produk);
          $sheet->setCellValue('E'.$numrow, $val->exp_date);
		  $sheet->setCellValue('F'.$numrow, $val->petugas);
		  $sheet->setCellValue('G'.$numrow, $val->masuk);
		  $sheet->setCellValue('H'.$numrow, $val->keluar);
		  $sisa += (int)$val->masuk - $val->keluar ;
		  $sheet->setCellValue('I'.$numrow, $sisa);
          $no++; // Tambah 1 setiap kali looping
          $numrow++; // Tambah 1 setiap kali looping
        }

        $writer = new Xlsx($spreadsheet);
        
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=Kartu_stok.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
	}

	public function export_pdf_kartu_stok(){
		$id = $_GET['id_produk'];
		$where = "";
		if($_GET['bulan'] !=='pil' && $_GET['tahun'] !==""){
			$bln_th = $_GET['tahun'].'-'.$_GET['bulan'];
			$where .=" AND DATE_FORMAT(ps.insert_date, '%Y-%m') = '$bln_th'";
		}

		if($_GET['id_gudang'] !=='pil'){
			$gd = $_GET['id_gudang'] ;
			$where .=" AND ps.id_gudang = $gd ";
		}

		if($_GET['kode_batch'] !==""){
			$kd = $_GET['kode_batch'];
			$where .=" OR ps.kode_batch LIKE '%$kd%'";
		}
		
		$sql = "SELECT ps.insert_date as tgl, ps.kode_batch, p.sku_kode_produk,ps.exp_date,u.nama as petugas,
				sum(case when s.status_in_out = 1 then ps.jumlah_stok else 0 end) as masuk, 
				sum(case when s.status_in_out = 0 then ps.jumlah_stok else 0 end) as keluar,
				CONCAT(s.nama_status,' ','Stok',' ',p.nama_produk) as catat
				FROM `tx_produk_stok_detail` as ps
				LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
				LEFT JOIN tm_satus_stok as s ON ps.id_status_stok = s.id_status_stok
				LEFT JOIN tm_user as u ON ps.insert_by = u.id_user
				WHERE ps.is_delete = 0 AND p.id_produk =$id $where
				GROUP BY ps.id_stok_detail";
		$var['data'] = $this->db->query($sql)->result();
		// var_dump($data);

		$id_user = $this->session->userdata('id_user');
		$sql = "SELECT w.nama_wilayah,w.alamat,w.no_hp,w.logo
				FROM tm_user as u 
				LEFT JOIN tm_wilayah as w ON u.gudang = w.id_wilayah
				WHERE u.id_user = $id_user";
		$var['kop'] = $this->db->query($sql)->row();

		ob_start();
		$this->load->view('print/print-kartu-stok',$var);
		$html = ob_get_contents();
			ob_end_clean();
			require_once('./assets/html2pdf/html2pdf.class.php');
		$resolution = array(215, 330);
		$pdf = new HTML2PDF('P',$resolution,'en', true, 'UTF-8', array(4, 2, 3, 2));
		$pdf->WriteHTML($html);
		$pdf->Output('korwil.pdf', 'P');
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
		$where = " p.is_delete = 0 AND pd.status_op_ed = 0 ";
	
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
			$where .= " AND DATE_FORMAT(DATE_ADD(now(),INTERVAL +3 month), '%Y-%m') >= DATE_FORMAT(pd.exp_date,'%Y-%m')";
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

	public function export_excel_ed(){

		$where = " p.is_delete = 0 AND pd.status_op_ed = 0 ";
		$searchValue = $_GET['text'];
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


		if($_GET['bulan'] !=="pil"){
			$bulan = $_GET['bulan'];
			$where .= " AND DATE_FORMAT(DATE_ADD(now(),INTERVAL +$bulan month), '%Y-%m') = DATE_FORMAT(pd.exp_date,'%Y-%m')";
		}
		

		if($_GET['filter_tanggal'] !==""){
			$tgl = date('Y-m-d',strtotime($_GET['filter_tanggal']));
			$where .= " AND pd.exp_date < '$tgl' ";
		}

		if($_GET['bulan'] =="pil" && $_GET['filter_tanggal'] ==""){
			$where .= " AND DATE_FORMAT(DATE_ADD(now(),INTERVAL +3 month), '%Y-%m') >= DATE_FORMAT(pd.exp_date,'%Y-%m')";
		}
	
		$where .= " AND pd.is_delete = 0 ".$searchQuery;

		$sql = "SELECT p.nama_produk,p.sku_kode_produk,s.nama_supplier,g.nama_gudang,
				pd.exp_date,pd.jumlah_stok,pd.id_stok_detail,p.id_produk,
				DATE_FORMAT(now(), '%Y-%m-%d') as now_date
				FROM `tx_produk_stok_detail` as pd
				LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
				LEFT JOIN tm_supplier as s on pd.id_supplier = s.id_supplier
				LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
		WHERE $where
		GROUP BY pd.id_stok_detail
		order by pd.id_stok_detail desc";

		$var['data'] = $this->db->query($sql)->result();
		$this->load->view('v-stok-kadaluarsa',$var);
	}

	public function export_pdf_ed(){

		$where = " p.is_delete = 0 AND pd.status_op_ed = 0 ";
		$searchValue = $_GET['text'];
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


		if($_GET['bulan'] !=="pil"){
			$bulan = $_GET['bulan'];
			$where .= " AND DATE_FORMAT(DATE_ADD(now(),INTERVAL +$bulan month), '%Y-%m') = DATE_FORMAT(pd.exp_date,'%Y-%m')";
		}
		

		if($_GET['filter_tanggal'] !==""){
			$tgl = date('Y-m-d',strtotime($_GET['filter_tanggal']));
			$where .= " AND pd.exp_date < '$tgl' ";
		}

		if($_GET['bulan'] =="pil" && $_GET['filter_tanggal'] ==""){
			$where .= " AND DATE_FORMAT(DATE_ADD(now(),INTERVAL +3 month), '%Y-%m') >= DATE_FORMAT(pd.exp_date,'%Y-%m')";
		}
	
		$where .= " AND pd.is_delete = 0 ".$searchQuery;

		$sql = "SELECT p.nama_produk,p.sku_kode_produk,s.nama_supplier,g.nama_gudang,
				pd.exp_date,pd.jumlah_stok,pd.id_stok_detail,p.id_produk,
				DATE_FORMAT(now(), '%Y-%m-%d') as now_date
				FROM `tx_produk_stok_detail` as pd
				LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
				LEFT JOIN tm_supplier as s on pd.id_supplier = s.id_supplier
				LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
		WHERE $where
		GROUP BY pd.id_stok_detail
		order by pd.id_stok_detail desc";

		$var['data'] = $this->db->query($sql)->result();
		

		$id_user = $this->session->userdata('id_user');
		$sql = "SELECT w.nama_wilayah,w.alamat,w.no_hp,w.logo
				FROM tm_user as u 
				LEFT JOIN tm_wilayah as w ON u.gudang = w.id_wilayah
				WHERE u.id_user = $id_user";
		$var['kop'] = $this->db->query($sql)->row();

		ob_start();
		$this->load->view('print/print-stok-kadaluarsa',$var);
		$html = ob_get_contents();
			ob_end_clean();
			require_once('./assets/html2pdf/html2pdf.class.php');
		$resolution = array(215, 330);
		$pdf = new HTML2PDF('P',$resolution,'en', true, 'UTF-8', array(4, 2, 3, 2));
		$pdf->WriteHTML($html);
		$pdf->Output('Stok Kadaluarsa.pdf', 'P');
	}

	public function get_status_ed(){
		$data = $this->db->select('*')
						->from('tm_status_op_ed')
						->get();
		if(!empty($data)){
			echo json_encode(array('status'=>1,'data'=>$data->result()));
		}else{
			echo json_encode(array('status'=>0,'data'=>null));
		}
	}

	public function get_stok_opname_ed(){
		$id = $_POST['id'];
		$sql ="SELECT psd.id_stok_detail,psd.id_produk,psd.jumlah_stok,psd.exp_date,p.nama_produk,s.nama_supplier,g.nama_gudang
		FROM `tx_produk_stok_detail` as psd
		LEFT JOIN tm_supplier as s on psd.id_supplier = s.id_supplier
		LEFT JOIN tx_produk as p ON psd.id_produk = p.id_produk
		LEFT JOIN tm_gudang as g ON psd.id_gudang = g.id_gudang
		WHERE psd.id_stok_detail =  $id";

		$data = $this->db->query($sql);

		if(!empty($data)){
			echo json_encode(array('status'=>1,'data'=>$data->row()));
		}else{
			echo json_encode(array('status'=>0,'data'=>null,'msg'=>'Data Not Found'));
		}
	}

	public function save_opname_ed(){
		$data = $this->input->post();
		$user = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();

		if($_POST['exp_date'] !=="" ){
			$data['update_by'] = $user;
			$data['update_date'] = $datetime->time;
			$data['exp_date'] = date('Y-m-d',strtotime($_POST['exp_date']));
			unset($data['id']);
			$id = $_POST['id'];
			
			$up = $this->db->where('id_stok_detail',$id)->update('tx_produk_stok_detail',$data);

			if($up){
				echo json_encode(array('status'=>1,'msg'=>'Success Opname Produk'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Gagal Opname Produk'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Lengkapi Inputan Terlebih Dahulu !'));
		}
	}

	public function load_kadaluarsa_home(){
		$sql = "SELECT p.nama_produk,p.sku_kode_produk,s.nama_supplier,g.nama_gudang,
				pd.exp_date,pd.jumlah_stok,pd.id_stok_detail,p.id_produk,
				DATE_FORMAT(now(), '%Y-%m-%d') as now_date
				FROM `tx_produk_stok_detail` as pd
				LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
				LEFT JOIN tm_supplier as s on pd.id_supplier = s.id_supplier
				LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
				WHERE p.is_delete = 0 AND DATE_FORMAT(DATE_ADD(now(),INTERVAL +3 month), '%Y-%m') >= DATE_FORMAT(pd.exp_date,'%Y-%m')
				order by pd.exp_date asc limit 10";
		$data = $this->db->query($sql);
		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','result'=>$data->result()));
		}else{
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','result'=>null));
		}
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
		FROM tx_produk
		where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM tx_produk as p
		LEFT JOIN tx_produk_stok as pd on pd.id_produk = p.id_produk
		LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
		LEFT JOIN tx_produk_stok_opname as sp ON pd.id_stok = sp.id_stok
		LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT p.nama_produk,p.sku_kode_produk,g.nama_gudang,
				pd.exp_date,pd.jumlah_stok,p.id_produk,pd.id_stok,r.nama_rak,
				IF (sp.tgl_so IS NULL ,'Belum Pernah',DATE_FORMAT(sp.tgl_so,'%d-%m-%Y')
				) as status_so,sp.tgl_so
				FROM tx_produk as p
		LEFT JOIN tx_produk_stok as pd on pd.id_produk = p.id_produk
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
				sp.catatan,sp.penyesuaian,p.sku_kode_produk,sp.id_stok_opname,s.nama_satuan
				FROM `tx_produk_stok` as pd
				LEFT JOIN tx_produk as p on pd.id_produk = p.id_produk
				LEFT JOIN tm_satuan as s ON p.satuan_utama = s.id_satuan
				LEFT JOIN tm_gudang as g on pd.id_gudang = g.id_gudang
				LEFT JOIN tx_produk_stok_opname as sp ON pd.id_stok = sp.id_stok
				LEFT JOIN tm_rak as r ON p.id_rak = r.id_rak
				WHERE pd.id_stok = $id";
		$data = $this->db->query($sql);
		
		if($data->num_rows()>0){
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','result'=>$data->row()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Stok Produk Belum Di Inputkan','result'=>null));
		}
	}

	public function save_stok_opname(){		
		$user = $this->session->userdata('id_user');
		$sql = "SELECT NOW() as jam";
		$time = $this->db->query($sql)->row();
		$ext = 0;
		$data = array (
					'tgl_so' => $time->jam,
					'stok_fisik' => $_POST['stok_fisik'],
					'penyesuaian' => $_POST['penyesuaian'],
					'catatan' => $_POST['catatan'],
					'verifikasi' => $_POST['verifikasi'],
		);

			if($_POST['id_stok_opname'] !==""){
				$data['insert_date']= $time->jam;
				$data['insert_by'] = $user;
				$data['id_stok'] = $_POST['id_stok'];
				$sql = $this->db->insert('tx_produk_stok_opname',$data);
				if($sql){
					$ext += 1;
				}
			}else{
				$data['update_date']= $time->jam;
				$data['update_by'] = $user;
				$id_stok = $_POST['id_stok'];
				$sql = $this->db->where('id_stok',$id_stok)->update('tx_produk_stok_opname',$data);
				if($sql){
					$ext += 1;
				}
			}

		
			$data['insert_date']= $time->jam;
			$data['insert_by'] = $user;
			$data['id_stok'] = $_POST['id_stok'];
			$sql_detail = $this->db->insert('tx_produk_stok_opname_detail',$data);

			if($sql_detail){
				$ext += 1;
			}

			if($ext > 0){
				echo json_encode(array('status'=>1,'msg'=>'Data Berhasil Di Stok Opname'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Error Data Di Stok Opname'));
			}

	}

	// startr Riwayat SO

	public function riwayat_stok_opname(){
		$var['content'] = 'view-detail_stok_opname';
		$var['js'] = 'js-detail_riwayat_stok_opname';
		$this->load->view('view-index',$var);
	}

	public function load_riwayat_stok_opname(){
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
		$where = " sd.is_delete = 0 ";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.sku_kode_produk like '%" . $searchValue . "%'
								 OR p.nama_produk like '%" . $searchValue . "%'		
								 OR sd.catatan like '%" . $searchValue . "%'
								  OR u.nama like '%" . $searchValue . "%'				
			) ";
		}

		if($_POST['tgl1'] !='' && $_POST['tgl2'] !=''){
			$tgl1 = $_POST['tgl1'];
			$tgl2 = $_POST['tgl2'];
			$where .= " AND DATE_FORMAT(sd.tgl_so,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}else{
			$where .= "AND DATE_FORMAT(sd.tgl_so,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
		}
	
		$where .=  $searchQuery ;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM tx_produk_stok_opname_detail
		where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_produk_stok_opname_detail` as sd
		LEFT JOIN tx_produk_stok as ps ON sd.id_stok = ps.id_stok
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		LEFT JOIN tm_user as u ON sd.insert_by = u.id_user
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT sd.id_stok_opname_detail,p.nama_produk,p.sku_kode_produk,ps.jumlah_stok,sd.stok_fisik,sd.penyesuaian,sd.catatan,sd.verifikasi,u.nama,sd.tgl_so
		FROM `tx_produk_stok_opname_detail` as sd
		LEFT JOIN tx_produk_stok as ps ON sd.id_stok = ps.id_stok
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		LEFT JOIN tm_user as u ON sd.insert_by = u.id_user
		WHERE $where
		order by sd.id_stok_opname_detail " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function export_data_riwayat_so(){
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
     
        $sheet->setCellValue('A1', "No");
        $sheet->setCellValue('B1', "Kode");
        $sheet->setCellValue('C1', "Nama Produk");
		$sheet->setCellValue('D1', "Tgl. SO");
        $sheet->setCellValue('E1', "Stok sistem");
        $sheet->setCellValue('F1', "Stok Fisik");
		$sheet->setCellValue('G1', "Penyesuaian");
		$sheet->setCellValue('H1', "Catatan");
		$sheet->setCellValue('I1', "Verifikasi");
		$sheet->setCellValue('J1', "User");

		$where = " sd.is_delete = 0";

		$searchValue = $_GET['text'];
		if ($searchValue != '') {
			$where .= " AND (p.sku_kode_produk like '%" . $searchValue . "%'
							OR p.nama_produk like '%" . $searchValue . "%'
							OR sd.catatan like '%" . $searchValue . "%'
							OR u.nama like '%" . $searchValue . "%'			
			) ";
		}

		if($_GET['tgl1'] !='' && $_GET['tgl2'] !=''){
			$tgl1 = $_GET['tgl1'];
			$tgl2 = $_GET['tgl2'];
			$where .= " AND DATE_FORMAT(sd.tgl_so,'%d-%m-%Y') BETWEEN '$tgl1' AND '$tgl2'";
		}else{
			$where .= "AND DATE_FORMAT(sd.tgl_so,'%d-%m-%Y') = DATE_FORMAT(NOW(),'%d-%m-%Y')";
		}

		$sql ="SELECT sd.id_stok_opname_detail,p.nama_produk,p.sku_kode_produk,ps.jumlah_stok,sd.stok_fisik,
		sd.penyesuaian,sd.catatan,sd.verifikasi,u.nama,sd.tgl_so
		FROM `tx_produk_stok_opname_detail` as sd
		LEFT JOIN tx_produk_stok as ps ON sd.id_stok = ps.id_stok
		LEFT JOIN tx_produk as p ON ps.id_produk = p.id_produk
		LEFT JOIN tm_user as u ON sd.insert_by = u.id_user
		WHERE $where";

		$data_jual = $this->db->query($sql)->result_array();
		echo $this->db->last_query();
        $no = 1; // Untuk penomoran tabel, di awal set dengan 1
        $numrow = 3;
        foreach($data_jual as $data){ // Lakukan looping pada variabel siswa
          $sheet->setCellValue('A'.$numrow, $no);
          $sheet->setCellValue('B'.$numrow, $data['sku_kode_produk']);
          $sheet->setCellValue('C'.$numrow, $data['nama_produk']);
          $sheet->setCellValue('D'.$numrow, $data['tgl_so']);
          $sheet->setCellValue('E'.$numrow, $data['jumlah_stok']);
		  $sheet->setCellValue('F'.$numrow, $data['stok_fisik']);
		  $sheet->setCellValue('G'.$numrow, $data['penyesuaian']);
		  $sheet->setCellValue('H'.$numrow, $data['catatan']);
		  $sheet->setCellValue('I'.$numrow, $data['verifikasi']);
		  $sheet->setCellValue('J'.$numrow, $data['nama']);
          $no++; // Tambah 1 setiap kali looping
          $numrow++;
        }
        $writer = new Xlsx($spreadsheet);
		$time = $this->db->select('now() as wkt')->get()->row();
        
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=Riwayat_SO'.$time->wkt.'.xls');
		header('Cache-Control: max-age=0');
		$writer->save('php://output');
	}

	

}