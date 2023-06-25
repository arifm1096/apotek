<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Tambah Produk</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Produk</a></li>
                    <li class="breadcrumb-item active">Tambah Produk</li>
                </ol>
            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-body">
                <form id="add_produk">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Kode Produk / SKU</label>
                                <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                    value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                                <input type="hidden" name="id_produk">
                                <input type="text" id="sku_kode_produk" name="sku_kode_produk" class="form-control"
                                    placeholder="Inputkan Kode Produk / SKU" required>
                            </div>
                            <div class="form-group">
                                <label>Barcode</label>
                                <input type="text" id="barcode" name="barcode" class="form-control"
                                    placeholder="Inputkan Barcode">
                            </div>
                            <div class="form-group">
                                <label>Nama Produk</label>
                                <input type="text" id="nama_produk" name="nama_produk" class="form-control"
                                    placeholder="Inputkan Nama Produk" required>
                            </div>
                            <div class="form-group">
                                <label>Jenis Produk :</label>
                                <select name="id_jenis_produk" id="id_jenis_produk" class="form-control select2"
                                    required>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Rak :</label>
                                <select name="id_rak" id="id_rak" class="form-control select2" required>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Satuan Utama :</label>
                                <select name="satuan_utama" id="satuan_utama" class="form-control select2" required>

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Jumlah Utama</label>
                                <input type="number" id="jumlah_utama" name="jumlah_utama" class="form-control"
                                    placeholder="Inputkan Jumlah Utama" required>
                            </div>
                            <div class="form-group">
                                <label>Jumlah Minimal</label>
                                <input type="number" id="jumlah_minimal" name="jumlah_minimal" class="form-control"
                                    placeholder="Inputkan Jumlah Utama" required>
                            </div>

                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>
                    <p>*Klik <b>Tambahkan Produk</b>, Sebelum Lanjut Ke Tahap Selanjutnya</p>
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-4">
                            <button class="btn btn-block btn-info" type="submit">
                                <i class="fa fa-save fa-lg"></i> &nbsp;
                                <span id="save-button-produk">Tambakan Produk</span>
                                <span id="send-button-produk" style="display:none;">Sending…</span>
                            </button>
                        </div>
                    </div>
                </form>
                <hr>
                <!-- Detail Satuan -->
                <div class="row">
                    <div class="col-md-10">
                        <div class="form-group">
                            <p class="font-weight-bold">Detail Satuan Produk :</p>
                            <button class="btn btn-secondary btn-sm"><i class="fa fa-plus"> Tambah Satuan</i></button>
                            <p>*Klik <b>Tambahkan Satuan</b>, Untuk menambah Detail Satuan Produk</p>
                        </div>
                        <form id="add_detail_produk">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                            <div class="row">
                                <div class="col-md-3">
                                    <p class="font-weight-bold">Jumlah Produk</p>
                                </div>
                                <div class="col-md-3">
                                    <p class="font-weight-bold">Stauan Produk</p>
                                </div>
                                <div class="col-md-4">
                                    <p class="font-weight-bold">Jumlah Produk Persatuan</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <input type="text" id="jumlah_produk" name="jumlah_produk" class="form-control"
                                        placeholder="Inputkan Jumlah Produk">
                                </div>
                                <div class="col-md-3">
                                    <select name="id_satuan" id="id_satuan" class="form-control select2">
                                        <option value=""> Pilih Satuan</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Inputkan Produk Persatuan">
                                        <div class="input-group-append">
                                            <span class="input-group-text">Satuan</span>
                                            <button type="button" class="btn btn-sm bg-gradient-info"><i
                                                    class="fa fa-save"></i></button>
                                            <button type="button" class="btn btn-sm bg-gradient-warning"
                                                data-toggle="modal" data-target=".bd-example-modal-sm"><i
                                                    class="fa fa-pencil-alt"></i></button>
                                            <button type="button" class="btn btn-sm bg-gradient-danger"><i
                                                    class="fa fa-trash"></i></button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <hr>
                <!-- Jenis Harga Satuan -->
                <div class="row">
                    <div class="col-md-9">
                        <div class="form-group">
                            <p><b>Jenis Multi Harga :</b></p>
                        </div>
                        <div class="card card-info card-tabs">
                            <div class="card-header p-0 pt-1">
                                <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="tabs-fleksibel" data-toggle="pill"
                                            href="#tabs-fleksibel-in" role="tab" aria-controls="tabs-fleksibel-in"
                                            aria-selected="true">Harga Fleksibel</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tabs-grosir" data-toggle="pill" href="#tabs-grosir-in"
                                            role="tab" aria-controls="tabs-grosir-in" aria-selected="false">Harga
                                            Grosir</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tabs-member" data-toggle="pill" href="#tabs-memeber-in"
                                            role="tab" aria-controls="tabs-memeber-in" aria-selected="false">Member</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content" id="custom-tabs-one-tabContent">
                                    <div class="tab-pane fade active show" id="tabs-fleksibel-in" role="tabpanel"
                                        aria-labelledby="tabs-fleksibel">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Rp.</span>
                                                        </div>
                                                        <input type="text" name="harga_jual" id="harga_jual_fleksibel"
                                                            class="form-control">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" id="ket" name="ket" class="form-control"
                                                        placeholder="Inputkan Keterangan">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="button" class="btn btn-sm bg-gradient-danger"><i
                                                        class="fa fa-trash"></i></button>
                                            </div>
                                        </div>
                                        <p>*Klik <b>Tambahkan Harga Fleksibel</b>, Untuk menambahkan data master harga.
                                        </p>
                                        <div class="row">
                                            <div class="col-md-3"></div>
                                            <div class="col-md-4">
                                                <button class="btn btn-block btn-info" type="submit">
                                                    <i class="fa fa-save fa-lg"></i> &nbsp;
                                                    <span id="save-button-fleksibel">Tambakan Harga Fleksibel</span>
                                                    <span id="send-button-fleksibel"
                                                        style="display:none;">Sending…</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tabs-grosir-in" role="tabpanel"
                                        aria-labelledby="tabs-grosir">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Rp.</span>
                                                        </div>
                                                        <input type="text" id="harga_jual_grosir" class="form-control">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">>=</span>
                                                        </div>
                                                        <input type="text" id="harga_jual_grosir" class="form-control">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">Satuan</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="button" class="btn btn-sm bg-gradient-danger"><i
                                                        class="fa fa-trash"></i></button>
                                            </div>
                                        </div>
                                        <p>*Klik <b>Tambahkan Harga Fleksibel</b>, Untuk menambahkan data master harga.
                                        </p>
                                        <div class="row">
                                            <div class="col-md-3"></div>
                                            <div class="col-md-4">
                                                <button class="btn btn-block btn-primary" type="submit">
                                                    <i class="fa fa-save fa-lg"></i> &nbsp;
                                                    <span id="save-button-grosir">Tambakan Harga Grosir</span>
                                                    <span id="send-button-grosir" style="display:none;">Sending…</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tabs-memeber-in" role="tabpanel"
                                        aria-labelledby="tabs-member">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Rp.</span>
                                                        </div>
                                                        <input type="text" id="harga_jual_memeber" class="form-control">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">.00</span>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="custom-control custom-checkbox">
                                                            <input class="custom-control-input" type="checkbox"
                                                                id="customCheckbox1" value="option1">
                                                            <label for="customCheckbox1"
                                                                class="custom-control-label">Aktifkan</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="button" class="btn btn-sm bg-gradient-danger"><i
                                                        class="fa fa-trash"></i></button>
                                            </div>
                                        </div>
                                        <p>*Klik <b>Tambahkan Harga Fleksibel</b>, Untuk menambahkan data master harga.
                                        </p>
                                        <div class="row">
                                            <div class="col-md-3"></div>
                                            <div class="col-md-4">
                                                <button class="btn btn-block btn-primary" type="submit">
                                                    <i class="fa fa-save fa-lg"></i> &nbsp;
                                                    <span id="save-button-member">Tambakan Harga Member</span>
                                                    <span id="send-button-member" style="display:none;">Sending…</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.card-body -->
    </div>
    </div><!-- /.container-fluid -->
</section>