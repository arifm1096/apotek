<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Master Produk</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <button type="button" class="btn btn-danger btn-sm" style="align-items: right;"
                        onclick="add_data();">
                        <i class="fa fa-plus"></i> Add Data
                    </button>
                </ol>
            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header bg-danger">
                <div class="row">
                    <div class="col-md-5">
                        <label>All Colom :</label>

                    </div>
                    <div class="col-md-3">
                        <label>Filter Jual:</label>

                    </div>
                    <div class="col-md-3">
                        <label>Filter rak:</label>

                    </div>

                </div>
                <div class="row">
                    <div class="col-md-5">

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
                    <div class="col-md-3">

                        <select name="filter_status_jual" id="filter_status_jual" class="form-control select2"
                            onchange="filter_data();">
                            <option value="pil"> Pilih Filter Jual</option>
                        </select>
                    </div>
                    <div class="col-md-3">

                        <select name="filter_rak" id="filter_rak" class="form-control select2"
                            onchange="filter_data();">
                            <option value="pil"> Pilih Filter Rak</option>
                        </select>
                    </div>
                    <div class="col-md-1">

                        <button type="button" class="btn btn-default btn-md" onclick="clear_filter();"> <i
                                class="fa fa-window-close" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->
            <div class="card-body">
                <table id="tbl_produk" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Nama Produk</th>
                            <th>Kode Produk</th>
                            <th>Barcode</th>
                            <th>Nama Pabrik</th>
                            <th>Rak</th>
                            <th>Stok Minimal</th>
                            <th>Status</th>
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
<div class="modal fade" id="modal_input_produk">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h6 class="modal-title" id="mediumModalLabel"><i class="fa fa-plus"></i> Add Data</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <h5>Data Produk</h5>
                        <hr>
                        <form id="add_produk">
                            <div class="row p-2">
                                <div class="col-md-12">
                                    <div class="btn-group btn-group-toggle btn-block" data-toggle="buttons">
                                        <label class="btn btn-danger active">
                                            <input type="radio" name="jnp_options" id="obat" value="obat"
                                                autocomplete="off" checked>
                                            Obat
                                        </label>
                                        <label class="btn btn-danger">
                                            <input type="radio" name="jnp_options" id="alkes" value="alkes"
                                                autocomplete="off"> Alat
                                            Kesehatan
                                        </label>
                                        <label class="btn btn-danger">
                                            <input type="radio" name="jnp_options" id="umum" value="umum"
                                                autocomplete="off"> Umum
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <hr>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Nama Produk</label>
                                        <input type="hidden" id="jenis_produk">
                                        <input type="text" id="nama_produk" name="nama_produk" class="form-control"
                                            placeholder="Inputkan Nama Produk" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Nama Pabrik</label>
                                        <input type="text" id="produk_by" name="produk_by" class="form-control"
                                            placeholder="Inputkan Nama Produk" required>
                                    </div>
                                    <div class="form-group row">
                                        <label>Kode Produk / SKU</label>
                                        <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                            value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                                        <input type="hidden" name="id_produk">
                                        <div class="col-md-11">
                                            <input type="text" id="sku_kode_produk" name="sku_kode_produk"
                                                class="form-control" placeholder="Inputkan Kode Produk / SKU" required>
                                        </div>
                                        <div class="col-md-1">
                                            <button type="button" class="btn btn-sm btn-danger" onclick="get_ksu();"> <i
                                                    class="fa fa-download"></i></button>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Barcode</label>
                                        <input type="text" id="barcode" name="barcode" class="form-control"
                                            placeholder="Inputkan Barcode">
                                    </div>


                                    <div class="form-group row">

                                        <label>Satuan Utama :</label>
                                        <div class="col-md-11">
                                            <select name="satuan_utama" id="satuan_utama" class="form-control select2"
                                                onchange="get_satuan_utama()" required>
                                            </select>
                                            <h6>Pilih <b>Satuan Utama</b> terlebih dahulu sebelum menambahkan satuan
                                                lainnya.</h6>
                                            <input type="hidden" id="p_satuan_utama">
                                            <input type="hidden" id="p_sat_row">
                                            <input type="hidden" id="sat_param_row">
                                            <input type="hidden" id="param_row">
                                        </div>
                                        <div class="col-md-1">
                                            <button type="button" class="btn btn-sm btn-danger"
                                                onclick="loop_satuan();"> <i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div id="satuan-html"></div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button class="btn btn-block btn-danger" type="button"
                                                    onclick="loop_satuan();">
                                                    Tambah Satuan Lain
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="text-danger"><b>#Informasi Harga Produk</b></p>
                                    <div class="form-group">
                                        <label>Harga Beli :</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Rp.</span>
                                            </div>
                                            <input type="text" name="harga_beli" id="harga_beli" class="form-control">
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="satuan_harga_beli">/Satuan</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Harga Jual Satuan :</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Rp.</span>
                                            </div>
                                            <input type="text" name="harga_jual" id="harga_jual" class="form-control">
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="satuan_harga_jual">/Satuan</span>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="text-danger"><b>#Informasi Harga Alternatif</b></p>
                                    <div class="form-group">
                                        <div class="row p-2">
                                            <div class="col-md-12">
                                                <div class="btn-group btn-group-toggle btn-block" data-toggle="buttons">
                                                    <label class="btn btn-danger active">
                                                        <input type="radio" name="harga_option" id="fleksibel" value="1"
                                                            autocomplete="off" checked>
                                                        Fleksibel
                                                        <a data-toggle="pill" href="#custom-tabs-one-home" role="tab"
                                                            aria-controls="custom-tabs-one-home"
                                                            aria-selected="true"></a>
                                                    </label>
                                                    <label class="btn btn-danger">
                                                        <input type="radio" name="harga_option" id="grosir" value="2"
                                                            autocomplete="off"> Grosir
                                                    </label>
                                                    <label class="btn btn-danger">
                                                        <input type="radio" name="harga_option" id="member" value="3"
                                                            autocomplete="off"> Membership
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="from-group">
                                        <input type="hidden" id="harga_option_param">
                                        <input type="hidden" id="p_fleksibel">
                                        <input type="hidden" id="p_grosir">
                                        <input type="hidden" id="p_member">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div id="fleksibel_list"></div>
                                                <div id="grosir_list"></div>
                                                <div id="member_list"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button class="btn btn-block btn-danger" type="button"
                                                onclick="loop_harga_al();">
                                                Tambah Harga Alternatif
                                            </button>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Rak :</label>
                                        <select name="id_rak" id="id_rak" class="form-control select2" required>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Jumlah Minimal</label>
                                        <input type="number" id="jumlah_minimal" name="jumlah_minimal"
                                            class="form-control" placeholder="Inputkan Jumlah Utama" required>
                                    </div>
                                    <div class="form-group">
                                        <div class="row p-2">
                                            <div class="col-md-12">
                                                <div class="btn-group btn-group-toggle btn-block" data-toggle="buttons">
                                                    <label class="btn btn-danger active">
                                                        <input type="radio" name="harga_option" id="fleksibel" value="y"
                                                            autocomplete="off" checked>
                                                        Dijual
                                                        <a data-toggle="pill" href="#custom-tabs-one-home" role="tab"
                                                            aria-controls="custom-tabs-one-home"
                                                            aria-selected="true"></a>
                                                    </label>
                                                    <label class="btn btn-danger">
                                                        <input type="radio" name="harga_option" id="grosir" value="n"
                                                            autocomplete="off"> Tidak Dijual
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <p>*Klik <b>Tambahkan Produk</b>, Sebelum Lanjut Ke Tahap Selanjutnya</p>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-9">
                                    <button class="btn btn-block btn-info" type="button" onclick="save_data_produk()">
                                        <i class="fa fa-save fa-lg"></i> &nbsp;
                                        <span id="save-button-produk">Simpan Produk</span>
                                        <span id="send-button-produk" style="display:none;">Sending…</span>
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
<!-- modal add end -->