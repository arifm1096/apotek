<section class="content-header">
    <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
            <div class="col-sm-6">

                <h4>Laporan Stok</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <button type="button" class="btn btn-danger btn-sm" style="align-items: right;"
                        onclick="add_data();">
                        <i class="fa fa-plus"></i> Add Data
                    </button>
                    <button type="button" class="btn btn-success btn-sm" style="align-items: right;"
                        onclick="add_data();">
                        <i class="fa fa-file-excel"></i> Export
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

            <div class="card-body table-responsive">
                <table id="tbl_presediaan" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px; text-align: right;">No.</th>
                            <th>Nama Produk</th>
                            <th>SKU </th>
                            <th>Stok</th>
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

