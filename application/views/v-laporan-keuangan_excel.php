<table border="1px" class="table table-bordered" id="tbl_lap_keu">
    <tr>
        <th colspan="2">Modal</th>
    </tr>
    <tr>
        <th>Modal</th>
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

<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.min.js"></script>
<script src="<?php echo base_url();?>assets/plugins/table2excel/jquery.table2excel.js"></script>
<script>
var table = $('#tbl_lap_keu');
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