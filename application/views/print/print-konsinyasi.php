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
           <p class="judul_content">DATA KONSINYASI</p>
           <p class="tex" style=" text-align: center; font-weight: bold;">Hari / Tgl :
               <?php echo longdate_indo('Y-m-d')." ".date('H:i:s');?></p>
       </page_header>

       <!-- End HEader -->
       <!-- Table Content -->
       <table border="1px" class="tabel">
           <thead>
               <tr>
                   <th style="width: 10px; text-align: right;">No.</th>
                   <th>Tgl. Terima</th>
                   <th>No. Faktur</th>
                   <th>Supplier</th>
                   <th>Produk</th>
                   <th>Qty. Konsiyasi</th>
                   <th>Satuan</th>
               </tr>
           </thead>


           <?php 
                $no = 1;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
          ?>
           <tr>
               <td style="text-align: center;"><?php echo $no++; ?></td>
               <td style="width:50px"><?php echo date('d-m-Y',strtotime($val->tgl_terima));?></td>
               <td style="width:100px"><?php echo $val->no_faktur;?></td>
               <td style="width:70px"><?php echo $val->nama_supplier;?></td>
               <td style="width:200px"><?php echo wordwrap($val->produk,40,"<br>\n");?></td>
               <td style="width:50px"><?php echo $val->jumlah_konsinyasi_p;?></td>
               <td style="width:50px"><?php echo $val->nama_satuan;?></td>
           </tr>
           <?php     }
                }
          ?>

       </table>
       <br><br><br>


       <table style="padding-left:150px;">
           <tr>
               <td style="width:300px;">Penerima</td>
               <td>Nama Apoteker</td>
           </tr>
           <tr>
               <td>
                   <br><br><br>
               </td>
           </tr>
           <tr>
               <td><b>(................................)</b></td>
               <td><b><?php echo $this->session->userdata('nama_user');?></b></td>
           </tr>
       </table>

   </page>