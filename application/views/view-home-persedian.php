<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">Dashboard Persediaan</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?php echo base_url();?>">Dashboard Persediaan</a></li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
    <div class="container-fluid">

        <div class="row">
            <div class="col-12">
                <h2 class="lead"><b>Selamat Datang</b></h2>
                <hr>
                <h2 class="lead"><b>Periode : <?php echo $periode;?></b></h2>

            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header border-0">
                        <h3 class="card-title">Riwayat Persediaan</h3>
                        <div class="card-tools">
                            <a href="#" class="btn btn-sm btn-tool">
                                <i class="fas fa-circle"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-success text-xl">
                                <i class="fa fa-shopping-bag"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    Rp. <?php echo number_format($pesediaan->total_modal,0,',','.');?>
                                </span>
                                <span class="text-muted">Stok dalam Rupiah</span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-warning text-xl">
                                <i class="fa fa-shopping-cart"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">Rp. 0
                                </span>
                                <span class="text-muted">Mutasi keluar/masuk </span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-0">
                            <p class="text-danger text-xl">
                                <i class="fa fa-credit-card"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    Rp. 100.000.000
                                </span>
                                <span class="text-muted">Pembelian</span>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header border-0">
                        <h3 class="card-title">Riwayat Persedian/Stok </h3>
                        <div class="card-tools">
                            <a href="#" class="btn btn-sm btn-tool">
                                <i class="fas fa-circle"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-info text-xl">
                                <i class="fa fa-shopping-bag"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    Rp. <?php echo number_format($penjualan,0,',','.');?>
                                </span>
                                <span class="text-muted">Terjual</span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-secondary text-xl">
                                <i class="fa fa-tag"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    Rp. <?php echo number_format($persediaan_awal->total_modal,0,',','.');?>
                                </span>
                                <span class="text-muted">Persediaan Awal</span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-0">
                            <p class="text-indigo text-xl">
                                <i class="fa fa-tags"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    Rp. <?php echo number_format($persediaan_akhir->total_modal,0,',','.');?>
                                </span>
                                <span class="text-muted">Persediaan Akhir</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header border-0">
                        <h3 class="card-title">Status Stok</h3>
                        <div class="card-tools">
                            <a href="#" class="btn btn-sm btn-tool">
                                <i class="fas fa-circle"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-lightblue text-xl">
                                <i class="fa fa-shopping-basket"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    <?php echo $produk->total_produk; ?> Qty
                                </span>
                                <span class="text-muted">Total Produk</span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-teal text-xl">
                                <i class="fa fa-hourglass-end"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    <?php echo $exp_tot;?> Qty
                                </span>
                                <span class="text-muted">Total Sudah Kadaluarsa</span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-0">
                            <p class="text-indigo text-xl">
                                <i class="fa fa-hourglass-half"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    <?php echo $exp_tot_3mn;?> Qty
                                </span>
                                <span class="text-muted">Total Akan Kadaluarsa (Dalam 3 Bulan)</span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-0">
                            <p class="text-indigo text-xl">
                                <i class="fa fa-tasks"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    <?php echo $pesediaan->total_produk;?>
                                </span>
                                <span class="text-muted">Total Stok</span>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header border-transparent bg-warning">
                                <h3 class="card-title text-bold">Produk Akan Expired (3 Bulan Sebelum exp.)</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table m-0">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Produk</th>
                                                <th>Tgl. Exp</th>
                                                <th>Qty</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                                $no = 1;
                                                if(!empty($exp_data_3mn)){
                                                foreach ($exp_data_3mn as $key => $val) {
                                                     if($no == 11){
                                                        break;
                                                    }
                                                   
                                            ?>
                                            <tr>
                                                <td>
                                                    <?php echo $no++;?>
                                                </td>
                                                <td>
                                                    <?php echo $val->nama_produk;?>
                                                </td>
                                                <td>
                                                    <?php echo $val->exp_date;?>
                                                </td>
                                                <td>
                                                    <?php echo $val->jumlah_stok;?>
                                                </td>
                                            </tr>
                                            <?php }
                                                };
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="card-footer clearfix">
                                <a href="<?php echo base_url('persediaan/stok_kadaluarsa')?>"
                                    class="btn btn-sm btn-secondary float-right">View All Orders</a>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header border-transparent bg-danger">
                                <h3 class="card-title text-bold">Produk Expired </h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table m-0">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Produk</th>
                                                <th>Tgl. Exp</th>
                                                <th>Qty</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                                $no = 1;
                                                if(!empty($exp_data)){
                                                foreach ($exp_data as $key => $val) {
                                                    if($no == 11){
                                                        break;
                                                    }
                                            ?>
                                            <tr>
                                                <td>
                                                    <?php echo $no++;?>
                                                </td>
                                                <td>
                                                    <?php echo $val->nama_produk;?>
                                                </td>
                                                <td>
                                                    <?php echo $val->exp_date;?>
                                                </td>
                                                <td>
                                                    <?php echo $val->jumlah_stok;?>
                                                </td>
                                            </tr>
                                            <?php }
                                                };
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="card-footer clearfix">
                                <a href="<?php echo base_url('persediaan/stok_kadaluarsa')?>"
                                    class="btn btn-sm btn-secondary float-right">View All Orders</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div><!-- /.container-fluid -->
</section>