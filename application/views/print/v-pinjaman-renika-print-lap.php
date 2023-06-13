   <style>
    .tabel{
        border-collapse: collapse;
        font-size: 13px;
        margin: auto;
    }
    .tabel th, .tabel td{
        padding: 5px;
        text-align: center;
    }

    .tabel_head {
      margin-left: 5px;
      font-size: 15px;
    }
    .tanda-tangan{
        border-collapse: collapse;
    }

    .tabel_head tr, .tabel_head td{
        padding: 10px;
        vertical-align: bottom;
    }

    .kop_lap{
      font-size: 15px;
       margin: auto;
    }

    .judul{
      font-weight: bold;
      font-size: 25px;
       margin-bottom: 1px;
       font-style: oblique;
    }
    .judul_content{
      font-weight: bold;
      font-size: 20px;
       margin-bottom: 20px;
       font-style: oblique;
       text-align:center;
    }
    .tex{
       margin-bottom: 1px;
       margin-top: 1px;
    }

    </style>
     
    <table class="tabel_head">
      <tr>
        <td>
          <img src="<?php echo base_url()?>assets/images/logo/<?php echo $set->logo; ?>" width="110" height="80">
        </td>
        <td>
          <p class="judul"><?php echo $set->nama_koperasi;?></p>
          <p class="tex">Alamat : <?php echo $set->alamat; ?></p>
          <p class="tex">Telp. <?php echo $set->no_hp; ?></p>
          <p class="tex"> <?php echo $set->website; ?></p>
        </td>
      </tr>
    </table>
    <hr>
    <p class="judul_content"> LAPORAN PINJAMAN REGULER</p>
    <!-- End HEader -->
    <!-- Table Content -->
    <table id="tbl_pinjaman" border="1px" class="tabel">
          <tr>
            <th style="width: 10px; text-align: right;">No.</th>
            <th>Kode </th>
            <th>Tgl. Pinjaman</th>
            <th>Nik</th>
            <th>Nama Anggota</th>
            <th>Dept. Institusi</th>
            <th>Barang / Uang</th>
            <th>Nominal</th>
            <th>Lama Angsuran</th>
            <th>Bunga</th>
            <th>Biaya Admin</th>
            <th>Lunas</th>
            <th>User</th>
          </tr>
          <?php 
                $no = 1;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
          ?>
              <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $val->kode;?></td>
                <?php $tgl_pin = date('Y-m-d',strtotime($val->tgl_pinjam)) ?>
                <td><?php echo date_indo($tgl_pin);?></td>
                <td><?php echo $val->nis;?> </td>
                <td><?php echo $val->nama_lengkap;?> </td>
                <td><?php echo $val->nama_institusi_dept;?></td>
                <td><?php echo $val->nama_barang;?></td>
                <td><?php echo 'Rp '.number_format($val->jumlah_nominal,0,',','.');?></td>
                <td><?php echo $val->lama_angsuran;?></td>
                <td><?php echo $val->bunga;?></td>
                <td><?php echo 'Rp '.number_format($val->biaya_adm,0,',','.');?></td>
                <td> <?php echo $val->lunas_fix;?> </td>
                <td> <?php echo $val->username;?> </td>
              </tr>
          <?php     }
                }
          ?>
    </table>
   

            

          
           
      

     