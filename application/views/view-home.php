<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">Dashboard Umum</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?php echo base_url();?>">Dashboard</a></li>
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
            <div class="col-7">
                <h2 class="lead"><b>Selamat Datang</b></h2>

            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-3 col-6">

                <div class="small-box bg-info">
                    <div class="inner">
                        <h3><sup
                                style="font-size: 20px">RP.</sup><?php echo number_format($uang->total_uang,0,',','.');?>
                        </h3>
                        <p>Total Penjualan</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-6">

                <div class="small-box bg-success">
                    <div class="inner">
                        <h3><sup style="font-size: 20px">RP.</sup><?php echo $pembelian->jumlah_pembelian;?></h3>
                        <p>Retur Penjualan</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-6">

                <div class="small-box bg-warning">
                    <div class="inner">
                        <h3><sup style="font-size: 20px">RP.</sup>
                            <?Php echo $penjualan->jumlah_penjualan;?>
                        </h3>
                        <p>Penjualan Tertolak</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-12">
                        <div class="info-box mb-3 bg-info">
                            <span class="info-box-icon"><i class="fas fa-cloud-download-alt"></i></span>
                            <div class="info-box-content">
                                <span class="info-box-text">Penjualan 7 hari Terahkir</span>
                                <span class="info-box-number">Rp. 114,381</span>
                            </div>
                        </div>
                        <div class="info-box mb-3 bg-primary">
                            <span class="info-box-icon"><i class="fas fa-cloud-download-alt"></i></span>
                            <div class="info-box-content">
                                <span class="info-box-text">Penjualan 2 minggu</span>
                                <span class="info-box-number">Rp. 114,381</span>
                            </div>
                        </div>
                        <div class="info-box mb-3 bg-success">
                            <span class="info-box-icon"><i class="fas fa-cloud-download-alt"></i></span>
                            <div class="info-box-content">
                                <span class="info-box-text">Penjualan 1 bulan terhakir</span>
                                <span class="info-box-number">Rp. 114,381</span>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="col-md-6">
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
                                        <tbody id="list_exp">
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
                                        <tbody id="list_exp">
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