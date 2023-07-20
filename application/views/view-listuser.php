<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Data User</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Data User</a></li>
                    <li class="breadcrumb-item active">User</li>
                </ol>
            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header">
                <button type="button" class="btn btn-info btn-sm" style="align-items: right;" data-toggle="modal"
                    data-target="#modal_input_user" data-backdrop="static" data-keyboard="false">
                    <i class="fa fa-plus"></i> Add Data
                </button>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="tbl_user" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Nama Akun</th>
                            <th>Username</th>
                            <th>Hak Akses</th>
                            <th>Wilayah</th>
                            <th>Status Aktif</th>
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
<div class="modal fade" id="modal_input_user">
    <div class="modal-dialog modal-lg modal-dialog-centered">
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
                        <h5>Data User</h5>
                        <hr>

                        <form id="add_user">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                        value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                                    <input type="hidden" name="id" id="id">
                                    <div class="form-group">
                                        <label>Nama Akun</label>
                                        <input type="text" id="nama" name="nama" class="form-control"
                                            placeholder="Inputkan Username">
                                    </div>
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input type="text" id="username" name="username" class="form-control"
                                            placeholder="Inputkan Username">
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" id="password" name="password" class="form-control"
                                            placeholder="Inputkan Password">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Hak Akses</label>
                                        <select class="form-control" id="select_level" name="level"
                                            style="width: 100%;">
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Gudang</label>
                                        <select class="form-control" id="select_gudang" name="gudang"
                                            style="width: 100%;">
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Status Aktif</label>
                                        <select class="form-control" id="select_aktif" name="aktif"
                                            style="width: 100%;">
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="social-auth-links text-center mb-1">
                            <div class="row">
                                <div class="col-md-6">
                                    <button class="btn btn-block btn-primary" onclick="save();">
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

<!-- <form role="form" id="contentUser" action="">
        <input type="hidden" name="id_user" id="id_user">
        <div class="form-group">
              <label for="cc-payment" class="control-label mb-1">Level</label>
              <select class="form-control" id="select_level" name="level" style="width: 100%;">
              </select>
          </div>
        <div class="form-group row">
            <label for="input-data" class="col-sm-3 col-form-label">Username</label>
            <div class="col-sm-7">
              <input type="text" class="form-control" id="username"
              name="username" placeholder="Inputkan Username">
            </div>
        </div>

        <div class="form-group row">
            <label for="input-data" class="col-sm-3 col-form-label">Password</label>
            <div class="col-sm-7">
              <input type="password" class="form-control" id="Inputkan Password"
              name="password" placeholder="Password">
            </div>
        </div>
        <div class="form-group row">
            <label for="input-data" class="col-sm-3 col-form-label">Level</label>
            <div class="col-sm-7">
              
            </div>
        </div>
        <div class="form-group row">
            <label for="input-data" class="col-sm-3 col-form-label">Status Aktif</label>
            <div class="col-sm-7">
              <select class="select2 form-control" id="select_aktif" name="aktif" style="width: 100%;">
              </select>
            </div>
        </div>
      </form> -->