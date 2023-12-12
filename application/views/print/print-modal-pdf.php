   <style>
.tabel {
    border-collapse: collapse;
    font-size: 13px;
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
           <p class="judul_content"> LAPORAN MODAL</p>
       </page_header>

       <!-- End HEader -->
       <!-- Table Content -->
       <table border="1px" class="tabel">
           <tr>
               <th style="width: 10px; text-align: right;">No.</th>
               <th>Kode KSU</th>
               <th>Nama Produk</th>
               <th>Harga Beli</th>
               <th>Jumlah Stok</th>
               <th>Total Beli</th>
           </tr>
           <?php 
                $no = 1;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
          ?>
           <tr>
               <td style="text-align: center;"><?php echo $no++; ?></td>
               <td><?php echo $val->sku_kode_produk;?> </td>
               <td><?php echo $val->nama_produk;?></td>
               <td><?php echo $val->harga_beli;?></td>
               <td><?php echo $val->jumlah_stok;?></td>
               <td><?php echo $val->total_harga;?></td>
           </tr>
           <?php     }
                }
          ?>
       </table>

       <table>
           <tr>
               <td>Nama Apoteker</td>
           </tr>
           <tr>
               <td><?php echo $this->session->userdata('nama_user');?></td>
           </tr>
       </table>

   </page>