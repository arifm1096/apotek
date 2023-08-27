<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Kartu Stok</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <!-- <button type="button" class="btn btn-danger btn-sm" style="align-items: right;"
                        onclick="add_data();">
                        <i class="fa fa-plus"></i> Add Data
                    </button> -->
                    <button type="button" class="btn btn-success btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="export_excel();">
                        <i class="fa fa-file-excel"></i> Export
                    </button>
                </ol>
            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header bg-danger">
                <div class="row">
                    <div class="col-md-12 d-flex justify-content-center">
                        <h3><b> <?php echo $produk->nama_produk; ?></b></h3>
                        <input type="hidden" id="id_produk" value="<?php echo $id_produk;?>">
                    </div>
                </div>
            </div>


            <!-- /.card-header -->
            <div class="card-body">
                <div class="row align-middle">
                    <div class="col-md-1.5">
                        <h4 class="align-middle">Periode :</h4>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="">Bulan</label>
                            <select name="bulan_filter" id="bulan_filter" class="form-control select2">
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="">Tahun</label>
                            <input type="text" name="tahun_filter" id="tahun_filter" class="form-control thn_piker">
                        </div>
                    </div>
                    <div class="col-md-1.5">
                        <h4 class="align-middle">Filter :</h4>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="">Gudang</label>
                            <select name="gudang_filter" id="gudang_filter" class="form-control select2">
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="">No Batch</label>
                            <input type="text" name="no_batch" id="no_batch" class="form-control">
                        </div>
                    </div>

                </div>
                <table id="tbl_produk" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Tanggal</th>
                            <th>Catatan Transaksi</th>
                            <th>Kode SKU</th>
                            <th>Expired Date</th>
                            <th>Petugas</th>
                            <th>Masuk</th>
                            <th>Keluar</th>
                            <th>Sisa</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_kartu_stok">
                    </tbody>

                </table>
            </div>
            <!-- /.card-body -->
        </div>
    </div><!-- /.container-fluid -->
</section>