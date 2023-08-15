<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Master Produk</h4>
            </div>
        </div>
        <div class="card card-danger card-outline">

            <div class="card-header">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>No. Surat</label>
                            <input type="text" id="no_sp" name="no_sp" class="form-control"
                                placeholder="Kosongkan Untuk Otomatis" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Supplier</label>
                            <select class="form-control select2" name="id_supplier" id="id_supplier">
                                <option value="pil"> --Pilih Produk--</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Tgl. Pesan</label>
                            <input type="text" id="no_sp" name="no_sp" class="form-control" placeholder="Tanggal Pesan"
                                required>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-app bg-info float-right ">
                            <i class="fa fa-plus"></i> Simpan Pesanan
                        </button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-sm btn-success float-left " data-toggle="modal"
                            data-target="#modal_add_produk">
                            <i class="fa fa-plus"></i> Tambah Produk
                        </button>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <div class="row">
                    <div class="col-md-12">
                        <table id="tbl_produk_ren" class="table table-striped" style="font-size: 14px;">
                            <thead>
                                <tr>
                                    <th style="width: 10px; text-align: right;">No.</th>
                                    <th>Produk</th>
                                    <th>Kuantitas </th>
                                    <th>Satuan </th>
                                    <th>Stok Terkini</th>
                                    <th style="width: 30px; text-align: right;">Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>

            <!-- /.card-body -->
        </div>
    </div><!-- /.container-fluid -->
</section>

<!-- modal penjualan tertolak start -->
<div class="modal fade" id="modal_add_produk">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h4 class="modal-title" id="mediumModalLabel"><i class="fa fas fa-shopping-bag"></i> &nbsp;Penjualan
                    Tertolak
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <form id="produk_add">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Nama Produk</label>
                                        <select class="form-control select2" name="id_produk" id="id_produk">
                                            <option value="pil"> --Pilih Produk--</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Jenis Pesanan</label>
                                        <select class="form-control" name="jenis_pesanan" id="jenis_pesanan">
                                            <option value="pil"> --Pilih Produk--</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Satuan</label>
                                        <select class="form-control" name="id_satuan" id="id_satuan">
                                            <option value="pil"> --Pilih Produk--</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Kuantitas</label>
                                        <input type="text" id="jumlah_produk" name="jumlah_produk" class="form-control"
                                            placeholder="Inputkan Kuantitias" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Harga Beli</label>
                                        <input type="text" id="harga_beli" name="harga_beli" class="form-control"
                                            placeholder="Inputkan Harga Beli" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Keterangan</label>
                                        <textarea class="form-control" name="keterangan" id="keterangan" cols="30"
                                            rows="3"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-success" type="submit">
                                        <i class="fa fa-save fa-lg"></i> &nbsp;
                                        <span id="save-button-tolak">Simpan</span>
                                        <span id="send-button-tolak" style="display:none;">Sending…</span>
                                    </button>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-danger" type="button" onclick="close_kasir()">
                                        <i class="fa fa-save fa-window-close"></i> &nbsp;
                                        <span id="batal-tolak">Batal</span>
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
<!-- modal penjualan tertolak end -->