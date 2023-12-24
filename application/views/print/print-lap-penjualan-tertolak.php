   <style>
.tabel {
    border-collapse: collapse;
    font-size: 12px;
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
           <p class="judul_content"> REKAP DATA PENJUALAN TERTOLAK</p>
           <p class="tex" style=" text-align: center; font-weight: bold;">Periode :
               <?php echo $tgl_awal.' s/d '.$tgl_akhir;?></p>
       </page_header>

       <!-- End HEader -->
       <!-- Table Content -->
       <br><br>
       <table border="1px" class="tabel">
           <thead>
               <tr>
                   <th>No</th>
                   <th>Nama Produk</th>
                   <th>Satuan</th>
                   <th>Jumlah</th>
                   <th>Harga Jual</th>
                   <th>Catatan</th>
               </tr>
           </thead>

           <?php 
                $no = 1;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
          ?>
           <tr>
               <td style="text-align: center;"><?php echo $no++; ?></td>
               <td style="width:150px"><?php echo wordwrap($val->nama_produk,30,"<br>\n");?></td>
               <td><?php echo $val->satuan;?></td>
               <td><?php echo $val->jumlah;?></td>
               <td align="right"><?php echo number_format($val->harga_jual,0,',','.');?></td>
               <td style="width:250px"><?php echo wordwrap($val->catatan,40,"<br>\n");?></td>

           </tr>
           <?php     }
                }
          ?>

           <tr>
               <td colspan="3">Total</td>

               <td><?php echo $tot->qty_pro; ?></td>

               <td align="right"><?php echo number_format($tot->total,0,',','.');?></td>
               <td></td>
           </tr>

       </table>

   </page>