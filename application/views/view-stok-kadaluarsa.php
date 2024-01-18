<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4>Stok Kadaluarsa</h4>
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
                    <div class="col-md-5">
                        <label>Cari Produk:</label>

                    </div>
                    <div class="col-md-3">
                        <label>Filter Status:</label>

                    </div>
                    <div class="col-md-3">
                        <label>Sebelum Tanggal:</label>

                    </div>

                </div>
                <div class="row">
                    <div class="col-md-5">

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
                    <div class="col-md-3">

                        <select name="kondisi_filter" id="kondisi_filter" class="form-control select2"
                            onchange="filter_data();">
                        </select>
                    </div>
                    <div class="col-md-3">

                        <input type="text" id="filter_tanggal" name="filter_tanggal" class="form-control tgl_piker"
                            placeholder="Inputkan Tanggal" onchange="filter_data();">
                    </div>
                    <div class="col-md-1">

                        <button type="button" class="btn btn-default btn-md" onclick="clear_filter();"> <i
                                class="fa fa-window-close" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <table id="tbl_kadaluarsa" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Nama Produk</th>
                            <th>Supplier </th>
                            <th>Gudang</th>
                            <th>Tanggal Kadaluarsa</th>
                            <th>Kuantitas</th>
                            <th style="width: 75px; ">Action</th>
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


<!-- modal add start -->
<div class="modal fade" id="modal_so_ed">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h6 class="modal-title" id="mediumModalLabel"><i class="fa fa-info-circle"></i> Opname Produk Kadaluarsa
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <p>
                                <h4><b>
                                        <div id="produk">
                                    </b>
                                </h4>
                                </p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <p><b>Supplier :</b>
                                <div id="supplier"></div>
                                </p>
                                <p><b>Gudang :</b>
                                <div id="gudang"></div>
                                </p>
                            </div>
                            <div class="col-md-6">
                                <p><b>Tgl Exp :</b>
                                <div id="tgl_exp"></div>
                                </p>
                                <p><b>Qty :</b>
                                <div id="qty_x"></div>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Satuan Utama :</label>
                                    <input type="hidden" name="id_stok_detail" id="id_stok_detail">
                                    <select name="status_op_ed" id="status_op_ed" class="form-control select2" required>
                                    </select>
                                </div>
                                <div class="form-group row">
                                    <label>Keterangan :</label>
                                    <div class="col-md-12">
                                        <textarea class="form-control" name="ket_op_ed" id="ket_op_ed" cols="50"
                                            rows="2"></textarea>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-9">
                                <button class="btn btn-block btn-info" type="button" onclick="save_opname()">
                                    <i class="fa fa-save fa-lg"></i> &nbsp;
                                    <span id="save-button">Opname Produk</span>
                                    <span id="send-button" style="display:none;">Sending…</span>
                                </button>
                            </div>
                        </div>
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

<!-- modal add start -->
<div class="modal fade" id="modal_stok_produk">
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
                        <form id="stok_produk">


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
                                    <button class="btn btn-block btn-info" type="button" onclick="save_stok_produk()">
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