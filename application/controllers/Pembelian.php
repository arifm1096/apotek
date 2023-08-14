<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Pembelian extends CI_Controller {

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
		$this->load->model('Model_penjualan');

		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
		
	}

	// Rencana Pembelian Start
	public function rencana_pembelian(){
		$var['content'] = 'view-rencana-beli';
		$var['js'] = 'js-rencana-beli';
		$this->load->view('view-index',$var);
	}

	public function get_produk_pesan(){
		$sql = "SELECT nama_produk,id_produk FROM `tx_produk` WHERE is_delete = 0 ORDER BY nama_produk asc";
		$data = $this->db->query($sql)->result();

		$sql_jp = "SELECT nama_jenis_pesanan,id_jenis_pesanan FROM `tm_jenis_pesanan`";
		$data_jp = $this->db->query($sql_jp)->result();

		$sql_st = "SELECT nama_satuan,id_satuan FROM `tm_satuan` where is_delete = 0";
		$data_st = $this->db->query($sql_st)->result();
		
		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data Find','produk'=>$data,'jenis_pesanan'=>$data_jp,'satuan'=>$data_st));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Find','produk'=>null,'jenis_pesanan'=>null,'satuan'=>null));
		}
	}

	public function save_produk(){
		$data = $this->input->post();

		if($data !==""){
			unset($data['nama_produk']);
			$sql = $this->db->insert('tx_beli_rencana',$data);
			if($sql){
				echo json_encode(array('status'=>1,'msg'=>'Success Insert Data'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Filed Insert Data'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Empty'));
		}
	}

	public function load_data_produk(){
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
		$where = " r.is_delete = 0 AND r.is_selesai = 0";
	
		// Search
		$searchQuery = "";
		if ($searchValue != '') {
			$searchQuery .= " and (p.nama_produk like '%" . $searchValue . "%'
			 					OR t.nama_satuan like '%" . $searchValue . "%'			
			) ";
		}
	
		$where .=  $searchQuery;
	
		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_beli_rencana`
		where is_delete = 0 and is_selesai = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];
	
		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_beli_rencana` as r
		LEFT JOIN tx_produk as p ON r.id_produk = p.id_produk
		LEFT JOIN tx_produk_stok as s on r.id_produk = s.id_produk
		LEFT JOIN tm_satuan as t ON r.id_satuan = t.id_satuan
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];
	
		// Fetch Records
		$sql = "SELECT p.nama_produk,r.jumlah_produk,t.nama_satuan,CONCAT(s.jumlah_stok,' ',t.nama_satuan) as stok,r.id_rencana_beli
				FROM `tx_beli_rencana` as r
				LEFT JOIN tx_produk as p ON r.id_produk = p.id_produk
				LEFT JOIN tx_produk_stok as s on r.id_produk = s.id_produk
				LEFT JOIN tm_satuan as t ON r.id_satuan = t.id_satuan
		WHERE $where
		order by id_rencana_beli " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function hapus_produk(){
		$id = $_POST['id'];

		$sql = $this->where('')
	}
	// Rencana Pembelian End

	public function membuat_pesanan(){
		$var['content'] = 'view-kasir';
		$var['js'] = 'js-kasir';
		$this->load->view('view-index-kasir',$var);
	}



	public function get_satuan(){
		$sql_satuan = $this->db->select('*')
						->from('tm_satuan')
						->where('is_delete',0)
						->where('aktif','y')
						->get();
		$data_satuan = $sql_satuan->result();

		$sql_harga = $this->db->select('*')
						->from('tm_jenis_harga')
						->where('is_delete',0)
						->get();
		$data_harga = $sql_harga->result();

		if(!empty($sql_satuan)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','satuan'=>$data_satuan,'harga'=>$data_harga));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data not Find','satuan'=>null,'harga'=>null));
		}
	}

	public function get_sub_total(){
		$id_user = $this->session->userdata('id_user');
		$sql_tot = "SELECT SUM(j.total_harga) as sub_total_harga
					FROM `tx_jual` as j
					LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
					WHERE j.insert_by = $id_user
					AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 0";
		$data_tot = $this->db->query($sql_tot)->row();

		if(!empty($data_tot)){
			return $data_tot->sub_total_harga;
		}else{
			return null;
		}

	}

	public function cek_produk($param){
		$sql_cek_satuan = "SELECT satuan_utama,nama_produk FROM `tx_produk` WHERE is_delete = 0 AND nama_produk ='$param' OR barcode ='$param'";
		$data_satuan = $this->db->query($sql_cek_satuan)->row();
		if($data_satuan->satuan_utama !== null){
			$sql_cek_stok = "SELECT p.satuan_utama,s.jumlah_stok,p.nama_produk
								FROM `tx_produk` as p
								LEFT JOIN tx_produk_stok as s ON p.id_produk = s.id_produk
								WHERE  p.is_delete = 0 AND nama_produk ='$param' OR barcode ='$param'";
			$data_stok = $this->db->query($sql_cek_stok);
			$stok = $data_stok ->row();
			if($stok->jumlah_stok > 0){
				return 1;
			}else{
				return "Stok Produk <b>".$stok->nama_produk."</b> Habis";
			}
			
		}else{
			return "Data Satuan Belum Di Inputkan";
		}


	}

	public function get_add_produk(){
		$produk = $_POST['produk_barcode'];
		$datetime = $this->db->select('now() as time')->get()->row();

		if(!empty($produk)){
			$sql_get_data = "SELECT p.id_produk,p.satuan_utama,p.nama_produk,p.harga_beli,ph.harga_jual,ph.id_jenis_harga
								FROM `tx_produk` as p
								LEFT JOIN tx_produk_harga as ph ON p.id_produk = ph.id_produk
								WHERE nama_produk = '$produk' OR barcode = '$produk' 
								AND ph.id_jenis_harga = 4 AND p.is_delete = 0";
			$data = $this->db->query($sql_get_data);
			
				$prod_data = $data->row();
				$r_in = array(
						'id_produk' => $prod_data->id_produk,
						'nama_produk' => $prod_data->nama_produk,
						'id_satuan' => $prod_data->satuan_utama,
						'id_satuan_utama' => $prod_data->satuan_utama,
						'id_jenis_harga' => $prod_data->id_jenis_harga,
						'harga_beli' => $prod_data->harga_beli,
						'harga_jual' => $prod_data->harga_jual,
						'jumlah_produk' => 1,
						'total_harga' => $prod_data->harga_jual,
						'insert_by' => $this->session->userdata('id_user'),
						'insert_date' => $datetime->time
				);
			$id_user = $this->session->userdata('id_user');
			$sql_jul ="SELECT j.id_jual,p.id_produk,p.nama_produk,j.id_satuan,SUM(jumlah_produk) as qty,j.id_jenis_harga,j.harga_jual,
				SUM(j.total_harga) as total_harga
				FROM `tx_jual` as j
				LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
				WHERE j.insert_by = $id_user and p.id_produk = $prod_data->id_produk
				AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 0
				GROUP BY j.id_jual";
			$res_jual = $this->db->query($sql_jul);
			$data_jual = $res_jual->row();
			$up_jumlah = 0;
			$up_total = 0;
				if($res_jual->num_rows()>0){
					$up_jumlah += $data_jual->qty + 1;
					$up_total += $data_jual->total_harga + $prod_data->harga_jual;
				}
				

				$r_up = array(
					'jumlah_produk' => $up_jumlah,
					'total_harga' => $up_total
				);

			$ex = 0;
			$cek = $this->cek_produk($produk);
			if($cek == 1){
				if(!empty($data)){
						if($res_jual->num_rows()>0){
							$update = $this->db->where('id_jual',$data_jual->id_jual)->update('tx_jual',$r_up);
							if($update){
								$ex +=1;
							}
						}else{
							$insert = $this->db->insert('tx_jual',$r_in);
							if($insert){
								$ex +=1;
							}
						}
					
					if($ex > 0){
						echo json_encode(array('status'=>1,'msg'=>'Success Tambah Data.'));
					}else{
						echo json_encode(array('status'=>0,'msg'=>'Error Tambah Data.'));
					}
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Nama Produk Atau Barcode Tidak Ada DI Master !!'));
				}
			}else{
				echo json_encode( array('status'=>0 , 'msg'=>$cek));
			}
			
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Masuk Data !!'));
		}
	}

	public function get_nom_change(){
		$id_jual = $_POST['id'];
		$id_user = $this->session->userdata('id_user');
		$date_time = date('Y-m-d H:i:s');
		$where = "";
		$val = $_POST['val'];
		$nom = 0;

		// satuan
		// if($_POST['el']== 2){
			$sat = $_POST['sat'];
			$sql_cek = "SELECT * FROM `tx_jual` WHERE id_satuan_utama =$sat and id_jual =$id_jual";
			$cek = $this->db->query($sql_cek);
			if($cek->num_rows()==0){
				$where .=" AND d.id_satuan = $sat ";
			}else{
				$where .=" AND j.id_satuan_utama = $sat ";
				$nom +=1;
			}
		// }
		// Jenis Harga
		// if($_POST['el']== 3){
			$ejn_har = $_POST['jen_har'];
			$where .=" AND h.id_jenis_harga = $ejn_har";
		// }
		
		$sql = "SELECT j.id_jual,p.id_produk,p.nama_produk,j.id_satuan,j.jumlah_produk as qty,j.id_jenis_harga,
				j.harga_jual,h.harga_jual as jual_ex,d.jumlah_produk_p,d.jumlah_produk as jum_p,j.id_satuan_utama
				FROM `tx_jual` as j
				LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
				LEFT JOIN tx_produk_harga as h ON p.id_produk = h.id_produk
				LEFT JOIN tx_produk_detail as d ON p.id_produk = d.id_produk
				WHERE j.id_jual = $id_jual $where
				AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 0
				GROUP BY j.id_jual";
		$get_data = $this->db->query($sql);
		if($get_data->num_rows()>0){
			$data = $get_data->row();
			$res_up = array(
				     'update_by' =>$id_user,
					 'update_date' => $date_time
					);
			$p_kali = 0;
				$sql_sat = "SELECT j.id_jual,j.nama_produk,j.jumlah_produk,j.harga_jual,h.jumlah_produk_p
							FROM `tx_jual` as j
							LEFT JOIN tx_produk_detail as h on j.id_produk = h.id_produk AND j.id_satuan = h.id_satuan
							WHERE j.insert_by = $id_user and j.id_jual = $id_jual 
							AND j.is_delete = 0 AND j.is_selesai = 0";
				$data_sat = $this->db->query($sql_sat)->row();
				if($data_sat->jumlah_produk_p==""){
					$p_kali += 1;
				}else{
					$p_kali += (int)$data_sat->jumlah_produk_p;
				}
			if($_POST['el']== 1){
				
				$tot_qty = (int) $val;
					$res_up['jumlah_produk'] = $val;
					$res_up['harga_jual'] = (int)$data->jual_ex * (int)$p_kali;
					$res_up['total_harga'] = (int)$data->jual_ex * (int)$tot_qty * (int)$p_kali;
			}

			if($_POST['el']== 2){
				$sum = 0;
				$val_fix ="";
				$jum_1 = (int)$data->jum_p;
				$jum_2 = (int)$data->jumlah_produk_p;

				if($nom == 1){
					$sum += 1;
				}else if($jum_1 < $jum_2){
					$sum += $jum_1 * $jum_2;
				}else{
					$sum += $jum_1 / $jum_2;
				}

					$tot_qty = (int)$sum * (int)$data->qty;
					$res_up['id_satuan'] = $val;
					$res_up['harga_jual'] = (int)$data->jual_ex * (int)$sum;
					$res_up['total_harga'] = (int)$data->jual_ex * (int)$tot_qty;
			}

			if($_POST['el']== 3){
				
				$tot_qty = (int)$data->qty;
					$res_up['id_jenis_harga'] = $val;
					$res_up['harga_jual'] = $data->jual_ex * (int)$p_kali;
					$res_up['total_harga'] = (int)$data->jual_ex * (int)$tot_qty * (int)$p_kali;
			}

			$up_ex = $this->db->where('id_jual',$id_jual)->update('tx_jual',$res_up);
			$result = $this->db->select('harga_jual,total_harga')->from('tx_jual')->where('id_jual',$id_jual)->get();
			$sub_tot = $this->get_sub_total();
			if($up_ex){
				echo json_encode(array('status'=>1,'msg'=>'Data is Find','result'=>$result->row(),'sub_tot'=>$sub_tot));
			}else{
				echo json_encode(array('status'=>1,'msg'=>'Data is Find','result'=>null,'sub_tot'=>null));
			}

		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Tidak Ditemukan'));
		}
	}

	public function hapus_produk_kasir(){
		$id = $this->input->post('id');
		$datetime = $this->db->select('now() as time')->get()->row();
		$user = $this->session->userdata('id_user');
		if(!empty($id)){
			$del = $this->db->where('id_jual',$id)
							->update('tx_jual',array(
								'is_delete'=>1,
								'delete_by' => $user,
								'delete_date' => $datetime->time
							));
			if($del){
				echo json_encode(array('status'=>1,'msg'=>'Delete Data Berhasil !'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Error Delete NUll || Error Code : 7232'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Data NUll || Error Code : 7231'));
		}
	}

	public function clear_produk_kasir(){
		$datetime = $this->db->select('now() as time')->get()->row();
		$user = $this->session->userdata('id_user');
		if(!empty($user)){
			$del = $this->db->where('insert_by',$user)
							->where('is_selesai',0)
							->update('tx_jual',array(
								'is_delete'=>1,
								'delete_by' => $user,
								'delete_date' => $datetime->time
							));
			if($del){
				echo json_encode(array('status'=>1,'msg'=>'Delete Data Berhasil !'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Error Delete NUll || Error Code : 7232'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Data NUll || Error Code : 7231'));
		}
	}

	public function get_update_produk(){
		$sql_cek_kasir = "SELECT p.id_produk,SUM(total) as qty 
						FROM `tx_jual` as j
						LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
						WHERE nama_produk = '$produk' OR barcode = '$produk' 
						AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 0";
		$data_cek = $this->db->query($sql_cek_kasir);
	}

	public function get_update_stok(){
		$sql = "SELECT j.id_produk,j.nama_produk,pd.jumlah_stok,j.jumlah_produk,(pd.jumlah_stok-j.jumlah_produk) as sisa
				FROM  tx_jual as j
				LEFT JOIN `tx_produk_stok` as pd on pd.id_produk = j.id_produk
				WHERE j.is_selesai = 0  and j.insert_by = $user";
	}

	public function get_add_kasir(){
		$id_user = $this->session->userdata('id_user');
		$noTa = $this->Model_penjualan->get_no_nota($id_user);
		$datetime = $this->db->select('now() as time')->get()->row();
		$data = array(
						'no_nota' => $noTa,
						'tgl_transaksi' => $datetime->time,
						'sub_tot' => str_replace("Rp ","",str_replace(".","",$_POST['sub'])),
						'service' => str_replace(".","",$_POST['ser']),
						'embalase' => str_replace(".","",$_POST['emb']),
						'lain'	=> str_replace(".","",$_POST['lai']),
						'total' => str_replace(".","",$_POST['tot']),
						'jumlah_uang' => str_replace(".","",$_POST['jumlah_uang']),
						'kembalian' => $_POST['kembalian'],
						'id_wilayah'=> $this->session->userdata('gudang'),
						'insert_by' => $id_user,
						'insert_date' => $datetime->time

					);
					
		
		$this->db->insert('tx_kasir', $data);
   		$insert_id = $this->db->insert_id();

		$data_up = array(
						'id_kasir'=>$insert_id,
						'no_nota'=>$noTa
		);

		if(!empty($insert_id)){
			$up = $this->db->where('insert_by',$id_user)
						   ->where('is_selesai',0)
						   ->where('is_delete',0)
						   ->update('tx_jual',$data_up);
			if($up){
				echo json_encode(array('status'=>1,'msg'=>'Untuk Print Struk Klik, <b>Print</b> atau Pencet Keyboard P','id'=>$insert_id));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Error Update Produk Jual','id'=>null));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Insert Kasir Error','id'=>null));
		}
	}

	public function cetak_struk() {
        // me-load library escpos
        $this->load->library('escpos');
		$id_user = $this->session->userdata('id_user');
		// $id_kasir = $this->input->post('id_kasir');
		$id_kasir = $_POST['id_kasir'];
		$data = $this->Model_penjualan->get_user($id_user);
		$kasir = $this->Model_penjualan->get_kasir_detail($id_kasir);
		$jual = $this->Model_penjualan->get_produk_jual($id_kasir);
		$nama_print = $data->nama_print;
		
     
		try {
			$connector = new Escpos\PrintConnectors\WindowsPrintConnector($nama_print);
			$printer = new Escpos\Printer($connector);

			function buatBaris4Kolom($kolom1, $kolom2, $kolom3, $kolom4) {
            // Mengatur lebar setiap kolom (dalam satuan karakter)
				 $lebar_kolom_1 = 8;
				 $lebar_kolom_2 = 6;
				 $lebar_kolom_3 = 6;
				 $lebar_kolom_4 = 9;

				$kolom1 = wordwrap($kolom1, $lebar_kolom_1, "\n", true);
				$kolom2 = wordwrap($kolom2, $lebar_kolom_2, "\n", true);
				$kolom3 = wordwrap($kolom3, $lebar_kolom_3, "\n", true);
				$kolom4 = wordwrap($kolom4, $lebar_kolom_4, "\n", true);

				$kolom1Array = explode("\n", $kolom1);
				$kolom2Array = explode("\n", $kolom2);
				$kolom3Array = explode("\n", $kolom3);
				$kolom4Array = explode("\n", $kolom4);

				// Mengambil jumlah baris terbanyak dari kolom-kolom untuk dijadikan titik akhir perulangan
				$jmlBarisTerbanyak = max(count($kolom1Array), count($kolom2Array), count($kolom3Array), count($kolom4Array));

				// Mendeklarasikan variabel untuk menampung kolom yang sudah di edit
				$hasilBaris = array();

				// Melakukan perulangan setiap baris (yang dibentuk wordwrap), untuk menggabungkan setiap kolom menjadi 1 baris 
				for ($i = 0; $i < $jmlBarisTerbanyak; $i++) {

					// memberikan spasi di setiap cell berdasarkan lebar kolom yang ditentukan, 
					$hasilKolom1 = str_pad((isset($kolom1Array[$i]) ? $kolom1Array[$i] : ""), $lebar_kolom_1, " ");
					$hasilKolom2 = str_pad((isset($kolom2Array[$i]) ? $kolom2Array[$i] : ""), $lebar_kolom_2, " ");

					// memberikan rata kanan pada kolom 3 dan 4 karena akan kita gunakan untuk harga dan total harga
					$hasilKolom3 = str_pad((isset($kolom3Array[$i]) ? $kolom3Array[$i] : ""), $lebar_kolom_3, " ", STR_PAD_LEFT);
					$hasilKolom4 = str_pad((isset($kolom4Array[$i]) ? $kolom4Array[$i] : ""), $lebar_kolom_4, " ", STR_PAD_LEFT);

					// Menggabungkan kolom tersebut menjadi 1 baris dan ditampung ke variabel hasil (ada 1 spasi disetiap kolom)
					$hasilBaris[] = $hasilKolom1 . " " . $hasilKolom2 . " " . $hasilKolom3 . " " . $hasilKolom4;
				}

				// Hasil yang berupa array, disatukan kembali menjadi string dan tambahkan \n disetiap barisnya.
				return implode($hasilBaris, "\n") . "\n";
			}

			function buatBaris2Kolom($kolom1, $kolom2) {
            // Mengatur lebar setiap kolom (dalam satuan karakter)
				 $lebar_kolom_1 = 15;
				 $lebar_kolom_2 = 15;

				$kolom1 = wordwrap($kolom1, $lebar_kolom_1, "\n", true);
				$kolom2 = wordwrap($kolom2, $lebar_kolom_2, "\n", true);

				$kolom1Array = explode("\n", $kolom1);
				$kolom2Array = explode("\n", $kolom2);

				// Mengambil jumlah baris terbanyak dari kolom-kolom untuk dijadikan titik akhir perulangan
				$jmlBarisTerbanyak = max(count($kolom1Array), count($kolom2Array));

				// Mendeklarasikan variabel untuk menampung kolom yang sudah di edit
				$hasilBaris = array();

				// Melakukan perulangan setiap baris (yang dibentuk wordwrap), untuk menggabungkan setiap kolom menjadi 1 baris 
				for ($i = 0; $i < $jmlBarisTerbanyak; $i++) {

					// memberikan spasi di setiap cell berdasarkan lebar kolom yang ditentukan, 
					$hasilKolom1 = str_pad((isset($kolom1Array[$i]) ? $kolom1Array[$i] : ""), $lebar_kolom_1, " ",STR_PAD_LEFT);
					$hasilKolom2 = str_pad((isset($kolom2Array[$i]) ? $kolom2Array[$i] : ""), $lebar_kolom_2, " ",STR_PAD_LEFT);

					// Menggabungkan kolom tersebut menjadi 1 baris dan ditampung ke variabel hasil (ada 1 spasi disetiap kolom)
					$hasilBaris[] = $hasilKolom1 . " " . $hasilKolom2;
				}

				// Hasil yang berupa array, disatukan kembali menjadi string dan tambahkan \n disetiap barisnya.
				return implode($hasilBaris, "\n") . "\n";
			} 

			// Membuat judul
			$printer->initialize();
			$printer->selectPrintMode(Escpos\Printer::MODE_DOUBLE_HEIGHT); 
			$printer->setJustification(Escpos\Printer::JUSTIFY_CENTER); 
			$printer->text("$data->nama_wilayah\n");
			// $printer->text("ALamat :$data->alamat | Telp :$data->no_hp\n");
			$printer->initialize();
			$printer->setJustification(Escpos\Printer::JUSTIFY_CENTER);
			$printer->text("Alamat : $data->alamat\n");
			$printer->text("Telp : $data->no_hp\n");
			$printer->text("\n");

			// Data transaksi
			$printer->initialize();
			$printer->text("Kasir : $data->nama_user\n");
			$printer->text("Waktu : $kasir->tgl_tran\n");
			$printer->text("No. Nota : $kasir->no_nota\n");

			// Membuat tabel
			$printer->initialize(); 
			$printer->text("--------------------------------\n");
			$printer->text(buatBaris4Kolom("Produk", "qty", "Harga", "Subtotal"));
			$printer->text("--------------------------------\n");
			foreach ($jual as $key => $val) {
				$printer->text(buatBaris4Kolom($val->nama_produk, $val->jumlah_produk." ".$val->nama_satuan, number_format($val->harga_jual,0,',','.'), number_format($val->total_harga,0,',','.')));
			}
			
			$printer->text("--------------------------------\n");
			
			$printer->text(buatBaris2Kolom("Service", number_format($kasir->service,0,',','.')));
			$printer->text(buatBaris2Kolom("Embalase", number_format($kasir->embalase,0,',','.')));
			$printer->text(buatBaris2Kolom("Lain", number_format($kasir->lain,0,',','.')));
			$printer->text(buatBaris2Kolom("Total", number_format($kasir->total,0,',','.')));
			$printer->text(buatBaris2Kolom("Bayar", number_format($kasir->jumlah_uang,0,',','.')));
			$printer->text(buatBaris2Kolom("Kembali", number_format($kasir->kembalian,0,',','.')));
			$printer->text("\n");

			$printer->initialize();
			$printer->setJustification(Escpos\Printer::JUSTIFY_CENTER);
			$printer->text("-- Terima Kasih --\n");

			$printer->feed(1);
			$printer->cut();
			$printer->close();
		} catch (Exception $e) {
			echo json_encode(array("status"=>"0","msg"=>"Printer Belum TerKoneksi"));
		}
		
		
    }

	public function get_selesai(){
		$id_user = $this->session->userdata('id_user');
		$sql = "UPDATE tx_jual as j
				SET is_selesai = 1
				WHERE j.insert_by = $id_user
				AND j.is_delete = 0 AND j.is_selesai = 0";
		$data = $this->db->query($sql);

		if($data){
			echo json_encode(array('status'=> 1,'msg'=>'Data Sudah <b>Kosong</b> & Terimpan'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Gagal Di kosongkan'));
		}
	}

	public function data_penjualan(){
		$var['content'] = 'view-data_penjualan';
		$var['js'] = 'js-data_penjualan';
		$this->load->view('view-index',$var);
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

	public function get_detail_data_jual(){
		$id = $_POST['id_jual'];
		$sql = "SELECT j.id_produk,j.id_jual,j.nama_produk,j.jumlah_produk,s.nama_satuan,
		CONCAT(j.jumlah_produk,' ',s.nama_satuan) as jumlah_nama_satuan,
		j.total_harga,ps.jumlah_stok
		FROM `tx_jual` as j
		LEFT JOIN tm_satuan as s ON j.id_satuan = s.id_satuan
		LEFT JOIN tx_produk_stok as ps ON j.id_produk = ps.id_produk
		where j.id_jual = $id";
		$data = $this->db->query($sql);
		
		if($data->num_rows()>0){
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','result'=>$data->row()));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Stok Produk Belum Di Inputkan','result'=>null));
		}
	}

	public function export_data_penjualan(){
		$spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
     
        $sheet->setCellValue('A1', "No");
        $sheet->setCellValue('B1', "No Nota");
        $sheet->setCellValue('C1', "Nama Produk");
        $sheet->setCellValue('D1', "Jumlah");
        $sheet->setCellValue('E1', "Satuan");
		$sheet->setCellValue('F1', "Total Penjualan");

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
		echo $this->db->last_query();
        $no = 1; // Untuk penomoran tabel, di awal set dengan 1
        $numrow = 3; // Set baris pertama untuk isi tabel adalah baris ke 4
        foreach($data_jual as $data){ // Lakukan looping pada variabel siswa
          $sheet->setCellValue('A'.$numrow, $no);
          $sheet->setCellValue('B'.$numrow, $data['no_nota']);
          $sheet->setCellValue('C'.$numrow, $data['nama_produk']);
          $sheet->setCellValue('D'.$numrow, $data['jumlah_produk']);
          $sheet->setCellValue('E'.$numrow, $data['nama_satuan']);
		  $sheet->setCellValue('f'.$numrow, $data['total_harga']);
          $no++; // Tambah 1 setiap kali looping
          $numrow++; // Tambah 1 setiap kali looping
        }

        $writer = new Xlsx($spreadsheet);
        
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename=Data_Penjualan.xls'); 
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
	}

	public function save_penjulan_tolak(){
		$data = $this->input->post();
		$data['insert_by'] = 'NOW()';

		if($data !==""){
			$sql = $this->db->insert('tx_jual_tolak',$data);

			if($sql){
				echo json_encode(array('status'=>1,'msg'=>'Data Success Diinput'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data Gagal Diinput'));
			}
		}
	}

}