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
                                <input type="hidden" name="id_produk">
                                <input type="text" id="sku_kode_produk" name="sku_kode_produk" class="form-control"
                                    placeholder="Inputkan Kode Produk / SKU">
                            </div>
                            <div class="form-group">
                                <label>Barcode</label>
                                <input type="text" id="barcode" name="barcode" class="form-control"
                                    placeholder="Inputkan Barcode">
                            </div>
                            <div class="form-group">
                                <label>Nama Produk</label>
                                <input type="text" id="nama_produk" name="nama_produk" class="form-control"
                                    placeholder="Inputkan Nama Produk">
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Jumlah Utama</label>
                                <input type="text" id="jumlah_utama" name="jumlah_utama" class="form-control"
                                    placeholder="Inputkan Jumlah Utama">
                            </div>
                            <div class="form-group">
                                <label>Satuan Utama :</label>
                                <select name="satuan_utama" id="satuan_utama" class="form-control select2">
                                    <option value=""> Pilih asdsad</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Rak :</label>
                                <select name="id_rak" id="id_rak" class="form-control select2">
                                    <option value=""> Pilih asdsad</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>
                    <p>*Klik <b>Tambahkan Produk</b>, Sebelum Lanjut Ke Tahap Selanjutnya</p>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-6">
                            <button class="btn btn-block btn-primary" type="submit">
                                <i class="fa fa-save fa-lg"></i> &nbsp;
                                <span id="save-button">Tambakan Produk</span>
                                <span id="send-button" style="display:none;">Sending…</span>
                            </button>
                        </div>
                    </div>
                </form>
                <hr>
                <!-- Detail Satuan -->
                <div class="row">
                    <div class="col-md-10">
                        <div class="form-group">
                            <p>Detail Satuan Produk :</p>
                            <button class="btn btn-secondary btn-sm"><i class="fa fa-plus"> Add Satuan</i></button>
                        </div>
                        <form id="add_detail_produk">
                            <div class="row">
                                <div class="col-md-3">
                                    <p class="font-weight-bold">Jumlah Produk</p>
                                </div>
                                <div class="col-md-3">
                                    <select name="id_satuan" id="id_satuan" class="form-control select2">
                                        <option value=""> Pilih Satuan</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control">
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="satuan_utama">Satuan</span>
                                        </div>
                                    </div>
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
                                        <input type="text" class="form-control">
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="satuan_utama">Satuan</span>
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
                        <div class="card card-primary card-tabs">
                            <div class="card-header p-0 pt-1">
                                <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill"
                                            href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home"
                                            aria-selected="true">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill"
                                            href="#custom-tabs-one-profile" role="tab"
                                            aria-controls="custom-tabs-one-profile" aria-selected="false">Profile</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="custom-tabs-one-messages-tab" data-toggle="pill"
                                            href="#custom-tabs-one-messages" role="tab"
                                            aria-controls="custom-tabs-one-messages" aria-selected="false">Messages</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content" id="custom-tabs-one-tabContent">
                                    <div class="tab-pane fade active show" id="custom-tabs-one-home" role="tabpanel"
                                        aria-labelledby="custom-tabs-one-home-tab">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">Rp.</span>
                                                        </div>
                                                        <input type="text" class="form-control">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <select name="satuan_harga" id="satuan_harga"
                                                        class="form-control select2">
                                                        <option value=""> Pilih Satuan</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="button" class="btn btn-sm bg-gradient-danger"><i
                                                        class="fa fa-trash"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel"
                                        aria-labelledby="custom-tabs-one-profile-tab">
                                        Mauris tincidunt mi at erat gravida, eget tristique urna bibendum. Mauris
                                        pharetra purus ut ligula tempor, et vulputate metus facilisis. Lorem ipsum dolor
                                        sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus
                                        orci luctus et ultrices posuere cubilia Curae; Maecenas sollicitudin, nisi a
                                        luctus interdum, nisl ligula placerat mi, quis posuere purus ligula eu lectus.
                                        Donec nunc tellus, elementum sit amet ultricies at, posuere nec nunc. Nunc
                                        euismod pellentesque diam.
                                    </div>
                                    <div class="tab-pane fade" id="custom-tabs-one-messages" role="tabpanel"
                                        aria-labelledby="custom-tabs-one-messages-tab">
                                        Morbi turpis dolor, vulputate vitae felis non, tincidunt congue mauris.
                                        Phasellus volutpat augue id mi placerat mollis. Vivamus faucibus eu massa eget
                                        condimentum. Fusce nec hendrerit sem, ac tristique nulla. Integer vestibulum
                                        orci odio. Cras nec augue ipsum. Suspendisse ut velit condimentum, mattis urna
                                        a, malesuada nunc. Curabitur eleifend facilisis velit finibus tristique. Nam
                                        vulputate, eros non luctus efficitur, ipsum odio volutpat massa, sit amet
                                        sollicitudin est libero sed ipsum. Nulla lacinia, ex vitae gravida fermentum,
                                        lectus ipsum gravida arcu, id fermentum metus arcu vel metus. Curabitur eget sem
                                        eu risus tincidunt eleifend ac ornare magna.
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