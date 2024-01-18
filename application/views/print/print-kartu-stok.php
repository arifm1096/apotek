   <style>
.tabel {
    border-collapse: collapse;
    font-size: 11px;
    margin: auto;
    padding-top: 220px;
}

.tabel th,
.tabel td {
    padding: 5px;
}

.tabel_head {
    margin-left: 5px;
    font-size: 15px;
}

.tanda-tangan {
    border-collapse: collapse;
}

.tabel_head tr,
.tabel_head td {
    padding: 10px;
    vertical-align: bottom;
}

.kop_lap {
    font-size: 15px;
    margin: auto;
}

.judul {
    font-weight: bold;
    font-size: 25px;
    margin-bottom: 1px;
    font-style: oblique;
}

.judul_content {
    font-weight: bold;
    font-size: 20px;
    margin-bottom: 20px;
    font-style: oblique;
    text-align: center;
}

.tex {
    margin-bottom: 1px;
    margin-top: 1px;
}
   </style>

   <page>
       <page_header>
           <table class="tabel_head">
               <tr>
                   <td>
                       <?php if($kop->logo == ""){ ?>
                       <img src="<?php echo base_url();?>assets/images/images.jpg" width="110" height="80">
                       <?php }else{ ?>
                       <img src="assets/images/logo/<?php echo $kop->logo;?>" width="110" height="80">
                       <?php } ?>
                   </td>
                   <td>
                       <p class="judul"><?php echo $kop->nama_wilayah;?></p>
                       <p class="tex">Alamat : <?php echo $kop->alamat; ?></p>
                       <p class="tex">Telp. <?php echo $kop->no_hp; ?></p>
                   </td>
               </tr>
           </table>
           <hr>
           <p class="judul_content">KARTU STOK</p>
           <p class="tex" style=" text-align: center; font-weight: bold;">Hari / Tgl :
               <?php echo longdate_indo('Y-m-d')." ".date('H:i:s');?></p>
       </page_header>

       <!-- End HEader -->
       <!-- Table Content -->
       <table border="1px" class="tabel">
           <thead>
               <tr>
                    <th style="width: 10px; text-align: right;">No.</th>
                    <th>Tanggal</th>
                    <th>Catatan Transaksi</th>
                    <th>Kode SKU</th>
                    <th>Expired Date</th>
                    <th>Petugas</th>
                    <th>Masuk</th>
                    <th>Keluar</th>
                    <th>Sisa</th>
               </tr>
           </thead>

           <?php 
                $no = 1;
                $sisa = 0;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
                        $sisa += (int)$val->masuk - $val->keluar ;
          ?>
           <tr>
               <td style="text-align: center;"><?php echo $no++; ?></td>
               <td style="width:50px"><?php echo date('d-m-Y',strtotime($val->tgl));?></td>
               <td style="width:200px"><?php echo wordwrap($val->catat,40,"<br>\n");?></td>
               <td style="width:70px"><?php echo $val->sku_kode_produk;?></td>
               <td style="width:50px"><?php echo date('d-m-Y',strtotime($val->exp_date));?></td>
               <td style="width:50px"><?php echo $val->petugas;?></td>
               <td style="width:50px"><?php echo $val->masuk;?></td>
               <td style="width:50px"><?php echo $val->keluar;?></td>
               <td style="text-align: center;"><?php echo $sisa;?></td>
           </tr>
           <?php     }
                }
          ?>

       </table>
       <br><br><br>

       <table style="padding-left:600px;">
           <tr>
               <td>Nama Apoteker</td>
           </tr>
           <tr>
               <td>
                   <br><br><br>
               </td>
           </tr>
           <tr>
               <td><b><?php echo $this->session->userdata('nama_user');?></b></td>
           </tr>
       </table>

   </page>