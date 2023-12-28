<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">Dashboard Penjualan</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?php echo base_url();?>">Dashboard Penjualan</a></li>
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
            <div class="col-lg-4 col-6">

                <div class="small-box bg-info">
                    <div class="inner">
                        <h3><sup style="font-size: 20px">RP.</sup><?php echo number_format($penjualan,0,',','.');?>
                        </h3>
                        <p>Total Penjualan</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-4 col-6">

                <div class="small-box bg-success">
                    <div class="inner">
                        <h3>RP.</sup><?php echo number_format(0,0,',','.');?></h3>
                        <p>Retur Penjualan</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-4 col-6">

                <div class="small-box bg-warning">
                    <div class="inner">
                        <h3>
                            RP.</sup><?php echo number_format($margin,0,',','.');?>
                        </h3>
                        <p>Keuntungan / Margin</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>



        <div class="card">
            <div class="card-header border-0">
                <h3 class="card-title">10 Produk Terlaris Penjualan</h3>
                <div class="card-tools">
                    <a href="#" class="btn btn-tool btn-sm">
                        <i class="fas fa-bars"></i>
                    </a>
                </div>
            </div>
            <div class="card-body p-0">
                <div class="row">
                    <?php 
                        $no = 1;
                        if(!empty($produk)){
                            foreach ($produk as $key => $value) {
                          
                    
                    ?>
                    <div class="col-md-2">
                        <div class="description-block border-right">
                            <span class="description-percentage text-info"><i class="fas fa-caret-right"></i>
                                <?php echo $no++; ?></span>
                            <h5 class="description-header"><?php echo $value->qty; ?> Qty</h5>
                            <span class="description-text"><?php echo $value->nama_produk;?></span>
                        </div>
                    </div>

                    <?php 
                            }
                        }
                    ?>


                </div>
            </div>
        </div>

    </div><!-- /.container-fluid -->
</section>