<style>
    .h_tengah {text-align: center;}
    .h_kiri {text-align: left;}
    .h_kanan {text-align: right;}
    .txt_judul {font-size: 12pt; font-weight: bold; padding-bottom: 12px;}
    .header_kolom {background-color: #cccccc; text-align: center; font-weight: bold;}
    .txt_content {font-size: 7pt; text-align: center;}
</style>

<table width="100%">
    <tr>
        <td colspan="2" class="h_kiri" class="txt_judul"><strong>Koperasi Karyawan MIKAEL</strong>
        </td>
    </tr>
    <tr>
        <td class="h_kiri" width="100%">Jl. Karang Asem, Surakarta
        <hr width="100%"></td>
    </tr>
</table>

<div class="h_tengah"><strong>BUKTI PENCAIRAN DANA KREDIT </strong> <br> Ref.<?php echo date('Ymd_His'); ?></div>
		<br> Telah terima dari <strong>Koperasi Karyawan MEKAEL</strong>
		<br> Pada Tanggal <?php echo date_indo($pinjaman['tgl_pinjam']);?> untuk realisasi kredit sebessar Rp. <?php echo number_format($pinjaman['angsuran_pokok'],0,',','.'); ?> dengan rincian :
		<br>
<table width="100%" style="font-size: 12px;">   
    <tr>
        <td width="18%"> Nomor Kontrak </td>
        <td width="2%">:</td>
        <td width="45%"><?php echo $pinjaman['kode'];?></td>
    </tr>
    <tr>
        <td> NIK </td>
        <td>:</td>
        <td><?php echo $anggota->nis;?></td>
    </tr>
    <tr>
        <td> Nama Anggota </td>
        <td>:</td>
        <td><?php echo $anggota->nama_lengkap;?></td>
    </tr>
    <tr>
        <td> Dept </td>
        <td>:</td>
        <td><?php echo $anggota->nama_institusi_dept;?></td>
    </tr>
    <tr>
        <td> Alamat </td>
        <td>:</td>
        <td><?php echo $anggota->alamat;?></td>
    </tr>
    <tr>
        <td> Tanggal Pinjam </td>
        <td>:</td>
        <td><?php echo date_indo($pinjaman['tgl_pinjam']);?></td>
    </tr>
    <tr>
        <td> Tanggal Tempo </td>
        <td>:</td>
        <td><?php echo date_indo($pinjaman['tgl_tempo']);?></td>
    </tr>
    <tr>
        <td> Lama Pinjam </td>
        <td>:</td>
        <td><?php echo $pinjaman['lama_angsuran'];?> Bulan</td>
    </tr>
</table>
<br>
<table width="100%" style="font-size: 12px;">
    <tr>
        <td width="20%"> Total Pinjaman </td>
        <td width="7%">: Rp. </td>
        <td width="20%" class="h_kanan"><?php
                                $tot= $tot_tagihan['tot_jumlah_ags'];
                            echo number_format($tot,0,',','.'); ?></td>
    </tr>
    <tr>
        <td width="20%"> Pokok Pinjaman </td>
        <td width="7%">: Rp. </td>
        <td width="20%" class="h_kanan"><?php echo number_format($pinjaman['pokok_pinjaman'],0,',','.'); ?></td>
    </tr>
    <tr>
        <td> Angsuran Pokok </td>
        <td>: Rp. </td>
        <td class="h_kanan"><?php echo number_format($pinjaman['angsuran_pokok'],0,',','.');?></td>
    </tr>
    <tr>
        <td> Biaya Admin </td>
        <td>: Rp. </td>
        <td class="h_kanan"><?php echo number_format($pinjaman['biaya_adm'],0,',','.');?></td>
    </tr>
    <tr>
        <td> Angsuran Bunga </td>
        <td>: Rp. </td>
        <td class="h_kanan"><?php 
																		echo number_format($pinjaman['bunga_pinjaman'],0,',','.');
															?></td>
    </tr>
    <tr>
        <td> <strong>Jumlah Angsuran </strong></td>
        <td><strong>: Rp. </strong></td>
        <td class="h_kanan"><strong><?php echo number_format($pinjaman['jumlah_ags'],0,',','.');?></strong></td>
    </tr>
</table> 
<p style="text-transform:capitalize;font-size: 12px;">TERBILANG : <?php echo terbilang($pinjaman['jumlah_ags']);?> Rupiah</p>
<table width="90%" style="font-size: 12px;">
    <tr>
        <td style="height: 50px;width: 550px;"></td>
        <td style ="" class="h_tengah"><?php echo date_indo(date('Y-m-d')); ?></td>
    </tr>
    <tr>
        <td class="h_tengah"> <?php echo $anggota->username;?></td>
        <td class="h_tengah"><?php echo $anggota->nama_lengkap;?></td>
    </tr>
</table>