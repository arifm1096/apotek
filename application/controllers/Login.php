<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('model_login');
        $this->load->model('model_user');
    }

    public function index(){
        $var['ls_hak_akses'] = $this->db->get_where('tm_hak_akses',array('is_delete'=>0))->result();
        $var['ls_shif'] = $this->db->get_where('tm_shif',array('is_delete'=>0,'aktif'=>1))->result();
		$this->load->view('view-login',$var);
    }

    public function proses_login() {
            $data =  $this->input->post() ;
            $encrypt_password = md5(sha1($data['password']));
            $sub_ep = substr($encrypt_password,9,20);
            $user = $this->db->escape($data['username']);
            $sql_time = $this->db->select('now() AS time ')->get()->row();

            if($data['panel'] !== "4"){
                 $check_login = $this->model_login->check_login($user,$sub_ep);
            }else{
                $encrypt_ = md5(sha1($data['password']));
                $check_login = $this->model_login->check_login_dokter($user,$encrypt_);
            }
            // echo $this->db->last_query();
            if($check_login['total'] > 0) {
                if($data['panel']==3){
                    $data_kasi = array(
                                        'id_user'=> $check_login['id_user'],
                                        'id_shif' => $data['shif'],
                                        'tgl_masuk'=> $sql_time->time
                                        );
                    $in_log = $this->db->insert('tx_log_shif',$data_kasi);
                    if($in_log){
                            $login_kasir = $this->model_login->list_kasir($user,$sub_ep);
                            // echo $this->db->last_query();
                            $data_session = array(
                            'id_user' => $login_kasir['id_user'],
                            'hak_akses' => $login_kasir['hak_akses'],
                            'id_hak_akses' => $login_kasir['id_hak_akses'],
                            'username' => $login_kasir['username'],
                            'nama_user' => $login_kasir['nama_user'],
                            'aktif' => $login_kasir['aktif'],
                            'gudang' => $login_kasir['gudang'],
                            'nama_shif' => $login_kasir['nama_shif'],
                            'id_shif' => $login_kasir['id_shif'],
                            'status' => "login"
                        );
                    }
                     
                }else if($data['panel']==4){
                    $data_session = array(
                        'id_user' => $check_login['id_dokter'],
                        'hak_akses' => $check_login['hak_akses'],
                        'username' => $check_login['username'],
                        'nama_user' => $check_login['nama_user'],
                        'alamat' => $check_login['alamat'],
                        'klinik_rs' => $check_login['klinik_rs'],
                        'status' => "login"
                    );
                }else{
                    $data_session = array(
                    'id_user' => $check_login['id_user'],
                    'hak_akses' => $check_login['hak_akses'],
                    'id_hak_akses' => $check_login['id_hak_akses'],
                    'username' => $check_login['username'],
                    'nama_user' => $check_login['nama_user'],
                    'aktif' => $check_login['aktif'],
                    'gudang' => $check_login['gudang'],
                    'status' => "login"
                    );
                }
                

                $this->session->set_userdata($data_session);
                echo json_encode(array('status'=>1,'message'=>'Data Ditemukan'));
            
            } else {
                echo json_encode(array('status'=>9,'message'=>'Data Tidak Ditemukan'));
            }

        
    }

    public function proses_logout(){
        $cek = $this->db->get_where('tx_log_shif',array('close'=>0));

        if($cek->num_rows() == 0){
             $this->session->sess_destroy();
	        // redirect(base_url('login'));
            echo json_encode(array('status'=>1,'msg'=>'Logout Success'));
        }else{
            echo json_encode(array('status'=>0,'msg'=>'Close Shif Terlebih Dahulu Sebelum, Logout'));
        }
       
       
    }

     public function proses_logout_admin(){
        if(1 > 0){
            $this->session->sess_destroy();
	        // redirect(base_url('login'));
            echo json_encode(array('status'=>1,'msg'=>'Logout Success'));
        }else{
            echo json_encode(array('status'=>0,'msg'=>'Close Shif Terlebih Dahulu Sebelum, Logout'));
        }
            //  $this->session->sess_destroy();
	        // redirect(base_url('login'));
        
       
    }

    public function lupa_password() {
        $var['content'] = 'lupa-password-v';
		$var['js']		= 'js-LupaPassword';
		$this->load->view('view-login', $var);
    }

    public function ubah_password() {
        $kode = $this->uri->segment(3);
        $data_user = $this->model_login->check_kode($kode);
        // var_dump($data_user);

        $var['nama_wilayah'] = $data_user['nama_wilayah'];
        $var['content'] = 'ubah-password-v';
		$var['js']		= 'js-UbahPassword';
		$this->load->view('view-login', $var);
    }

    public function proses_ubah_password() {
        $data = array_map('strtoupper', $_POST);

        $encrypt_password = md5(sha1($data['password']));
        $sub_ep = substr($encrypt_password,9,20);

       

        $data_update = array(
            'username' => $data['username'],
            'password' => $sub_ep
        );

        // var_dump($data_update);

        $where = array(
            'generate_kode' => $data['generate_kode']
        );

        $up = $this->db->where($where);
        $up = $this->db->update('master_uxteser',$data_update);

        if($up)
        {
            $data_update_kode = array(
                'generate_kode' => ""
            );
            $this->db->where($where);
            $this->db->update('master_uxteser',$data_update_kode);
        }

        echo json_encode(array('status'=>1,'message'=>'Data berhasil diupdate'));
    }
}

?>