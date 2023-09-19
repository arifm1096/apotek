<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4>Data Penjualan</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <!-- <button type="button" class="btn btn-success btn-sm" style="align-items: right; margin-left: 5px;"
                        onclick="export_excel();">
                        <i class="fa fa-file-excel"></i> Export
                    </button> -->
                </ol>

            </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header bg-danger">
                
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
                    <div class="col-md-1">
                        <button type="button" class="btn btn-default btn-md" onclick="clear_filter();"> <i
                                class="fa fa-window-close" aria-hidden="true"></i></button>
                    </div>
                    <div class="col-md-2">
                        <?php if($this->session->userdata('id_hak_akses') =="3"){?>
                        <button type="button" class="btn btn-block btn-info btn-md float-left" onclick="close_bill();">
                            <b style="text-transform: uppercase;"><?php echo $this->session->userdata('nama_shif');?>
                            </b>
                        </button>
                        <?php };?>
                    </div>
                    <!-- <div class="col-md-2">
                        <div class="form-group">
                            <select name="shif" id="shif" class="form-control select2" onchange="filter_data();">
                            </select>
                        </div>
                    </div> -->
                    
                    <div class="col-md-3">
                        <h4 id="total_pejualan" style="font-weight:bold"></h4>
                    </div>
                </div>
            </div>


            <!-- /.card-header -->

            <div class="card-body table-responsive">
                <table id="tbl_penjualan" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>No Nota</th>
                            <th>Nama Produk</th>
                            <th>Jumlah</th>
                            <th>Total Penjualan</th>
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
<div class="modal fade" id="modal_retur">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h6 class="modal-title" id="mediumModalLabel"><i class="fa fa-plus"></i> Retur Penjualan</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <h5>
                            <div class="row">
                                <div class="col-md-4">Nama Produk : </div>
                                <div class="col-md-7"><div style="font-weight:bold" id="nama_produk"></div></div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">Nota: </div>
                                <div class="col-md-7"><div style="font-weight:bold" id="no_nota"></div></div>
                            </div>
                        </h5>
                        <hr>
                        <form id="add_retur">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Kuantitas</label>
                                        <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                                value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                                        <input type="hidden" id="id_produk" name="id_produk">
                                        <input type="hidden" id="id_gudang" name="id_gudang">
                                        <input type="hidden" id="id_stok" name="id_stok">
                                        <input type="hidden" id="id_jual" name="id_jual">
                                        <input type="hidden" id="id_satuan" name="id_satuan">
                                        <input type="hidden" id="jumlah_produk_p" name="jumlah_produk_p">
                                        <input type="text" id="jumlah_produk" name="jumlah_produk" class="form-control"
                                            placeholder="Inputkan Nama Produk" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Satuan</label>
                                        <input type="text" id="nama_satuan" name="nama_satuan" class="form-control"
                                            placeholder="Satuan Utama" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Harga Jual Per Satuan</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Rp.</span>
                                            </div>
                                            <input type="text" name="harga_jual" id="harga_jual" class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <p>*Klik <b>Tambahkan Produk</b>, Sebelum Lanjut Ke Tahap Selanjutnya</p>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-9">
                                    <button class="btn btn-block btn-info" type="submit">
                                        <i class="fa fa-save fa-lg"></i> &nbsp;
                                        <span id="save-button-produk">Simpan Data</span>
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