<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4>Status Konsiyasi Masuk</h4>
            </div>
            <div class="col-sm-6">

                <ol class="breadcrumb float-sm-right">
                    <button type="button" class="btn btn-success btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="export_excel();">
                        <i class="fa fa-file-excel"></i> Export
                    </button>
                </ol>
                <ol class="breadcrumb float-sm-right">
                    <button type="button" class="btn btn-danger btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="add_data_retur();">
                        <i class="fa fa-plus"></i>&nbsp Add Data
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
                        <label>Filter Tanggal:</label>
                    </div>
                    <div class="col-md-2">
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
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <table id="tbl_konsinyasi" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>No. Faktur</th>
                            <th>Penitip</th>
                            <th>Produk</th>
                            <th>Qty Konsiyasi</th>
                            <th>Harga Pokok</th>
                            <th style="width: 150px; ">Action</th>
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
    <div class="modal fade" id="modal_retur">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-danger">
                    <h4 class="modal-title" id="mediumModalLabel"><i class="fa fa-reply-all"></i> Retur Konsiyasi</h4>
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
                                <div class="col-md-3">
                                        <h6>
                                            <b>
                                                Nomer Faktur : <div id="no_faktur"></div> 
                                            </b>
                                        </h6>
                                </div>
                                <div class="col-md-2">
                                        <h6>
                                            <b>
                                                Nama Penitip :<div id="penitip"></div>
                                            </b>
                                        </h6>
                                </div>
                                <div class="col-md-2">
                                        <div class="form-group">
                                            <label>Tanggal Retur</label>
                                            <input type="text" id="tgl_retur" name="tgl_retur" class="form-control tgl_piker"
                                                placeholder="Inputkan Retur" required>
                                        </div>
                                </div>
                            </div>


                            <hr>
                            <div class="card-body table-responsive">
                                <table id="tbl_konsinyasi" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 10px; text-align: right;">No.</th>
                                            <th>Produk</th>
                                            <th>Tgl. Expired</th>
                                            <th>Stok</th>
                                            <th>Harga Pokok</th>
                                            <th style="width: 150px; ">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="list_konsinyasi_detail">
                                    </tbody>
                                </table>
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
<div class="modal fade" id="modal_bayar">
        <div class="modal-dialog modal-md modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-danger">
                    <h6 class="modal-title" id="mediumModalLabel"><i class="fa fa-money"></i> Bayar Konsiyasi</h4>
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
                                <div class="col-md-2">
                                    <h6><b>
                                            Faktur : <div id="nama_gudang_stok"></div>
                                        </b></h6>
                                </div>
                                <div class="col-md-2">
                                    <h6>
                                        <b>
                                            Penititp :<div id="satuan_stok"></div>
                                        </b>
                                    </h6>
                                </div>
                            </div>


                            <hr>
                            <form id="add_trans_keu">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                            <input type="hidden" name="id_trans_keu" id="id_trans_keu">
                            <div class="form-group">
                                <label>Tanggal</label>
                                <input type="text" id="tgl_trans" name="tgl_trans" class="form-control tgl_piker"
                                    placeholder="Inputkan Tanggal">
                            </div>
                            <div class="form-group">
                                <label>Akun Transaksi</label>
                                <select class="form-control select2" id="id_akun" name="id_akun" style="width: 100%;">
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Nominal</label>
                                <input type="text" id="nominal" name="nominal" class="form-control uang"
                                    placeholder="Inputkan Nominal">
                            </div>
                            <div class="form-group">
                                <label>Keterangan</label>
                                <textarea class="form-control" name="ket" id="ket" cols="30" rows="3"></textarea>
                            </div>
                            <div class="social-auth-links text-center mb-1">
                                <div class="row">
                                    <div class="col-md-6">
                                        <button class="btn btn-block btn-primary" type="submit">
                                            <i class="fa fa-save fa-lg"></i> &nbsp;
                                            <span id="save-button">Save</span>
                                            <span id="send-button" style="display:none;">Sending…</span>
                                        </button>
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn btn-block btn-danger" data-dismiss="modal">
                                            <i class="fa fa-times fa-lg"></i> &nbsp;
                                            <span>Batal</span>
                                        </button>
                                    </div>
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