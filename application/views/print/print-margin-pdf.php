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
           <p class="judul_content"> REKAP DATA MARGIN PENJUALAN</p>
       </page_header>

       <!-- End HEader -->
       <!-- Table Content -->
       <table border="1px" class="tabel">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Produk</th>
                <th>Total Terjual</th>
                <th>Harga Beli</th>
                <th>Total Harga Beli</th>
                <th>Harga Jual</th>
                <th>Total Harga Jual</th>
                <th>Margin</th>
           </tr>
        </thead>
           
           <?php 
                $no = 1;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
          ?>
           <tr>
               <td style="text-align: center;"><?php echo $no++; ?></td>
               <td><?php echo wordwrap($val->nama_produk,20,"<br>\n");?> <br>
               <?php echo wordwrap($val->sku_kode_produk,10,"<br>\n");?></td>
               <td><?php echo $val->tot_produk_jual;?></td>
               <td><?php echo number_format($val->harga_beli,0,',','.');?></td>
               <td><?php echo number_format($val->tot_harga_beli,0,',','.');?></td>
               <td><?php echo number_format($val->harga_jual,0,',','.');?></td>
               <td><?php echo number_format($val->tot_harga_jual,0,',','.');?></td>
               <td><?php echo number_format($val->margin,0,',','.');?></td>
              
           </tr>
           <?php     }
                }
          ?>

               <tr>
                        <td colspan="2">Total</td>
                        
                            <td><?php echo $data_tot->tot_produk_terjual; ?></td>
                       
                            <td><?php echo number_format($data_tot->tot_harga_beli,0,',','.');?></td>
                       
                            <td><?php echo number_format($data_tot->sub_tot_harga_beli,0,',','.');?></td>
                       
                            <td><?php echo number_format($data_tot->tot_harga_jual,0,',','.');?></td>
                       
                            <td><?php echo number_format($data_tot->sub_tot_harga_jual,0,',','.');?></td>
                       
                            <td><?php echo number_format($data_tot->tot_margin,0,',','.');?></td>
                        </tr>
                   
       </table>

   </page>