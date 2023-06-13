<style>
    .h_tengah {text-align: center;}
    .h_kiri {text-align: left;}
    .h_kanan {text-align: right;}
    .txt_judul {font-size: 12pt; font-weight: bold; padding-bottom: 12px;}
    .header_kolom {background-color: #cccccc; text-align: center; font-weight: bold;}
    .txt_content {font-size: 7pt; text-align: center; page-break-before: auto;
        page-break-after: auto; 
        page-break-inside: avoid;
        position: relative;}
    .table_full { width: 740px;}
</style>

<table>
    <tr>
        <td  colspan="2" class="h_kanan table_full"><strong><?php echo $set->nama_koperasi;?></strong></td>
    </tr>
    <tr>
        <td valign="top">
            <strong><u>BUKTI PENARIKAN TUNAI</u></strong>
        </td>
        <td class="h_kanan" width="90%"><?php echo $set->alamat;?></td>
    </tr>
</table>

<table width="100%">
    <tr>
        <td  class="table_full" colspan="6"></td>
    </tr>
    <tr>
        <td width="20%"> Tanggal Transaksi </td>
        <td width="2%">:</td>
        <td width="35%" class="h_kiri"><?php echo date($data->tgl_simpan);?></td>
        <td> Tanggal Cetak </td>
        <td width="2%">:</td>
        <td width="25%" class="h_kiri"><?php echo date_indo(date('Y-m-d')); ?> / <?php echo date('H:i:s'); ?></td>
    </tr>
    <tr>
        <td> Nomor Transaksi </td>
        <td>:</td>
        <td><?php echo $data->kode;?></td>

        <td> User Akun </td>
        <td width="2%">:</td>
        <td class="h_kiri"><?php echo $data->username;?></td>
    </tr>
    <tr>
        <td> NIK </td>
        <td>:</td>
        <td><?php echo $data->nis;?></td>
    
        <td> Status </td>
        <td width="2%">:</td>
        <td class="h_kiri">SUKSES</td>
    </tr>
    <tr>
        <td> Nama Anggota </td>
        <td>:</td>
        <td><?php echo $data->nama_lengkap;?></td>
    </tr>
    <tr>
        <td> Dept </td>
        <td>:</td>
        <td><?php echo $data->nama_institusi_dept;?></td>
    </tr>
                
    <tr>
        <td> Jenis Kas </td>
        <td>:</td>
        <td><?php echo $data->nama_kas;?></td>
    </tr>
    <tr>
        <td> Jumlah Setoran </td>
        <td>:</td>
        <td>Rp. <?php echo number_format($data->jumlah_nominal,0,',','.'); ;?></td>

        <td></td>
        <td width="2%"></td>
        <td class="h_kiri">____________ </td>
    </tr>
    <tr>
        <td> Terbilang </td> 
        <td>:</td>
        <td colspan="3" style="text-transform: capitalize;"> <?php echo terbilang($data->jumlah_nominal) ; ?> rupiah </td>
    </tr>
</table> 
<br>
<p class="txt_content">Ref.<?php echo date('Ymd_His'); ?><br> 
    Informasi Hubungi Call Center : <?php echo $set->no_hp;?>
    <br>
    atau dapat diakses melalui : <?php echo $set->website;?>
</p>