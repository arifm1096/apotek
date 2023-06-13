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
        <p class="judul_content"> LAPORAN KAS KELUAR</p>
        <!-- End HEader -->
      </page_header>
       <!-- Table Content -->
          <table id="tbl_pinjaman" border="1px" class="tabel">
                <tr>
                  <th style="width: 10px; text-align: right;">No.</th>
                  <th>Kode Transaksi</th>
                  <th>Tgl. Transaksi</th>
                  <th>Uraian</th>
                  <th>Untuk Kas</th>
                  <th>Dari Akun</th>
                  <th>Jumlah</th>
                  <th>User</th>
                </tr>
                 <?php 
                $no = 1;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
          ?>
              <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $val->kode_trans;?></td>
                <td><?php echo $val->tanggal_trans;?> </td>
                <td><?php echo $val->ket;?></td>
                <td><?php echo $val->jenis_transaksi;?></td>
                <td><?php echo $val->nama_kas;?> </td>
                <td><?php echo $val->jumlah;?></td>
                <td> <?php echo $val->username;?> </td>
              </tr>
          <?php     }
                }
          ?>
          </table>                        
   
    </page>
     
    
   

            

          
           
      

     