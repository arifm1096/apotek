   <style>
.tabel {
    border-collapse: collapse;
    font-size: 15px;
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
           <p class="judul_content"> LAPORAN KEUANGAN</p>
           <p class="tex" style=" text-align: center; font-weight: bold;">Periode :
               <?php echo $tgl_awal.' s/d '.$tgl_akhir;?></p>
       </page_header>

       <!-- End HEader -->
       <!-- Table Content -->
       <br><br>
       <table border="1px" class="tabel" id="tbl_lap_keu">
           <tr>
               <th colspan="2">Modal</th>
           </tr>
           <tr>
               <th style="width:500px">Modal</th>
               <th><?php echo $tot_modal;?></th>
           </tr>

           <!-- Pemasukan -->
           <tr>
               <th colspan="2">Pemasukan</th>
           </tr>
           <tr>
               <td>Margin Penjualan Kasir</td>
               <td><?php echo $tot_margin_kas;?></td>
           </tr>
           <tr>
               <td>Margin Resep Dokter</td>
               <td><?php echo $tot_margin_res;?></td>
           </tr>
           <tr>
               <th>Jumlah Margin</th>
               <th><?php echo $tot_margin;?></th>
           </tr>
           <!-- Akun Pemasukan -->
           <tr>
               <th colspan="2">Pemasukan Akun Keuangan</th>
           </tr>


           <?php 
         if(!empty($akun_masuk)){
            foreach ($akun_masuk as $key => $val) {
         ?>
           <tr>
               <td><?php echo $val->nama_akun;?></td>
               <td><?php echo number_format($val->nominal,0,',','.');?></td>
           </tr>
           <?php    }
            }?>
           <tr>
               <th>Jumlah Pemasukan Akun</th>
               <th><?php echo number_format($total_akun_masuk,0,',','.'); ?></th>
           </tr>

           <!-- Penjualan -->

           <tr>
               <th colspan="2">Penjualan</th>
           </tr>
           <tr>
               <td>Total Penjualan Kasir</td>
               <td><?php echo $tot_pen_kas;?></td>
           </tr>
           <tr>
               <td>Total Penjualan Resep Dokter</td>
               <td><?php echo $tot_pen_dok;?></td>
           </tr>
           <tr>
               <th>Total Penjualan</th>
               <th><?php echo $tot_penjualan;?></th>
           </tr>

           <!-- pembaelian-->

           <tr>
               <th colspan="2">Pembelian</th>
           </tr>
           <tr>
               <td>Total Pembelian Kasir</td>
               <td><?php echo $tot_pem_kas;?></td>
           </tr>
           <tr>
               <td>Total Pembelian Resep Dokter</td>
               <td><?php echo $tot_pem_dok;?></td>
           </tr>
           <tr>
               <th>Total Pembelian</th>
               <th><?php echo $tot_pembelian;?></th>
           </tr>

           <!-- Pengeluaran Akun -->

           <tr>
               <th colspan="2">Pengeluaran Akun Keuangan</th>
           </tr>
           <?php 
         if(!empty($akun_keluar)){
            foreach ($akun_keluar as $key => $val) {
         ?>
           <tr>
               <td><?php echo $val->nama_akun;?></td>
               <td><?php echo number_format($val->nominal,0,',','.');?></td>
           </tr>
           <?php    }
            }?>
           <tr>
               <th>Total Pengeluaran</th>
               <th><?php echo number_format($total_akun_keluar,0,',','.'); ?></th>
           </tr>

           <tr>
               <th colspan="2">Laba</th>
           </tr>
           <tr>
               <th>Total Penjualan</th>
               <th><?php echo $tot_penjualan;?></th>
           </tr>
           <tr>
               <th>Total Pemasukan</th>
               <th><?php echo number_format($total_akun_masuk,0,',','.'); ?></th>
           </tr>
           <tr>
               <th>Total Pembelian</th>
               <th><?php echo $tot_pembelian; ?></th>
           </tr>
           <tr>
               <th>Total Pengeluaran</th>
               <th><?php echo number_format($total_akun_keluar,0,',','.'); ?></th>
           </tr>
           <tr>
               <th>Laba Bersih</th>
               <th><?php echo $laba_rugi;?></th>
           </tr>
       </table>

   </page>