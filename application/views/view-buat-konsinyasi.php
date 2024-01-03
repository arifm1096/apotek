<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4><?php echo $nama_menu;?></h4>
            </div>
        </div>
        <div class="card card-danger card-outline">
            <div class="card-header">
                <form id="kons_submit">
                    <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                        value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                    <input type="hidden" name="id_konsinyasi" id="id_konsinyasi" value="<?php echo $id_konsinyasi; ?>">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>No. Fakture</label>
                                <input type="text" id="no_faktur" name="no_faktur" class="form-control"
                                    placeholder="Kosongkan Untuk Otomatis">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>No. Surat Pesanan</label>
                                <input type="text" id="no_sp" name="no_sp" class="form-control"
                                    placeholder="Masukan Nomer Surat" required>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Supplier</label>
                                <select class="form-control select2" name="id_supplier" id="id_supplier" required>
                                    <option value="pil"> -- Pilih --</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Tgl. Faktur</label>
                                <input type="text" id="tgl_faktur" name="tgl_faktur" class="form-control tgl_piker"
                                    placeholder="Tanggal Pesan" required>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Tgl. Terima</label>
                                <input type="text" id="tgl_terima" name="tgl_terima" class="form-control tgl_piker"
                                    placeholder="Tanggal Pesan" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Gudang Penerima</label>
                                <select class="form-control select2" name="id_gudang" id="id_gudang" required>
                                    <option value="pil"> -- Pilih --</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Jenis Kas</label>
                                <select class="form-control select2" name="id_kas" id="id_kas" required>
                                    <option value="pil"> -- Pilih --</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Jenis Pembayaran</label>
                                <select class="form-control select2" name="jenis_pembayaran" id="jenis_pembayaran"
                                    required>
                                    <option value="pil"> -- Pilih --</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Jatuh Tempo</label>
                                <input type="text" id="jatuh_tempo" name="jatuh_tempo" class="form-control tgl_piker"
                                    placeholder="Tanggal Jatuh Tempo" required>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>*</label>
                                <div class="d-flex align-items-end">
                                    <button type="submit" class="btn bg-info ">
                                        <i class="fa fa-plus"></i> Simpan
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-sm btn-success float-left " data-toggle="modal"
                            data-target="#modal_add_produk_kons">
                            <i class="fa fa-plus"></i> Tambah Produk
                        </button>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <div class="row">
                    <div class="col-md-12">
                        <table id="tbl_produk_re" class="table table-striped" style="font-size: 14px;">
                            <thead>
                                <tr>
                                    <th style="width: 10px; text-align: right;">No.</th>
                                    <th>Produk</th>
                                    <th>KSU KODE</th>
                                    <th>Tgl. Exp</th>
                                    <th>Kuantitias</th>
                                    <th>Satuan</th>
                                    <th>Harga Beli</th>
                                    <th>PPN 11%</th>
                                    <th>Harga Pokok</th>
                                    <th style="width: 80px; text-align: right;">Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>

            <!-- /.card-body -->
        </div>
    </div><!-- /.container-fluid -->
</section>

<!-- modal add produk kons start -->
<div class="modal fade" id="modal_add_produk_kons">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h4 class="modal-title" id="mediumModalLabel"><i class="fa fas fa-shopping-bag"></i> &nbsp;Tambah Produk
                    Konsiyasi
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <form id="kons_add">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                            <input type="hidden" name="id_konsinyasi_detail" id="id_konsinyasi_detail">
                            <input type="hidden" name="id_konsinyasi_p" id="id_konsinyasi_p"
                                value="<?php echo $id_konsinyasi; ?>">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Nama Produk</label>
                                        <select class="form-control select2" name="id_produk" id="id_produk"
                                            onchange="get_ksu_pro();">
                                            <option value="pil"> --Pilih Produk--</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>KSU kode</label>
                                        <input type="text" id="kode_ksu" name="kode_ksu" class="form-control"
                                            placeholder="Inputkan KSU kode" readonly>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Tgl. Exp.</label>
                                        <input type="text" id="tgl_exp" name="tgl_exp" class="form-control tgl_piker"
                                            placeholder="Inputkan Tgl. Exp." required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Satuan</label>
                                        <select class="form-control select2" name="id_satuan" id="id_satuan">
                                            <option value="pil"> --Pilih Produk--</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Qty.</label>
                                        <input type="text" id="jumlah_konsinyasi" name="jumlah_konsinyasi"
                                            class="form-control" placeholder="Inputkan Kuantitias" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Harga</label>
                                        <input type="text" id="harga_beli" name="harga_beli" class="form-control"
                                            oninput="get_ppn();" placeholder="Inputkan Harga" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>PPN 11 %</label>
                                        <input type="text" id="ppn" name="ppn" class="form-control"
                                            placeholder="Inputkan PPN Harga" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Harga Pokok</label>
                                        <input type="text" id="harga_pokok" name="harga_pokok" class="form-control"
                                            placeholder="Inputkan Harga Pokok" required>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-success" type="submit">
                                        <i class="fa fa-save fa-lg"></i> &nbsp;
                                        <span id="save-button-tolak">Simpan</span>
                                        <span id="send-button-tolak" style="display:none;">Sending…</span>
                                    </button>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-danger" type="button" onclick="close_kon()">
                                        <i class="fa fa-save fa-window-close"></i> &nbsp;
                                        <span id="batal-tolak">Batal</span>
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
<!-- modal add produk kons end -->