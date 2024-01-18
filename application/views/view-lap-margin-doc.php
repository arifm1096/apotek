<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4>Laporan Data Margin Resep Dokter</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <button type="button" class="btn btn-success btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="export_excel();">
                        <i class="fa fa-file-excel"></i> Export Excel
                    </button>
                    <button type="button" class="btn btn-warning btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="export_pdf();">
                        <i class="fa fa-file-excel"></i> Export PDF
                    </button>
                </ol>

            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header bg-danger">
                <div class="row">
                    <div class="col-md-3">
                        <label>Filter Tanggal:</label>
                    </div>
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <input type="text" class="form-control tgl_piker" name="tanggal1" id="tanggal1"
                            onchange="filter_data();">
                    </div>
                    <div class="col-md-2">
                        <input type="text" class="form-control tgl_piker" name="tanggal2" id="tanggal2"
                            onchange="filter_data();">
                    </div>
                    <div class="col-md-1">
                        <button type="button" class="btn btn-default btn-md" onclick="clear_filter();"> <i
                                class="fa fa-window-close" aria-hidden="true"></i></button>
                    </div>
                    <div class="col-md-2">
                        <h4 id="total_pejualan" style="font-weight:bold">Total Margin :</h4>
                    </div>
                    <div class="col-md-3">
                        <h4 id="total_nominal" style="font-weight:bold"></h4>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <table id ="tbl_margin" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Nama Produk</th>
                            <th>Total Terjual</th>
                            <th>Harga Beli</th>
                            <th>Total Harga Beli</th>
                            <th>Harga Jual</th>
                            <th>Total Harga Jual</th>
                            <th>Margin</th>
                            <!-- <th style="width: 75px; ">Action</th> -->
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <th colspan="2">Total</th>
                        <th>
                            <div id="tot_produk"></div>
                        </th>
                        <th>
                            <div id="tot_harga_beli"></div>
                        </th>
                        <th>
                            <div id="sub_tot_harga_beli"></div>
                        </th>
                        <th>
                            <div id="tot_harga_jual"></div>
                        </th>
                        <th>
                            <div id="sub_tot_harga_jual"></div>
                        </th>
                        <th>
                            <div id="total_margin"></div>
                        </th>
                    </tfoot>

                </table>
            </div>

            <!-- /.card-body -->
        </div>
    </div><!-- /.container-fluid -->
</section>