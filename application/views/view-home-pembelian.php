<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">Dashboard Pembelian</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?php echo base_url();?>">Dashboard Pembalian</a></li>
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

            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header border-0">
                        <h3 class="card-title">Status Pembelian</h3>
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
                                    Rp. 200.000.000
                                </span>
                                <span class="text-muted">Rencana Pembelian</span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-warning text-xl">
                                <i class="fa fa-shopping-cart"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">Rp. 200.000.000
                                </span>
                                <span class="text-muted">Pesanan Aktif</span>
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
                                <span class="text-muted">Hutang Pembelian</span>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header border-0">
                        <h3 class="card-title">Riwayat Pembelian</h3>
                        <div class="card-tools">
                            <a href="#" class="btn btn-sm btn-tool">
                                <i class="fas fa-circle"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-info text-xl">
                                <i class="fa fa-cart-arrow-down"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    Rp. 200.000.000
                                </span>
                                <span class="text-muted">Total Pembelian</span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                            <p class="text-secondary text-xl">
                                <i class="fa fa-file-pdf"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    Rp. 200.000.000
                                </span>
                                <span class="text-muted">Faktur Pembalian</span>
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-0">
                            <p class="text-indigo text-xl">
                                <i class="fa fa-share-square"></i>
                            </p>
                            <p class="d-flex flex-column text-right">
                                <span class="font-weight-bold">
                                    Rp. 100.000.000
                                </span>
                                <span class="text-muted">Retur Pembalian</span>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-transparent bg-warning">
                                <h3 class="card-title text-bold">Jatuh Tempo Terdekat</h3>
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
                                                <th>Nama Supplier</th>
                                                <th>Tgl Jatuh Tempo</th>
                                                <th>Nominal</th>
                                            </tr>
                                        </thead>
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
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-transparent bg-success">
                                <h3 class="card-title text-bold">Pesanan Aktif</h3>
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

                                                <th>Nama Supplier</th>
                                                <th>Tgl PO</th>
                                                <th>Nominal</th>
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