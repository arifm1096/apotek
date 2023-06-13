<?php

class Model_login extends CI_Model{
    
    function check_login($username, $password){
        $filed = "count(a.username) as total, h.nama as hak_akses,h.id_hak_akses,
        a.username as username, a.id_user, a.aktif ";

        $data=	$this->db
                ->select($filed)
                ->from('tm_user as a')
                ->join('tm_hak_akses as h','a.hak_akses = h.id_hak_akses')
                ->where('a.is_delete',0)
                ->where('a.aktif','y')
                ->where('a.username ='.$username)
                ->where('a.password',$password)
                ->get();
        if($data->num_rows()>0){
            return $data->row_array();
        }else{
            return null;
        }
    }

    function check_login_anggota($username, $password){
        $filed = "count(a.nik_username) as total,a.nik_username, a.nama_lengkap, a.id_anggota, a.aktif ";
        $data=	$this->db
                ->select($filed)
                ->from('tm_anggota as a')
                ->where('a.is_delete',0)
                ->where('a.aktif','y')
                ->where("a.nik_username like '%".$username."%' AND a.password like '%".$password."%'")
                ->get();
        if($data->num_rows()>0){
            return $data->row_array();
        }else{
            return null;
        }
    }

}
?>