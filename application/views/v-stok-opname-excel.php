<table border="1px" id="tbl_lap_so">
           <thead>
               <tr>
                   <th style="width: 10px; text-align: right;">No.</th>
                   <th>Nama Produk</th>
                   <th>Stok Total</th>
                   <th>Rak</th>
                   <th>Terakhir DI Opname</th>
               </tr>
           </thead>
           <?php 
                $no = 1;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
          ?>
           <tr>
               <td style="text-align: center;"><?php echo $no++; ?></td>
               <td style="width:250px"><?php echo wordwrap($val->nama_produk,45,"<br>\n");?></td>
               <td align="center" style="width:50px;"><?php echo $val->jumlah_stok;?></td>
               <td style="width:80px"><?php echo $val->nama_rak;?></td>
               <td style="width:50px"><?php if(date('d-m-Y',strtotime($val->tgl_so)) !=="01-01-1970") { echo date('d-m-Y',strtotime($val->tgl_so)); }?></td>
           </tr>
           <?php     }
                }
          ?>

       </table>

<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.min.js"></script>
<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.table2excel.js"></script>
<script>
var table = $('#tbl_lap_so');
if (table && table.length) {
    var preserveColors = (table.hasClass('table2excel_with_colors') ? true : false);
    $(table).table2excel({
        exclude: ".noExl",
        name: "Data Bon",
        filename: "Laporan_Stok_kadaluarsa" + new Date().toISOString() + ".xls",
        // filename: "Pinjaman_reguler_" + new Date().toISOString().replace(/[\-\:\.]/g, "") + ".xls",
        fileext: ".xls",
        exclude_img: true,
        exclude_links: true,
        exclude_inputs: true,
        preserveColors: preserveColors
    });
}
</script>