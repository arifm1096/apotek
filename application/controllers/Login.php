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
		$this->load->view('view-login',$var);
    }

    public function proses_login() {
        $data =  $_POST ;
            $encrypt_password = md5(sha1($data['password']));
            $sub_ep = substr($encrypt_password,9,20);
            $user = $this->db->escape($data['username']);
            $check_login = $this->model_login->check_login($user,$sub_ep);
            if($check_login['total'] > 0) {

                $data_session = array(
                'id_user' => $check_login['id_user'],
                'hak_akses' => $check_login['hak_akses'],
                'id_hak_akses' => $check_login['id_hak_akses'],
                'username' => $check_login['username'],
                'aktif' => $check_login['aktif'],
                'status' => "login"
                );

            $this->session->set_userdata($data_session);

            echo json_encode(array('status'=>1,'message'=>'Data Ditemukan'));
            
            } else {
                echo json_encode(array('status'=>9,'message'=>'Data Tidak Ditemukan'));
            }

        
    }

    public function proses_logout()
    {
       
        $this->session->sess_destroy();
	    redirect(base_url('login'));
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