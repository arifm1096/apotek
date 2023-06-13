   <style>
    .tabel{
        border-collapse: collapse;
        font-size: 11px;
        margin: auto;
        width:100%;
        padding-top: 200;
    }
    .tabel th, .tabel td{
        padding: 3px;
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

    <page>
      <page_header>
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
        <p class="judul_content"> LAPORAN SIMPANAN</p>
        <!-- End HEader -->
      </page_header>
       <!-- Table Content -->
          <table id="tbl_pinjaman" border="1px" class="tabel">
                <tr>
                    <th> No. </th>
                    <th style="width: 10px; text-align: right;">ID</th>
                    <th>NIS</th>
                    <th>Nik / Username</th>
                    <th>Nama Lengkap</th>
                    <th>Jenis Kelamin</th>
                    <th>Alamat</th>
										<th>Jabatan</th>
										<th>Unit Kerja</th>
										<th>Perusahaan</th>
                    <th>No Rekening</th>
                    <th>Th. Masuk</th>
                    <th>Tgl. Regestrasi</th>
                    <th>Aktif</th>
                  </tr>
                <?php 
                      $no = 1;
                      if(!empty($data)){
                          foreach ($data as $key => $val) {
                ?>
                    <tr>
                      <td><?php echo $no++; ?></td>
                      <td><?php echo $val->id;?> </td>
                      <td><?php echo $val->nis;?> </td>
                      <td><?php echo $val->nik_username;?> </td>
                      <td><?php echo $val->nama_lengkap;?> </td>
                      <td><?php echo $val->nama_jenis_kelamin;?> </td>
                      <td><?php echo $val->alamat;?> </td>
                      <td><?php echo $val->nama_jabatan;?> </td>
                      <td><?php echo $val->nama_unit_kerja;?> </td>
                      <td><?php echo $val->nama_perusahaan;?> </td>
                      <td><?php echo $val->nama_perusahaan;?> </td>
                      <td><?php echo $val->thn_masuk;?> </td>
                      <td><?php 
                      $tgl ="";
                      if(!empty($val->tgl_regestrasi)){
                        $tgl .= date_indo($val->tgl_regestrasi);
                      }
                      echo $tgl;
                      ?> </td>
                      <td><?php echo $val->nama_status_aktif;?> </td>
                    </tr>
                <?php     }
                      }
                ?>
          </table>                        
   
    </page>
     
    
   

            

          
           
      

     