<table border="1px" class="tabel" id="tbl_trans_keu">
           <thead>
               <tr>
                   <th>No</th>
                   <th>Kode Akun</th>
                   <th>Nama Akun</th>
                   <th>Jenis Transaksi</th>
                   <th>Nominal</th>
                   <th>Keterangan</th>
               </tr>
           </thead>

           <?php 
                $no = 1;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
          ?>
           <tr>
               <td style="text-align: center;"><?php echo $no++; ?></td>
               <td style="width:70px"><?php echo $val->kd_akun;?></td>
               <td style="width:120px"><?php echo wordwrap($val->nama_akun,20,"<br>\n");?></td>
               <td style="text-align: center;"><?php echo $val->nama_transaksi;?></td>
               <td style="width:100px; text-align: right;"><?php echo number_format($val->nominal,0,',','.');?></td>
               <td style="width:200px"><?php echo wordwrap($val->ket,40,"<br>\n");?></td>

           </tr>
           <?php     }
                }
          ?>

       </table>

<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.min.js"></script>
<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.table2excel.js"></script>
<script>
var table = $('#tbl_trans_keu');
if (table && table.length) {
    var preserveColors = (table.hasClass('table2excel_with_colors') ? true : false);
    $(table).table2excel({
        exclude: ".noExl",
        name: "Data Bon",
        filename: "Laporan_Keuangan" + new Date().toISOString() + ".xls",
        // filename: "Pinjaman_reguler_" + new Date().toISOString().replace(/[\-\:\.]/g, "") + ".xls",
        fileext: ".xls",
        exclude_img: true,
        exclude_links: true,
        exclude_inputs: true,
        preserveColors: preserveColors
    });
}
</script>