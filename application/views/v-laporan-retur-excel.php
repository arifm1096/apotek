<table id="tbl_lap_retur" border="1px">
    <thead>
        <tr>
            <th>No</th>
            <th>Tgl. Retur</th>
            <th>No. Faktur</th>
            <th>Supplier</th>
            <th>Produk</th>
            <th>Total Retur</th>
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
        <td style="width:50px"><?php echo date('d-m-Y',strtotime($val->tgl_retur));?></td>
        <td style="width:150px"><?php echo $val->no_faktur;?></td>
        <td style="width:100px"><?php echo $val->nama_supplier;?></td>
        <td style="width:200px"><?php echo wordwrap($val->produk,40,"<br>\n");?></td>
        <td style="text-align: center;"><?php echo $val->jumlah_retur_p;?></td>
        <td style="width:50px"><?php echo $val->satuan;?></td>
    </tr>
    <?php     }
                }
          ?>

</table>

<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.min.js"></script>
<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.table2excel.js"></script>
<script>
var table = $('#tbl_lap_retur');
if (table && table.length) {
    var preserveColors = (table.hasClass('table2excel_with_colors') ? true : false);
    $(table).table2excel({
        exclude: ".noExl",
        name: "Data Bon",
        filename: "Laporan_Retur" + new Date().toISOString() + ".xls",
        // filename: "Pinjaman_reguler_" + new Date().toISOString().replace(/[\-\:\.]/g, "") + ".xls",
        fileext: ".xls",
        exclude_img: true,
        exclude_links: true,
        exclude_inputs: true,
        preserveColors: preserveColors
    });
}
</script>