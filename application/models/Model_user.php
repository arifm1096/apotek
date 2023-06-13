<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Model_user extends CI_Model
{
    // Tambahan Sindhu Start
    public function cek_user($nik)
    {
        $filed = 'count(a.nik) as total, a.nama as nama, a.level as level,
                    a.nik as nik
                ';

        $data=	$this->db
                ->select($filed)
                ->from('master_uxteser as a')
                // ->where('a.nik',$nik)
                ->where("a.nik = $nik")
                ->where('a.is_delete',0)
                ->get();
        if($data->num_rows()>0){
            return $data->row_array();
        }else{
            return null;
        }
    }

    public function get_user_by_id($id_user)
    {
        $filed = 'a.id_uxteser as id_uxteser, a.nik as nik, a.nama as nama, a.username as username,
            a.password as password, a.level as level
            ';

        $data =	$this->db
                ->select($filed)
                ->from('master_uxteser as a')
                ->where('a.id_uxteser',$id_user)
                ->where('a.is_delete',0)
                ->get();
        if($data->num_rows()>0){
            return $data->row_array();
        }else{
            return null;
        }
    }

    public function hapususer($id)
    {
        $now = date('Y-m-d H:i:s');
        $data = array(
            'is_delete' => 1,
            'delete_date' => $now
        );
        $this->db->where('id_uxteser',$id)->update('master_uxteser',$data);
    }

    public function master_user()
    {
        $filed = 'a.id_user, h.nama_level as level,
         a.nama_user as username, a.password as password,a.aktif';

        $data=	$this->db
                ->select($filed)
                ->from('tm_user as a')
                ->join('tm_level as h','a.level = h.id_level')
                ->where('a.is_delete',0)
                ->get();
        if($data->num_rows()>0){
            return $data->result_array();
        }else{
            return null;
        }
    }

    public function update_user($data,$id)
    {
        $this->db->where('id_uxteser', $id);
        $this->db->update('master_uxteser', $data);
    }

    public function master_jumlah_hak_akses()
    {
        $filed = 'a.id_jumlah_hak_akses as id_jumlah_hak_akses, h.level as level_hak,
        h.id_hak_akses as id_hak_akses, a.level as level_jml, a.jumlah as jumlah';

        $data=	$this->db
                ->select($filed)
                ->from('master_jumlah_hak_akses as a')
                ->join('master_hak_akses as h','a.level = h.id_hak_akses','left')
                ->where('a.is_delete',0)
                ->get();
        if($data->num_rows()>0){
            return $data->result_array();
        }else{
            return null;
        }
    }

    public function update_jumlah_hak_akses($data,$id)
    {
        $this->db->where('id_jumlah_hak_akses', $id);
        $this->db->update('master_jumlah_hak_akses', $data);
    }

		public function hapus_jumlah_hak_akses($id_jumlah_hak_akses){
			$now = date('Y-m-d H:i:s');
			$data = array(
				'is_delete' => 1,
				'delete_date' => $now,
				'delete_by' => $this->session->userdata('id_user')
			);
			$this->db->where('id_jumlah_hak_akses',$id_jumlah_hak_akses)->update('master_jumlah_hak_akses',$data);
        }
        
        public function cek_user_by_id($id_user)
        {
            $filed = 'a.id_uxteser id_uxteser, a.nik as nik, a.nama as nama, h.level as level,
            h.keterangan as keterangan, w.nama_wilayah as nama_wilayah, h.id_hak_akses as id_hak_akses,
            w.id_master_wilayah as id_wilayah, a.username as username, a.password as password
                ';

            $data =	$this->db
                    ->select($filed)
                    ->from('master_uxteser as a')
                    ->join('master_hak_akses as h','a.level = h.id_hak_akses')
                    // ->join('xm_wilayah as w','a.wilayah = w.id_master_wilayah','left')
                    ->where('a.id_uxteser',$id_user)
                    ->where('a.is_delete',0)
                    ->get();
            if($data->num_rows()>0){
                return $data->row_array();
            }else{
                return null;
            }
        }

        public function update_generate_kode($data,$id)
        {
            $this->db->where('id_uxteser', $id);
            $this->db->update('master_uxteser', $data);
        }
    // Tambahan Sindhu End
}
?>