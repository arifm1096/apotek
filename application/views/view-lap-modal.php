<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4>Laporan Modal</h4>
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
                        <h4> Total Modal : </h4>
                        <h4 id="total_nominal" style="font-weight:bold"></h4>
                    </div>
                    <div class="col-md-3">
                        <h4> Total Produk : </h4>
                        <h4 id="total_produk" style="font-weight:bold"></h4>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <table id="tbl_penjualan" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Nama Produk</th>
                            <th>Harga Beli</th>
                            <th>Jumlah Stok</th>
                            <th>Total Beli</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <th colspan="4">Total Modal</th>
                        <th>
                            <div id="qw"></div>
                        </th>
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
                <h6 class="modal-title" id="mediumModalLabel"><i class="fa fa-plus"></i> Tambah Stok</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <h5>
                            <div id="nama_produk_stok"></div>
                        </h5>
                        <div class="row">
                            <div class="col-md-6">
                                <h6><b>
                                        Gudang : <div id="nama_gudang_stok"></div>
                                    </b></h6>
                            </div>
                            <div class="col-md-6">
                                <h6>
                                    <b>
                                        Satuan Utama :<div id="satuan_stok"></div>
                                    </b>
                                </h6>
                            </div>
                        </div>


                        <hr>
                        <form id="data_penjualan">


                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Kuantitas</label>
                                        <input type="hidden" id="id_produk_stok">
                                        <input type="hidden" id="id_stok">
                                        <input type="text" id="jumlah_stok" name="jumlah_stok" class="form-control"
                                            placeholder="Inputkan Nama Produk" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Tgl. Expired</label>
                                        <input type="text" id="exp_date" name="exp_date" class="form-control tgl_piker"
                                            placeholder="Inputkan Nama Produk" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Satuan</label>
                                        <select name="id_satuan_stok" id="id_satuan_stok" class="form-control select2"
                                            required>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Supplier</label>
                                        <select name="id_supplier_stok" id="id_supplier_stok"
                                            class="form-control select2" required>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Harga Beli Per Satuan</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Rp.</span>
                                            </div>
                                            <input type="text" name="harga_beli" id="harga_beli" class="form-control">
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <p>*Klik <b>Tambahkan Produk</b>, Sebelum Lanjut Ke Tahap Selanjutnya</p>
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