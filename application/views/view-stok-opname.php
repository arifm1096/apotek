<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4>Stok Opname</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <button type="button" class="btn btn-success btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="add_data();">
                        <i class="fa fa-file-excel"></i> Export
                    </button>
                </ol>

            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header bg-danger">
                <div class="row">
                    <div class="col-md-8">
                        <label>Cari Produk:</label>

                    </div>
                    <div class="col-md-3">
                        <label>Pilih Rak :</label>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">

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

                        <select name="filter_rak" id="filter_rak" class="form-control select2"
                            onchange="filter_data();">
                        </select>
                    </div>

                    <div class="col-md-1">

                        <button type="button" class="btn btn-default btn-md" onclick="clear_filter();"> <i
                                class="fa fa-window-close" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <table id="tbl_so" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Nama Produk</th>
                            <th>Stok Total </th>
                            <th>Rak</th>
                            <th>Terakhir di-Opname</th>
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
<div class="modal fade" id="modal_stok_opname">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h4 class="modal-title" id="mediumModalLabel"><i class="fa fa-search"></i> Stok Opname</h4>
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
                            <div class="col-md-12 text-center">
                                <h4><b>
                                        Stok Opname : <div id="nama_obat"></div>
                                    </b></h4>
                            </div>
                        </div>
                        <hr>
                        <form id="stok_opname">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Gudang</label>
                                        <input type="hidden" id="id_stok">
                                        <input type="hidden" id="id_produk">
                                        <input type="hidden" id="id_stok_opname">
                                        <input type="text" id="nama_gudang" name="nama_gudang" class="form-control"
                                            readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Tgl. Expired</label>
                                        <input type="text" id="exp_date" name="exp_date" class="form-control" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Kode Produk - KSU</label>
                                        <input type="text" id="kode_ksu" name="kode_ksu" class="form-control" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Catatan</label>
                                        <textarea class="form-control" name="catatan" id="catatan" cols="30"
                                            rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Stok Sistem</label>
                                        <input type="text" id="jumlah_stok" name="jumlah_stok" class="form-control"
                                            readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Stok Fisik</label>
                                        <input type="text" id="stok_fisik" name="stok_fisik" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Penyesuaian</label>
                                        <input type="text" id="penyesuaian" name="penyesuaian" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Verifikasi</label>
                                        <select name="verifikasi" id="verifikasi" class="form-control">
                                            <option value=""> -- Pilih Verifikasi -- </option>
                                            <option value="y"> Ya</option>
                                            <option value="n"> Tidak</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-9">
                                    <button class="btn btn-block btn-info" type="button" onclick="save_stok_opname()">
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