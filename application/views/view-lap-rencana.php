<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4>Laporan Pembelian Rencana</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <button type="button" class="btn btn-success btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="export_excel();">
                        <i class="fa fa-file-excel"></i> Export Excel
                    </button>
                    <button type="button" class="btn btn-warning btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="export_pdf();">
                        <i class="fa fa-file-pdf"></i> Export PDF
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
                        <h4 id="total_pejualan" style="font-weight:bold">Total Pembelian :</h4>
                    </div>
                    <div class="col-md-3">
                        <h4 id="total_nominal" style="font-weight:bold"></h4>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <table id="tbl_rencana" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 5px; text-align: right;">No.</th>
                            <th>Nama Produk</th>
                            <th>Harga Beli</th>
                            <th>Total Pembelian</th>
                            <th>Pembelian</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>

            <!-- /.card-body -->
        </div>
    </div><!-- /.container-fluid -->
</section>