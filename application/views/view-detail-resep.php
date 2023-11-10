<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Data Detail Resep</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Pelayanan</a></li>
                    <li class="breadcrumb-item active">Detail Resep</li>
                </ol>
            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header">
                <!-- <button type="button" class="btn btn-info btn-sm" onclick="add_racik()">
                    <i class="fa fa-plus"></i> Add Data
                </button> -->
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="tbl_remik" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Kode Racikan</th>
                            <th>Nama Racikan</th>
                            <th>Keterangan</th>
                            <th>Status</th>
                            <th>Action</th>
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
                        <h5>Data Rekamedik Dasar</h5>
                        <hr>
                        <form id="add_remik">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                            <input type="hidden" name="id_remik" id="id_remik">
                            <div class="form-group">
                                <label>Nama Pelanggan</label>
                                <input type="text" id="nama_pelanggan" name="nama_pelanggan" class="form-control"
                                    placeholder="Inputkan Nama dokter">
                            </div>
                            <div class="form-group">
                                <label>Alamat</label>
                                <textarea class="form-control" name="alamat" id="alamat" cols="30" rows="2"
                                    placeholder="Inputkan Alamat Pelanggan"></textarea>
                            </div>
                            <hr>
                            <h5>Tanda - Tanda Vital</h5>
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Tekanan Darah</label>
                                        <input type="text" id="tekanan_darah" name="tekanan_darah" class="form-control"
                                            placeholder="Tekanan Darah">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Tekanan Nafas</label>
                                        <input type="text" id="tekanan_nafas" name="tekanan_nafas" class="form-control"
                                            placeholder="Tekanan Nafas">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Denyut Nadi</label>
                                        <input type="text" id="denyut_nadi" name="denyut_nadi" class="form-control"
                                            placeholder="Denyut Nadi">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Suhu Tubuh</label>
                                        <input type="text" id="suhu_tubuh" name="suhu_tubuh" class="form-control"
                                            placeholder="Suhu Tubuh">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Kadar Oksigen</label>
                                        <input type="text" id="kadar_oksigen" name="kadar_oksigen" class="form-control"
                                            placeholder="Kadar Oksigen">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Skala Nyeri</label>
                                        <input type="text" id="skala_nyeri" name="skala_nyeri" class="form-control"
                                            placeholder="Skala Nyeri">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Lokasi Nyeri</label>
                                        <input type="text" id="lokasi_nyeri" name="lokasi_nyeri" class="form-control"
                                            placeholder="Lokasi Nyeri">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <h5>Alergi / Alergen :</h5>
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" type="checkbox" id="alergi_obat"
                                            name="alergi_obat" value="1">
                                        <label for="alergi_obat" class="custom-control-label">Alergi
                                            Obat</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" type="checkbox" id="alergi_makanan"
                                            name="alergi_makanan" value="1">
                                        <label for="alergi_makanan" class="custom-control-label">Alergi
                                            Makanan</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" type="checkbox" id="alergi_suhu"
                                            name="alergi_suhu" value="1">
                                        <label for="alergi_suhu" class="custom-control-label">Alergi
                                            Suhu</label>
                                    </div>
                                </div>
                            </div>
                            <div class="social-auth-links text-center mb-1" id="button-save">
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