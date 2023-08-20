<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Rencana Pembelian</h4>
            </div>
        </div>
        <div class="card">

            <div class="card-header bg-danger">
                <div class="row">
                    <div class="col-md-6">

                        <div class="input-group">
                            <input type="search" class="form-control" id="filter_text" name="filter_text"
                                oninput="filter_data()" placeholder="Masukan Pencarian Nama Produk Atau Barcode">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <button type="button" class="btn btn-success btn-md float-right ml-1" onclick="clear_list();"
                            data-toggle="tooltip" data-placement="top" title="Export Excel"><i class="fa fa-file-excel"
                                aria-hidden="true"></i></button>
                                <button type="button" class="btn btn-warning btn-md float-right  " onclick="clear_list();"
                            data-toggle="tooltip" data-placement="top" title="Export Pdf"><i class="fa fa-file-pdf"
                                aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->
            <div class="row p-1">
                <div class="col-md-12">
                    <button type="button" class="btn btn-sm btn-danger float-right ml-1" onclick="get_pesanan();">
                        <i class="fa fa-plus"></i> Buat Pesanan
                    </button>
                </div>
            </div>
            <div class="card-body table-responsive">
                <div class="row">
                    <div class="col-md-12">
                        <table id="tbl_pesanan" class="table table-striped" style="font-size: 14px;">
                            <thead>
                                <tr>
                                    <th style="width: 10px; text-align: right;">No.</th>
                                    <th>Tgl. Pesan</th>
                                    <th>No. Sp.</th>
                                    <th>Produk</th>
                                    <th>Kuantitas </th>
                                    <th>Satuan </th>
                                    <th>Status</th>
                                    <th style="width: 120px; text-align: right;">Action</th>
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
                <h4 class="modal-title" id="mediumModalLabel"><i class="fa fas fa-shopping-bag"></i> &nbsp;Tambah Produk
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