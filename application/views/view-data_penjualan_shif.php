<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4>Laporan Penjualan Pershif</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <button type="button" class="btn btn-info btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="add_penjualan();">
                        <i class="fa fa-plus"></i> Tambah Penjualan
                    </button>
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
                    <div class="col-md-4">
                        <label>Cari Produk:</label>

                    </div>

                    <div class="col-md-3">
                        <label>Filter Shif:</label>
                    </div>
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-2">
                        <label>Total Penjualan:</label>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="search" class="form-control form-control" id="filter_text"
                                placeholder="Masukan Pencarian Anda" oninput="filter_data();">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-default">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <select name="shif" id="shif" class="form-control select2" onchange="filter_data();">
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <button type="button" class="btn btn-default btn-md" onclick="clear_filter();"> <i
                                class="fa fa-window-close" aria-hidden="true"></i></button>
                    </div>
                    <div class="col-md-3">
                        <h4 id="total_pejualan" style="font-weight:bold"></h4>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-2">
                        <label>Filter Tanggal :</label>
                        <input type="text" class="form-control tgl_piker" name="tanggal1" id="tanggal1"
                            onchange="filter_data();" autocomplete="off">
                    </div>
                    <div class="col-md-2">
                        <label>*</label>
                        <input type="text" class="form-control tgl_piker" name="tanggal2" id="tanggal2"
                            onchange="filter_data();" autocomplete="off">
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <table id="tbl_penjualan" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>No Nota</th>
                            <th>Nama Produk</th>
                            <th>Jumlah</th>
                            <th>Total Penjualan</th>
                            <!-- <th style="width: 75px; ">Action</th> -->
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3">Total</td>
                            <th>
                                <div id="tot_produk"></div>
                            </th>
                            <th>
                                <div id="tot_jual"></div>
                            </th>
                        </tr>
                    </tfoot>

                </table>
            </div>

            <!-- /.card-body -->
        </div>
    </div><!-- /.container-fluid -->
</section>

<!-- modal add start -->
<div class="modal fade" id="modal_data_penjualan">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h6 class="modal-title" id="mediumModalLabel"><i class="fa fa-plus"></i> Tambah Penjualan</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <form id="add_data_penjualan">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Produk</label>
                                        <select name="id_produk" id="id_produk" class="form-control select2" required>
                                        </select>
                                        <input type="hidden" name="nama_produk" id="nama_produk">
                                        <input type="hidden" name="id_satuan_utama" id="id_satuan_utama">
                                    </div>
                                    <div class="form-group">
                                        <label>Satuan</label>
                                        <select name="id_satuan" id="id_satuan" class="form-control select2" required>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Jumlah Produk / Qty</label>
                                        <input type="text" name="jumlah_produk" id="jumlah_produk" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Tanggal Penjualan</label>
                                        <input type="text" name="jumlah_produk" id="jumlah_produk" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Harga Jual Persatuan</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Rp.</span>
                                            </div>
                                            <input type="text" name="harga_jual" id="harga_jual" class="form-control"
                                                readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Total Penjualan</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Rp.</span>
                                            </div>
                                            <input type="text" name="total_harga" id="total_harga" class="form-control"
                                                readonly>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <p>*<b>Satuan & Qty</b>, mempengaruhi harga jual</p>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-9">
                                    <button class="btn btn-block btn-info" type="button"
                                        onclick="save_data_penjualan()">
                                        <i class="fa fa-save fa-lg"></i> &nbsp;
                                        <span id="save-button-produk">Simpan Data</span>
                                        <span id="send-button-produk" style="display:none;">Sending…</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.login-card-body -->
                </div>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- modal add end -->