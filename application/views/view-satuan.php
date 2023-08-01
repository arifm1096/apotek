<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Data Satuan</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Master</a></li>
                    <li class="breadcrumb-item active">Data Satuan</li>
                </ol>
            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header">
                <button type="button" class="btn btn-info btn-sm" style="align-items: right;" data-toggle="modal"
                    data-target="#modal_input_satuan" data-backdrop="static" data-keyboard="false">
                    <i class="fa fa-plus"></i> Add Data
                </button>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="tbl_satuan" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Kode</th>
                            <th>Nama Satuan</th>
                            <th>Keterangan</th>
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
<div class="modal fade" id="modal_input_satuan">
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
                        <h5>Data Satuan</h5>
                        <hr>

                        <form id="add_satuan">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                            <input type="hidden" name="id_satuan" id="id_satuan">
                            <div class="form-group">
                                <label>Kode Satuan</label>
                                <input type="text" id="kd_statuan" name="kd_statuan" class="form-control"
                                    placeholder="Inputkan Hak Akses">
                            </div>
                            <div class="form-group">
                                <label>Nama Satuan</label>
                                <input type="text" id="nama_satuan" name="nama_satuan" class="form-control"
                                    placeholder="Inputkan Hak Akses">
                            </div>
                            <div class="form-group">
                                <label>Keterangan</label>
                                <textarea class="form-control" name="ket" id="ket" cols="30" rows="3"></textarea>
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