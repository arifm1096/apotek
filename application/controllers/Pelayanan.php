<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Pelayanan extends CI_Controller {

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
		$this->load->model('Model_pelayanan');

		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
		
	}

	public function index(){
		$id = $this->session->userdata('id_user');
		$var['pelanggan'] = $this->db->select('*')
									 ->from('tm_pelanggan')
									 ->where('is_delete',0)
									 ->where('aktif','y')
									 ->get()
									 ->result();
		$var['id_dokter'] = $id;
		$var['nama_dokter'] = $this->session->userdata('nama_user');
		$var['kode_resep'] = $this->Model_pelayanan->get_no_resep($id);
		$var['content'] = 'view-resep-dokter';
		$var['js'] = 'js-resep-dokter';
		$this->load->view('view-index-kasir',$var);
	}

	public function get_produk_barcode(){
		$param = $_POST['param'];
		$sql = "SELECT nama_produk FROM `tx_produk` WHERE is_delete = 0 and nama_produk LIKE '%$param%' OR barcode LIKE '%$param%' ORDER BY nama_produk asc";
		$data = $this->db->query($sql)->result();
		$str_produk = [];
		foreach ($data as $key => $val) {
			array_push($str_produk,$val->nama_produk);
		}

		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data Find','result'=>$str_produk));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Find','result'=>null));
		}
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

	public function load_data_produk(){
		$id_user = $this->session->userdata('id_user');
		$sql = "SELECT j.id_resep_detail,p.id_produk,p.nama_produk,j.id_satuan,SUM(jumlah_produk) as qty,j.id_jenis_harga,j.harga_jual,
				SUM(j.total_harga) as total_harga
				FROM `tx_resep_detail` as j
				LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
				WHERE j.insert_by = $id_user
				AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 0
				GROUP BY j.id_resep_detail
				ORDER BY j.id_resep_detail DESC";
		$data = $this->db->query($sql);
		$sub_tot = $this->get_sub_total();
		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','result'=>$data->result(),'sub_tot'=>$sub_tot));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data is Find','result'=>null,'sub_tot'=>null));
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
			$sql_jul ="SELECT j.id_resep_detail,p.id_produk,p.nama_produk,j.id_satuan,SUM(jumlah_produk) as qty,j.id_jenis_harga,j.harga_jual,
				SUM(j.total_harga) as total_harga
				FROM `tx_resep_detail` as j
				LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
				WHERE j.insert_by = $id_user and p.id_produk = $prod_data->id_produk
				AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 0
				GROUP BY j.id_resep_detail";
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
							$update = $this->db->where('id_resep_detail',$data_jual->id_resep_detail)->update('tx_resep_detail',$r_up);
							if($update){
								$ex +=1;
							}
						}else{
							$insert = $this->db->insert('tx_resep_detail',$r_in);
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
		$id_resep_detail = $_POST['id'];
		$id_user = $this->session->userdata('id_user');
		$date_time = date('Y-m-d H:i:s');
		$where = "";
		$val = $_POST['val'];
		$nom = 0;

		// satuan
		// if($_POST['el']== 2){
			$sat = $_POST['sat'];
			$sql_cek = "SELECT * FROM `tx_resep_detail` WHERE id_satuan_utama =$sat and id_resep_detail =$id_resep_detail";
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
		
		$sql = "SELECT j.id_resep_detail,p.id_produk,p.nama_produk,j.id_satuan,j.jumlah_produk as qty,j.id_jenis_harga,
				j.harga_jual,h.harga_jual as jual_ex,d.jumlah_produk_p,d.jumlah_produk as jum_p,j.id_satuan_utama
				FROM `tx_resep_detail` as j
				LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
				LEFT JOIN tx_produk_harga as h ON p.id_produk = h.id_produk
				LEFT JOIN tx_produk_detail as d ON p.id_produk = d.id_produk
				WHERE j.id_resep_detail = $id_resep_detail $where
				AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 0
				GROUP BY j.id_resep_detail";
		$get_data = $this->db->query($sql);
		if($get_data->num_rows()>0){
			$data = $get_data->row();
			$res_up = array(
				     'update_by' =>$id_user,
					 'update_date' => $date_time
					);
			$p_kali = 0;
				$sql_sat = "SELECT j.id_resep_detail,j.nama_produk,j.jumlah_produk,j.harga_jual,h.jumlah_produk_p
							FROM `tx_resep_detail` as j
							LEFT JOIN tx_produk_detail as h on j.id_produk = h.id_produk AND j.id_satuan = h.id_satuan
							WHERE j.insert_by = $id_user and j.id_resep_detail = $id_resep_detail 
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

			$up_ex = $this->db->where('id_resep_detail',$id_resep_detail)->update('tx_resep_detail',$res_up);
			$result = $this->db->select('harga_jual,total_harga')->from('tx_resep_detail')->where('id_resep_detail',$id_resep_detail)->get();
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
			$del = $this->db->where('id_resep_detail',$id)
							->update('tx_resep_detail',array(
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
						'id_shif'=> $this->session->userdata('id_shif'),
						'insert_by' => $id_user,
						'insert_date' => $datetime->time

					);
					
		$this->db->insert('tx_kasir', $data);
   		$insert_id = $this->db->insert_id();

		$data_up = array(
						'kode_resep'=>$insert_id,
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

	public function get_add_resep(){
		$id_user = $this->session->userdata('id_user');
		$in = $this->input->post();
		$noTa = $this->Model_penjualan->get_no_nota($id_user);
		$datetime = $this->db->select('now() as time')->get()->row();
		$data = array(
						'kode_resep'=>$in['kode_resep'],
						'id_dokter' =>$in['id_dokter'],
						'id_pelanggan'=>$in['id_pelanggan'],
						'status' => 2,
						'insert_by' => $id_user,
						'insert_date' => $datetime->time
					);
					
		$this->db->insert('tx_resep', $data);
   		$insert_id = $this->db->insert_id();

		$data_up = array(
						'id_resep'=>$insert_id,
						'status' => 2
		);

		if(!empty($insert_id)){
			$up = $this->db->where('insert_by',$id_user)
						   ->where('is_selesai',0)
						   ->where('is_delete',0)
						   ->update('tx_resep_detail',$data_up);
			if($up){
				echo json_encode(array('status'=>1,'msg'=>'Data Susscess Diinput, Silahkan Cetak Nota Resep','id'=>$insert_id));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Error Update Produk Jual','id'=>null));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Insert Kasir Error','id'=>null));
		}
	}

	public function cetak_struk_resep() {
        // me-load library escpos
        $this->load->library('escpos');
		$id_user = $this->session->userdata('id_user');
		// $id_kasir = $this->input->post('id_kasir');
		$id_resep = $_POST['id_resep'];
		$data = $this->Model_pelayanan->get_dokter_detail($id_user);
		$resep = $this->Model_pelayanan->get_resep($id_resep);
		$nama_print = $data->nama_print;
		
		try {
			$connector = new Escpos\PrintConnectors\WindowsPrintConnector($nama_print);
			$printer = new Escpos\Printer($connector);

			$printer->initialize();
			$printer->selectPrintMode(Escpos\Printer::MODE_DOUBLE_HEIGHT); 
			$printer->setJustification(Escpos\Printer::JUSTIFY_CENTER);
			$printer ->setTextSize(1,1); 
			$printer->text("$data->nama_dokter\n");
			$printer->text("$data->klinik_rs\n");
			// $printer->text("ALamat :$data->alamat | Telp :$data->no_hp\n");
			$printer->initialize();
			$printer->setJustification(Escpos\Printer::JUSTIFY_CENTER);
			$printer->text("KLINIK : $data->alamat\n");
			$printer->text("Telp : $data->no_hp\n");
			$printer->text("Waktu : $resep->insert_date\n");
			$printer->text("\n");

			// Data transaksi
			$printer->initialize();
			$printer->text("--------------------------------\n");
			$printer -> setTextSize(1,1);
			$printer->text("Kode Resep :\n");
			$printer -> setTextSize(2,2);
			$printer->text("$resep->kode_resep\n");
			$printer -> setTextSize(1,1);
			$printer->text("Pelanggan :\n");
			$printer -> setTextSize(2,2);
			$printer->text("$resep->nama_pelanggan\n");
			
			$printer->initialize();
			$printer->text("--------------------------------\n");
			$printer->initialize();
			$printer->setJustification(Escpos\Printer::JUSTIFY_CENTER);
			$printer->text("Penembusan Obat Hanya Bisa Dilakukan DI,\n");
			$printer->text("-- APOTEK NAWASENA 24 JAM --\n");
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

	public function cetak_struk() {
        // me-load library escpos
        $this->load->library('escpos');
		$id_user = $this->session->userdata('id_user');
		$kode_resep = $_POST['kode_resep'];
		$data = $this->Model_penjualan->get_user($id_user);
		$kasir = $this->Model_pelayanan->get_resep_detail($kode_resep);
		$jual = $this->Model_pelayanan->get_resep_jual($kode_resep);
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

	public function get_update_stok($kode_resep){
		$user = $this->session->userdata('id_user');
		$sql = "SELECT NOW() as jam";
		$time = $this->db->query($sql)->row();
		$ext = 0;
		$sql = "SELECT j.id_produk,j.id_satuan,u.gudang,j.nama_produk,pd.jumlah_stok,j.jumlah_produk,
		(pd.jumlah_stok-j.jumlah_produk) as sisa,j.harga_beli
		FROM  tx_resep_detail as j
		LEFT JOIN tx_resep as r ON j.id_resep = r.id_resep
		LEFT JOIN tx_produk_stok as pd on pd.id_produk = j.id_produk
		LEFT JOIN tm_user as u ON j.insert_by = u.id_user
		WHERE j.is_selesai = 1 AND j.is_delete = 0  and pd.is_delete = 0 AND r.kode_resep ='$kode_resep'";

		$data = $this->db->query($sql);

		if($data->num_rows() > 0){
			$arr_data = $data->result();
			$updateStok ="";
			$inKartuStok_str = "INSERT INTO `tx_produk_stok_detail` (id_produk,id_gudang,id_status_stok,id_satuan,jumlah_stok,harga_beli,insert_by,insert_date)
			VALUES";
			foreach ($arr_data as $key => $val) {
				// $updateStok .="UPDATE `tx_produk_stok` SET jumlah_stok = $val->sisa,update_by =$user,update_date = '$time->jam' WHERE is_delete = 0 AND id_produk = $val->id_produk ;";
				$time_str = "$time->jam";
				$up_data = array(
									'jumlah_stok'=>$val->sisa,
									'update_by'=>$user,
									'update_date'=>$time_str
								);
				$up = $this->db->where('id_produk',$val->id_produk)
							   ->where('is_delete',0)
							   ->update('tx_produk_stok',$up_data);
			}
				// $up = $this->db->query($updateStok);
				if($up){
					$ext +=1;
				}

			foreach ($arr_data as $key => $val) {
				$inKartuStok_str .="($val->id_produk,$val->gudang,3,$val->id_satuan,$val->jumlah_produk,$val->harga_beli,$user,'$time->jam'),";
			}
				$inKartuStok = rtrim($inKartuStok_str,",");
				$in = $this->db->query($inKartuStok);
				if($in){
					$ext +=1;
				}

			if($ext > 0){
				return 1;
			}else{
				return 0;
			}
		}
	}

	public function get_selesai(){
		$kode_resep = $this->input->post('kode_resep');
		$id_user = $this->session->userdata('id_user');
		$Stok_up = $this->get_update_stok($kode_resep);
		if($Stok_up == 1){
			$sql = "UPDATE tx_resep_detail as j
				SET is_selesai = 1
				WHERE j.insert_by = $id_user
				AND j.is_delete = 0 AND j.is_selesai = 0";
				$data = $this->db->query($sql);

				if($data){
					echo json_encode(array('status'=> 1,'msg'=>'Data Sudah <b>Kosong</b> & Terimpan'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'Data Gagal Di kosongkan'));
				}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error 3024 || Error UPdate Stok'));
		}
		
	}


	public function tebus_resep(){
		$var['content'] = 'view-tebus-resep';
		$var['js'] = 'js-tebus-resep';
		$this->load->view('view-index-kasir',$var);
	}

	public function load_data_resep(){
		$id_user = $this->session->userdata('id_user');
		$kode_resep = $this->input->post('kode_resep');
		$sql = "SELECT j.id_resep_detail,p.id_produk,p.nama_produk,j.id_satuan,SUM(jumlah_produk) as qty,j.id_jenis_harga,j.harga_jual,
				SUM(j.total_harga) as total_harga
				FROM `tx_resep_detail` as j
				LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
				LEFT JOIN tx_resep as r on j.id_resep = r.id_resep
				WHERE r.kode_resep = '$kode_resep'
				AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 1 AND j.status = 2
				GROUP BY j.id_resep_detail
				ORDER BY j.id_resep_detail DESC";
		$data = $this->db->query($sql);
		$sub_tot = $this->get_tot_tebus_resep($kode_resep);
		if($data->num_rows() > 0 ){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','result'=>$data->result(),'sub_tot'=>$sub_tot));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Kosong Atau Sudah Ditebus.','result'=>null,'sub_tot'=>null));
		}
	}

	public function get_tot_tebus_resep($kode_resep){
		$sql_tot = "SELECT 
					SUM(j.total_harga) as sub_total_harga
					FROM `tx_resep_detail` as j
					LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
					LEFT JOIN tx_resep as r on j.id_resep = r.id_resep
					WHERE r.kode_resep = '$kode_resep'
					AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 1 AND j.status = 2";
		$data_tot = $this->db->query($sql_tot)->row();

		if(!empty($data_tot)){
			return $data_tot->sub_total_harga;
		}else{
			return null;
		}
	}

	public function get_status_tebus(){
		$data = $this->db->select('*')
						 ->from('tm_status_resep')
						 ->where('id_status_resep = 1 or id_status_resep = 3')
						 ->get();
		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','data'=>$data->result()));
		}else{
			echo json_encode(array('status'=>1,'msg'=>'Data Is Find','data'=>null));
		}
	}

	public function get_add_tebus_resep(){
		$id_user = $this->session->userdata('id_user');
		$noTa = $this->Model_penjualan->get_no_nota($id_user);
		$datetime = $this->db->select('now() as time')->get()->row();
		$kode_resep = $this->input->post('kode_resep');
		$id_rep = $this->db->select('*')
						   ->from('tx_resep')
						   ->where('kode_resep',$kode_resep)
						   ->get()
						   ->row();
		$id = $id_rep->id_resep;
		$data = array(
						'status' =>$_POST['status'],
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
						'id_shif'=> $this->session->userdata('id_shif'),
						'update_by' => $id_user
					);
					
		$up1 = $this->db->where('id_resep',$id)->update('tx_resep',$data);

		$data_up = array(
						'no_nota'=>$noTa,
						'status' => 1
		);

		if($up1){
			$up = $this->db->where('insert_by',$id_user)
						   ->where('is_selesai',1)
						   ->where('is_delete',0)
						   ->where('status',2)
						   ->where('id_resep',$id)
						   ->update('tx_resep_detail',$data_up);
			if($up){
				echo json_encode(array('status'=>1,'msg'=>'Untuk Print Struk Klik, <b>Print</b> atau Pencet Keyboard P'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Error Update Produk Jual','id'=>null));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Insert Kasir Error','id'=>null));
		}
	}


// starts Rekamedik Dasar
	public function remik(){
		$var['content'] = 'view-remik';
		$var['js'] = 'js-remik';
		$this->load->view('view-index',$var);
	}

	public function load_remik(){
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
			$searchQuery .= " and (nama_pelanggan like '%" . $searchValue . "%'
								OR kode_remik like '%" . $searchValue . "%'
								OR alamat like '%" . $searchValue . "%'						
			) ";
		}

		$where = " is_delete = 0 " . $searchQuery . "";

		// Total number records without filtering
		$sql_count = "SELECT count(*) as allcount
		FROM `tx_remik` where is_delete = 0";
		$records = $this->db->query($sql_count)->row_array();
		$totalRecords = $records['allcount'];

		// Total number records with filter
		$sql_filter = "SELECT count(*) as allcount
		FROM `tx_remik`
		WHERE $where";
		$records = $this->db->query($sql_filter)->row_array();
		$totalRecordsFilter = $records['allcount'];

		// Fetch Records
		$sql = "SELECT id_remik,nama_pelanggan,alamat,kode_remik 
		FROM `tx_remik`
		WHERE $where
		order by id_remik " . $columnSortOrder . " limit " . $row . "," . $rowperpage;
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

	public function save_remik(){
		$data = $this->input->post();
		$id = $this->session->userdata('id_user');
		$datetime = $this->db->select('now() as time')->get()->row();
		unset($data['tekanan_darah']);
		unset($data['tekanan_nafas']);
		unset($data['denyut_nadi']);
		unset($data['suhu_tubuh']);
		unset($data['kadar_oksigen']);
		unset($data['skala_nyeri']);

		$data['tekanan_darah'] = str_replace(',','.',$_POST['tekanan_darah']);
		$data['tekanan_nafas'] = str_replace(',','.',$_POST['tekanan_nafas']);
		$data['denyut_nadi'] = str_replace(',','.',$_POST['denyut_nadi']);
		$data['suhu_tubuh'] = str_replace(',','.',$_POST['suhu_tubuh']);
		$data['kadar_oksigen'] = str_replace(',','.',$_POST['kadar_oksigen']);
		$data['skala_nyeri'] = str_replace(',','.',$_POST['skala_nyeri']);
		$data['kode_remik'] = $this->Model_pelayanan->get_no_remik($id);
		$ext = 0;

		if($data['id_remik']==""){
			$data['insert_by'] = $id;
			$data['insert_date'] = $datetime->time;
			$sql = $this->db->insert('tx_remik',$data);
			if($sql){
				$ext += 1;
			}
		}else{
			$data['update_by'] = $id;
			$data['update_date'] = $datetime->time;
			$sql = $this->db->where('id_remik',$data['id_remik'])->update('tx_remik',$data);
			if($sql){
				$ext += 1;
			}
		}

		if($ext > 0){
			echo json_encode(array('status'=>1,'msg'=>'Data Behasil Disimpan'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data Gagal Disimpan'));
		}
	}

	public function get_id_remik(){
		$id = $_POST['id'];
		if($id !==""){
			$sql = $this->db->select('*')
						    ->from('tx_remik')
							->where('id_remik',$id)
							->get();
			if($sql->num_rows()>0){
				echo json_encode(array('status'=>1,'msg'=>'Data not Found','result'=>$sql->row()));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'Data not Found','result'=>null));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Id not found','result'=>null));
		}
	}

	public function hapus_remik(){
		$id = $_POST['id'];
		$datetime = $this->db->select('now() as time')->get()->row();
		$sql = $this->db->where('id_remik',$id)->update('tx_remik',
											array(
												'is_delete'=>1,
												'delete_by'=>$this->session->userdata('id_user'),
												'delete_date'=>$datetime->time
											)
										);
		if($sql){
			echo json_encode(array('status'=>1,'msg'=>'Success Delete Data'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Error Data Deleting'));
		}
	}
// End Rekamedik Dasasr

// Start Racik Obat
	Public function racik_obat(){
		$var['content'] = 'view-racik-obat';
		$var['js'] = 'js-racik-obat';
		$this->load->view('view-index',$var);
	}

	public function get_add_produk_racik(){
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
			$sql_jul ="SELECT j.id_racik_obat,p.id_produk,p.nama_produk,j.id_satuan,SUM(jumlah_produk) as qty,j.id_jenis_harga,j.harga_jual,
				SUM(j.total_harga) as total_harga
				FROM `tx_racik_obat` as j
				LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
				WHERE j.insert_by = $id_user and p.id_produk = $prod_data->id_produk
				AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 0
				GROUP BY j.id_racik_obat";
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
							$update = $this->db->where('id_racik_obat',$data_jual->id_racik_obat)->update('tx_racik_obat',$r_up);
							if($update){
								$ex +=1;
							}
						}else{
							$insert = $this->db->insert('tx_racik_obat',$r_in);
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
// End Racik Obat
}