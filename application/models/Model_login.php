<?php

class Model_login extends CI_Model{
    
    function check_login($username, $password){
        $filed = "count(a.username) as total, h.nama as hak_akses,h.id_hak_akses,
        a.username as username, a.id_user, a.aktif, a.gudang, a.nama as nama_user ";

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

    function check_login_dokter($username, $password){
        $filed = "count(a.username) as total, 'DOKTER' as hak_akses,
        a.username as username, a.id_dokter, a.alamat,a.klinik_rs,a.no_hp, a.nama_dokter as nama_user ";

        $data=	$this->db
                ->select($filed)
                ->from('tm_dokter as a')
                ->where('a.is_delete',0)
                ->where('a.username ='.$username)
                ->where('a.password',$password)
                ->get();
        if($data->num_rows()>0){
            return $data->row_array();
        }else{
            return null;
        }
    }

    function list_kasir($username, $password){
        $filed = "count(a.username) as total, h.nama as hak_akses,h.id_hak_akses,
        a.username as username, a.id_user, a.aktif, a.gudang, a.nama as nama_user,s.nama_shif,l.id_shif ";

        $data=	$this->db
                ->select($filed)
                ->from('tm_user as a')
                ->join('tm_hak_akses as h','a.hak_akses = h.id_hak_akses','left')
                ->join('tx_log_shif as l','a.id_user = l.id_user','left')
                ->join('tm_shif as s','l.id_shif = s.id_shif','left')
                ->where('a.is_delete',0)
                ->where('a.aktif','y')
                ->where('a.username ='.$username)
                ->where('a.password',$password)
                ->where('l.close',0)
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