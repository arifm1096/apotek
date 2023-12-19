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
        <!-- head end -->
        <div class="card">
            <div class="card-header">
                <button type="button" class="btn btn-info btn-sm" style="align-items: right;" data-toggle="modal"
                    data-target="#modal_input_akun" data-backdrop="static" data-keyboard="false">
                    <i class="fa fa-plus"></i> Add Data
                </button>
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
                            <input type="hidden" name="id_akun" id="id_akun">
                            <div class="form-group">
                                <label>Kode Akun</label>
                                <input type="text" id="kd_akun" name="kd_akun" class="form-control"
                                    placeholder="Inputkan Kode Akun">
                            </div>
                            <div class="form-group">
                                <label>Nama Akun</label>
                                <input type="text" id="nama_akun" name="nama_akun" class="form-control"
                                    placeholder="Inputkan Nama Akun">
                            </div>
                            <div class="form-group">
                                <label>Jenis Transaksi</label>
                                <select class="form-control" id="jenis_transaksi" name="jenis_transaksi"
                                    style="width: 100%;">
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Status Aktif</label>
                                <select class="form-control" id="select_aktif" name="aktif" style="width: 100%;">
                                </select>
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