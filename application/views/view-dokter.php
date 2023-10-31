<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Data dokter</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Data Master</a></li>
                    <li class="breadcrumb-item active">dokter</li>
                </ol>
            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header">
                <button type="button" class="btn btn-info btn-sm" style="align-items: right;" data-toggle="modal"
                    data-target="#modal_input_dokter" data-backdrop="static" data-keyboard="false">
                    <i class="fa fa-plus"></i> Add Data
                </button>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="tbl_dokter" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Kode dokter</th>
                            <th>Nama dokter</th>
                            <th>Username</th>
                            <th>Klinik</th>
                            <th>Alamat</th>
                            <th>No. HP</th>
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
<div class="modal fade" id="modal_input_dokter">
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
                        <h5>Data dokter</h5>
                        <hr>
                        <form id="add_dokter">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                            <input type="hidden" name="id_dokter" id="id_dokter">
                            <div class="form-group">
                                <label>Kode dokter </label> (Max 3 Karakter)
                                <input type="text" id="kode_dokter" name="kode_dokter" maxlength="3"
                                    class="form-control" placeholder="Inputkan dokter">
                            </div>
                            <div class="form-group">
                                <label>Nama dokter</label>
                                <input type="text" id="nama_dokter" name="nama_dokter" class="form-control"
                                    placeholder="Inputkan Nama dokter">
                            </div>
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" id="username" name="username" class="form-control"
                                    placeholder="Inputkan Nama dokter">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="text" id="password" name="password" class="form-control"
                                    placeholder="Inputkan Nama dokter">
                            </div>
                            <div class="form-group">
                                <label>Alamat</label>
                                <textarea class="form-control" name="alamat" id="alamat" cols="30" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Klinik / Rumah sakit</label>
                                <textarea class="form-control" name="klinik_rs" id="klinik_rs" cols="30"
                                    rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Nama Printer</label>
                                <input type="text" id="nama_print" name="nama_print" class="form-control"
                                    placeholder="Inputkan Nama dokter">
                            </div>
                            <div class="form-group">
                                <label>No. HP</label>
                                <input type="text" id="no_hp" name="no_hp" class="form-control"
                                    placeholder="Inputkan No. HP">
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