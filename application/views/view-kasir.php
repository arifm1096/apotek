<section class="content-header">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header bg-danger">
                <div class="row">
                    <div class="col-md-6">
                        <form id="add_produk">
                            <div class="input-group">
                                <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                    value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                                <input type="search" class="form-control" id="produk_barcode" name="produk_barcode"
                                    placeholder="Masukan Pencarian Nama Produk Atau Barcode">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-default">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <button type="button" class="btn btn-default btn-md float-right" onclick="hapus_list();"><i
                                class="fa fa-trash" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <div class="row">
                    <div class="col-md-9">
                        <table id="tbl_kasir" class="table table-striped" style="font-size: 13px;">
                            <thead>
                                <tr>
                                    <th style="width: 10px; text-align: right;">No.</th>
                                    <th>Produk</th>
                                    <th>Kuantitas </th>
                                    <th style="width: 125px; ">Satuan</th>
                                    <th style="width: 195px; ">Opsi Harga</th>
                                    <th style="width: 150px; ">Harga Jual</th>
                                    <th style="width: 150px; ">Total</th>
                                </tr>
                            </thead>
                            <tbody id="list_kasir">

                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-5 col-form-label">Sub Total</label>
                            <div class="col-sm-7">
                                <input type="hidden" name="id_kasir" id="id_kasir">
                                <input type="hidden" name="str_sub_tot" id="str_sub_tot">
                                <input type="text" class="form-control" name="sub_tot" id="sub_tot" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-5 col-form-label">Biaya Service (Rp.)</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control uang" value="0" oninput="total_harga();"
                                    name="service" id="service">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-5 col-form-label">Biaya Embalase (Rp.)</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control uang" value="0" oninput="total_harga();"
                                    name="embalase" id="embalase">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-5 col-form-label">Biaya Lain (Rp.)</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control uang" value="0" oninput="total_harga();"
                                    name="lain" id="lain">
                                <input type="hidden" name="total" id="total">
                            </div>
                        </div>
                        <hr>
                        <div class="form-group row">
                            <h1><b>Total : </b></h1>
                            <h1 id="str_tot"></h1>
                        </div>
                        <div class="form-group row">
                            <button class="btn btn-block btn-success" type="button" onclick="bayar();">
                                <i class="fas fa-shopping-bag"></i> Bayar Pembelian (B)
                            </button>
                            <!-- <button class="btn btn-block btn-info" type="button" onclick="save_data_produk()">
                                <i class="fa fa-print"></i> Cetak Struk (F9)
                            </button> -->
                        </div>
                    </div>
                </div>

            </div>

            <!-- /.card-body -->
        </div>
    </div><!-- /.container-fluid -->
</section>

<!-- modal add start -->
<div class="modal fade" id="modal_bayar_kasir">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h4 class="modal-title" id="mediumModalLabel"><i class="fa fas fa-shopping-bag"></i> &nbsp;Pembayaran
                </h4>
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
                            <div class="col-md-8">
                                <h2><b>
                                        Total Pembayaran :
                                    </b></h2> <br>
                                <h1 id="total_pem" class="text-danger font-weight-bold"></h1>
                            </div>
                        </div>


                        <hr>
                        <form id="stok_produk">


                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Bayar (Rp.)</label>
                                        <input type="text" id="jumlah_uang" name="jumlah_uang"
                                            class="form-control form-control-lg uang" placeholder="Inputkan Pembayaran"
                                            oninput="selisih();" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Kembalian</label>
                                        <input type="hidden" id="kembalian" name="kembalian">
                                        <input type="text" id="str_kembalian" name="str_kembalian"
                                            class="form-control form-control-lg" value="0" placeholder="Kembalian"
                                            readonly>
                                    </div>

                                </div>

                            </div>
                            <p>*Klik <b>Simpan</b>, Setelah Menyelesaikan Pembayaran</p>
                            <div class="row">
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-success" type="button" onclick="add_kasir()">
                                        <i class="fa fa-save fa-lg"></i> &nbsp;
                                        <span id="save-button">Simpan (S)</span>
                                        <span id="send-button" style="display:none;">Sending…</span>
                                    </button>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-info" type="button" onclick="save_stok_produk()">
                                        <i class="fa fa-print"></i> &nbsp;
                                        <span id="save-button-produk">Cetak (P)</span>
                                        <span id="send-button-produk" style="display:none;">Sending…</span>
                                    </button>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-danger" type="button" onclick="close()">
                                        <i class="fa fa-save fa-window-close"></i> &nbsp;
                                        <span id="save-button-produk">Close (C)</span>
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