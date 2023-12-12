   <style>
.tabel {
    border-collapse: collapse;
    font-size: 10px;
    margin: auto;
    padding-top: 200px;
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
           <p class="judul_content"> REKAP MASTER PRODUK</p>
       </page_header>

       <!-- End HEader -->
       <!-- Table Content -->
       <table border="1px" class="tabel">
           <tr>
               <th style="width: 10px; text-align: right;">No.</th>
               <th width="10px">SKU KODE</th>
               <th>Nama Produk</th>
               <th>Produk By</th>
               <th>Nama Rak</th>
               <th>Jumlah Minimal</th>
               <th>Nama Satuan</th>
               <th>Status Jual</th>
           </tr>
           <?php 
                $no = 1;
                if(!empty($data_produk)){
                    foreach ($data_produk as $key => $val) {
          ?>
           <tr>
               <td style="text-align: center;"><?php echo $no++; ?></td>
               <td><?php echo wordwrap($val->sku_kode_produk,10,"<br>\n");?></td>
               <td><?php echo wordwrap($val->nama_produk,20,"<br>\n");?> </td>
               <td><?php echo wordwrap($val->produk_by,10,"<br>\n");?> </td>
               <td><?php echo $val->nama_rak;?></td>
               <td><?php echo $val->jumlah_minimal;?></td>
               <td><?php echo $val->nama_satuan;?></td>
               <td><?php echo $val->nama_jual;?></td>
           </tr>
           <?php     }
                }
          ?>
       </table>

   </page>