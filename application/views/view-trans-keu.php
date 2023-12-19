<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Data Akun</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Master</a></li>
                    <li class="breadcrumb-item active">Data Akun</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <button type="button" class="btn btn-info btn-sm" style="align-items: right;" data-toggle="modal"
                    data-target="#modal_input_akun" data-backdrop="static" data-keyboard="false">
                    <i class="fa fa-plus"></i> Add Data
                </button>
            </div>
        </div><br>
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
                    <div class="col-md-2">
                        <label>Total Nominal : </label>
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
                    <div class="col-md-3">
                        <h4 id="total_nominal" style="font-weight:bold"></h4>
                    </div>
                </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <div class="row">
                    <div class="col-md-8">
                        <table id="tbl_akun" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 10px; text-align: center;">No.</th>
                                    <th>Kode Akun</th>
                                    <th>Nama Akun</th>
                                    <th>Jenis Transaksi</th>
                                    <th>Status Aktif</th>
                                    <th style="width: 75px; ">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
            <!-- /.card-body -->
        </div>
    </div><!-- /.container-fluid -->
</section>

<!-- modal add start -->
<div class="modal fade" id="modal_input_akun">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h6 class="modal-title" id="mediumModalLabel"><i class="fa fa-plus"></i> Add Data</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <h5>Data Akun</h5>
                        <hr>

                        <form id="add_akun">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                            <input type="hidden" name="id_trasn_keu" id="id_trasn_keu">
                            <div class="form-group">
                                <label>Akun Transaksi</label>
                                <select class="form-control" id="id_akun" name="id_akun" style="width: 100%;" required>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Nominal</label>
                                <input type="text" id="nominal" name="nominal" class="form-control uang"
                                    placeholder="Inputkan Nama Akun" required>
                            </div>
                            <div class="form-group">
                                <label>Tanggal</label>
                                <input type="text" id="tgl_trans" name="tgl_trans" class="form-control tgl_piker"
                                    placeholder="Inputkan Nama Akun" required>
                            </div>
                            <div class="form-group">
                                <label>Status Aktif</label>
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