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
		$this->load->model('Model_penjualan');

		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
		
	}

	public function index(){
		$var['content'] = 'view-kasir';
		$var['js'] = 'js-kasir';
		$this->load->view('view-index-kasir',$var);
	}

	public function get_produk_barcode(){
		$param = $_POST['param'];
		$sql = "SELECT nama_produk FROM `tx_produk` WHERE nama_produk LIKE '%$param%' OR barcode LIKE '%$param%' ORDER BY nama_produk asc";
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
		$sql = "SELECT j.id_jual,p.id_produk,p.nama_produk,j.id_satuan,SUM(jumlah_produk) as qty,j.id_jenis_harga,j.harga_jual,
				SUM(j.total_harga) as total_harga
				FROM `tx_jual` as j
				LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
				WHERE j.insert_by = $id_user
				AND p.is_delete = 0 AND j.is_delete = 0 AND j.is_selesai = 0
				GROUP BY j.id_jual
				ORDER BY j.id_jual DESC";
		$data = $this->db->query($sql);
		$sub_tot = $this->get_sub_total();
		if(!empty($data)){
			echo json_encode(array('status'=>1,'msg'=>'Data is Find','result'=>$data->result(),'sub_tot'=>$sub_tot));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'Data is Find','result'=>null,'sub_tot'=>null));
		}
	}


	public function get_add_produk(){
		$produk = $_POST['produk_barcode'];

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
						'insert_date' => date('Y-m-d H:i:s')
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
			echo json_encode(array('status'=>0,'msg'=>'Nama Produk Atau Barcode Kosong !!'));
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
		if($_POST['el']== 2){
			$sql_cek = "SELECT * FROM `tx_jual` WHERE id_satuan_utama =$val and id_jual =$id_jual";
			$cek = $this->db->query($sql_cek);
			if($cek->num_rows()==0){
				$where .=" AND d.id_satuan = $val ";
			}else{
				$where .=" AND j.id_satuan_utama = $val ";
				$nom +=1;
			}
		}
		// Jenis Harga
		if($_POST['el']== 3){
			$where .=" AND h.id_jenis_harga = $val";
		}
		
		$sql = "SELECT j.id_jual,p.id_produk,p.nama_produk,j.id_satuan,j.jumlah_produk as qty,j.id_jenis_harga,
				j.harga_jual,h.harga_jual as jual_ex,d.jumlah_produk_p,d.jumlah_produk as jum_p,j.id_satuan_utama
				FROM `tx_jual` as j
				LEFT JOIN tx_produk as p on j.id_produk = p.id_produk
				LEFT JOIN tx_produk_harga as h ON p.id_produk = h.id_produk
				LEFT JOIN tx_produk_detail as d ON p.id_produk = d.id_produk
				WHERE j.insert_by = 2 and j.id_jual = $id_jual $where
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
					$res_up['total_harga'] = (int)$data->harga_jual * (int)$tot_qty * (int)$p_kali;
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
					$res_up['total_harga'] = (int)$data->harga_jual * (int)$tot_qty;
			}

			if($_POST['el']== 3){
				
				$tot_qty = (int)$data->qty;
					$res_up['id_jenis_harga'] = $val;
					$res_up['harga_jual'] = $data->jual_ex;
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
		$user = $this->session->userdata('id_user');
		if(!empty($id)){
			$del = $this->db->where('id_jual',$id)
							->update('tx_jual',array(
								'is_delete'=>1,
								'delete_by' => $user,
								'delete_date' => date('Y-m-d H:i:s')
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
		$data = array(
						'no_nota' => $noTa
					);
	}

	public function get_selesai(){
		$id_user = $this->session->userdata('id_user');
		$noTa = $this->Model_penjualan->get_no_nota($id_user);
		$data = array(
						'no_nota' => $noTa,
						'tgl_transaksi' => date('Y-m-d H:i:s'),
						

					);

	}
	
	public function cetak_struk() {
        // me-load library escpos
        $this->load->library('escpos');
		$id_user = $this->session->userdata('id_user');
		$data = $this->Model_penjualan->get_user($id_user);
        $connector = new Escpos\PrintConnectors\WindowsPrintConnector($data->nama_print);
        $printer = new Escpos\Printer($connector);

        function buatBaris4Kolom($kolom1, $kolom2, $kolom3, $kolom4) {
            // Mengatur lebar setiap kolom (dalam satuan karakter)
            $lebar_kolom_1 = 15;
            $lebar_kolom_2 = 5;
            $lebar_kolom_3 = 8;
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

        // Membuat judul
        $printer->initialize();
        $printer->selectPrintMode(Escpos\Printer::MODE_DOUBLE_HEIGHT); 
        $printer->setJustification(Escpos\Printer::JUSTIFY_CENTER); 
        $printer->text("$data->nama_wilayah\n");
		$printer->text("ALamat :$data->alamat | Telp :$data->no_hp\n");
        $printer->text("\n");

        // Data transaksi
        $printer->initialize();
        $printer->text("Kasir : $data->nama_user\n");
        $printer->text("Waktu : 13-10-2019 19:23:22\n");
		$printer->text("No. Nota : 13-10-2019 19:23:22\n");

        // Membuat tabel
        $printer->initialize(); 
        $printer->text("----------------------------------------\n");
        $printer->text(buatBaris4Kolom("Produk", "qty", "Harga", "Subtotal"));
        $printer->text("----------------------------------------\n");
        $printer->text(buatBaris4Kolom("Makaroni 250gr", "2pcs", "15.000", "30.000"));
        $printer->text("----------------------------------------\n");
        $printer->text(buatBaris4Kolom('', '', "Total", "56.400"));
        $printer->text("\n");

        $printer->initialize();
        $printer->setJustification(Escpos\Printer::JUSTIFY_CENTER);
        $printer->text("-- Terima Kasih --\n");

        $printer->feed(3);
		$printer->cut();
        $printer->close();
    }

	

}