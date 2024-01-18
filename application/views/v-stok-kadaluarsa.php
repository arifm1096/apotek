<table id="tbl_lap_ed" border="1px">
    <thead>
        <tr>
            <th style="width: 10px; text-align: right;">No.</th>
            <th>Nama Produk</th>
            <th>Supplier </th>
            <th>Gudang</th>
            <th>Tanggal Kadaluarsa</th>
            <th>Kuantitas</th>
        </tr>
    </thead>

    <?php 
                $no = 1;
                if(!empty($data)){
                    foreach ($data as $key => $val) {
          ?>
    <tr>
        <td style="text-align: center;"><?php echo $no++; ?></td>
        <td style="width:200px"><?php echo wordwrap($val->nama_produk,35,"<br>\n");?></td>
        <td style="width:100px"><?php echo $val->nama_supplier;?></td>
        <td style="width:100px"><?php echo $val->nama_gudang;?></td>
        <td style="width:50px"><?php echo date('d-m-Y',strtotime($val->exp_date));?></td>
        <td style="width:150px"><?php echo $val->jumlah_stok;?></td>
    </tr>
    <?php     }
                }
          ?>

</table>

<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.min.js"></script>
<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.table2excel.js"></script>
<script>
var table = $('#tbl_lap_ed');
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