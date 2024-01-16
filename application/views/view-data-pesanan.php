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
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="search" class="form-control" id="filter_text" name="filter_text"
                                oninput="filter_data()" placeholder="Masukan Pencarian Nama Produk Atau Barcode">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <select class="form-control" name="status_terima" id="status_terima" onchange="filter_data()">
                        </select>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <input type="search" class="form-control" id="tgl_awal" name="tgl_awal"
                                oninput="filter_data()" placeholder="Masukan Tgl Awal">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="input-group">
                            <input type="search" class="form-control" id="tgl_awal" name="tgl_awal"
                                oninput="filter_data()" placeholder="Masukan Tgl Akhir">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-success btn-md float-right ml-1" onclick="clear_list();"
                            data-toggle="tooltip" data-placement="top" title="Export Excel"><i class="fa fa-file-excel"
                                aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-warning btn-md float-right  " onclick="export_pdf();"
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
                                    <th>Qty Pesan</th>
                                    <th>Qty Diterima</th>
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
<div class="modal fade" id="modal_terima_barang">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h4 class="modal-title" id="mediumModalLabel"><i class="fa fas fa-shopping-bag"></i> &nbsp;Produk
                    Diterima
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <form id="pesan_diterima">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                            <input type="hidden" name="id" id="id">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Nama Produk</label>
                                        <h3 id="v-produk"></h3>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Jumlah Dipesan</label>
                                        <h3 id="v-qty"></h3>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Nama Satuan</label>
                                        <h3 id="v-satuan"></h3>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Jumlah Diterima</label>
                                        <input type="text" id="jumlah_terima" name="jumlah_terima" class="form-control"
                                            placeholder="Inputkan Jumlah Diterima" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-success" type="submit">
                                        <i class="fa fa-save fa-lg"></i> &nbsp;
                                        <span id="save-button">Simpan</span>
                                        <span id="send-button" style="display:none;">Sending…</span>
                                    </button>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-danger" type="button" onclick="close_terima()">
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