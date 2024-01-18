   <style>
.tabel {
    border-collapse: collapse;
    font-size: 11px;
    margin: auto;
    padding-top: 8px;
}

.tabel th,
.tabel td {
    padding: 5px;
}

.tabell {
    border-collapse: collapse;
    font-size: 13px;
    margin: auto;
    padding-top: 180px;
}

.tabell th,
.tabell td {
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
    font-size: 18px;
    margin-bottom: 1px;
    font-style: oblique;
}

.judul_content {
    font-weight: bold;
    font-size: 15px;
    margin-bottom: 2px;
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
                       <img src="<?php echo base_url();?>assets/images/images.jpg" width="70" height="65">
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
           <p class="judul_content">RESEP DOKTER</p>
           <p class="tex" style=" text-align: center; font-weight: bold;"> <u> <?php echo "Kode Resep :".$data_h->kode_resep; ?></u></p>
           <p class="tex" style=" text-align: center;">Hari / Tgl :
               <?php echo longdate_indo('Y-m-d')." ".date('H:i:s');?></p>
       </page_header>

       <!-- End HEader -->
       <!-- Table Content -->
       <table  class="tabell">
        <tr>
            <td valign="top" style="width: 200px;">
                Dokter : <?php echo $data_h->nama_dokter;?><br>
                Klinik : <?php echo $data_h->klinik_rs;?><br>
                Alamat : <?php echo $data_h->alamat;?><br>
                No Hp : <?php echo $data_h->no_hp;?><br>
            </td>
            <td valign="top">
                Pelanggan : <?php echo $data_h->nama_pelanggan;?><br>
                Alamat : <?php echo $data_h->alamat_p;?><br>
                No Hp : <?php echo $data_h->nohp_p;?><br>
            </td>
        </tr>
       </table>
       <table border="1px" class="tabel">
           <thead>
               <tr>
                    <th style="width: 10px; text-align: right;">No.</th>
                    <th>Nama Obat</th>
                    <th style="text-align: center;">Qty.</th>
                    <th style="text-align: center;">Satuan</th>
               </tr>
           </thead>

           <?php 
                $no = 1;
                if(!empty($data_l)){
                    foreach ($data_l as $key => $val) {
          ?>
           <tr>
               <td style="text-align: center;"><?php echo $no++; ?></td>
               <td style="width:200px"><?php echo $val->nama_produk;?></td>
               <td style="width:30px; text-align: center;"><?php echo $val->jumlah_produk;?></td>
               <td style="width:70px; text-align: center;"><?php echo $val->nama_satuan;?></td>
           </tr>
           <?php     }
                }
          ?>

       </table>
       <p style="font-size :11px">Keterangan : <u><?php echo $data_h->nama_status_resep;?></u> </p>
       <br><br><br>

       <table style="padding-left:300px;">
           <tr>
               <td>Nama Dokter</td>
           </tr>
           <tr>
               <td>
                   <br><br><br>
               </td>
           </tr>
           <tr>
               <td><b><?php echo $data_h->nama_dokter;?></b></td>
           </tr>
       </table>

   </page>