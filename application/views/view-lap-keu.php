<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4>Laporan Keuangan</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
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
                        <!-- <h4 id="total_pejualan" style="font-weight:bold">Total Margin :</h4> -->
                    </div>
                    <div class="col-md-3">
                        <h4 id="total_nominal" style="font-weight:bold"></h4>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <table class="table table-bordered">
                    <tr>
                        <th colspan="2"> <h5>Modal</h5></th>
                    </tr>
                    <tr>
                        <th>Modal</th>
                        <th><div id="modal"></div></th>
                    </tr>

                    <tr>
                        <th colspan="2"> <h5>Pemasukan</h5></th>
                    </tr>
                    <tr>
                        <th>Margin Penjualan Kasir</th>
                        <th><div id="m_penjualan"></div></th>
                    </tr>
                    <tr>
                        <th>Margin Resep Dokter</th>
                        <th><div id="m_resep"></div></th>
                    </tr>
                    <tr>
                        <th>Jumlah Margin</th>
                        <th><div id="tot_margin"></div></th>
                    </tr>

                    <tr>
                        <th colspan="2"> <h5>Penjualan</h5></th>
                    </tr>
                    <tr>
                        <th>Total Penjualan Kasir</th>
                        <th><div id="pen_kas"></div></th>
                    </tr>
                    <tr>
                        <th>Total Penjualan Resep Dokter</th>
                        <th><div id="pen_dok"></div></th>
                    </tr>
                    <tr>
                        <th>Total Penjualan</th>
                        <th><div id="tot_pen"></div></th>
                    </tr>

                    <tr>
                        <th colspan="2"> <h5>Pembelian</h5></th>
                    </tr>
                    <tr>
                        <th>Total Pembelian Kasir</th>
                        <th><div id="pem_kas"></div></th>
                    </tr>
                    <tr>
                        <th>Total Pembelian Resep Dokter</th>
                        <th><div id="pem_dok"></div></th>
                    </tr>
                    <tr>
                        <th>Total Pembelian</th>
                        <th><div id="tot_pem"></div></th>
                    </tr>

                    <tr>
                        <th colspan="2"> <h5>Laba</h5></th>
                    </tr>
                    <tr>
                        <th>Total Penjualan</th>
                        <th><div id="tot_pen_x"></div></th>
                    </tr>
                    <tr>
                        <th>Total Pembelian</th>
                        <th><div id="tot_pem_x"></div></th>
                    </tr>
                   
                    <tr>
                        <th>Laba Bersih</th>
                        <th><div id="laba_rugi"></div></th>
                    </tr>
                </table>
            </div>

            <!-- /.card-body -->
        </div>
    </div><!-- /.container-fluid -->
</section>