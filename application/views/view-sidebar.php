<aside class="main-sidebar sidebar-dark-light" style="background:#dc3545!important">
    <!-- style="background:#dc3545" -->
    <!-- Brand Logo -->
    <a href="<?php echo base_url();?>" class="brand-link" style="border-bottom: 1px solid #efefef;">
        <img src="<?php echo base_url();?>assets/images/logo/logo.png" alt="apotek logo"
            class="brand-image img-circle elevation-5" style="opacity: .8">
        <span class="brand-text font-weight-light">
            Nawasena
        </span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 mb-3 d-flex" style="border-bottom: 1px solid #efefef;">
            <div class="image">
                <img src="<?php echo base_url();?>assets/dist/img/user.jpg" class="img-circle elevation-2"
                    alt="User Image">
            </div>

            <div class="info">
                <a href="<?php echo base_url(); ?>" class="d-block"><b style="text-transform: uppercase;">
                        <?php echo $this->session->nama_user." || ". $this->session->hak_akses;?> </b></a> <br>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu"
                data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                <li class="nav-item has-treeview">
                    <a href="<?php echo base_url(); ?>" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard Umum
                        </p>
                    </a>
                </li>
                <?php if ($this->session->userdata('hak_akses')=="ADMIN"){ ?>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-toolbox"></i></i>
                        <p>
                            Dashboard Pembelian
                        </p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-toolbox"></i></i>
                        <p>
                            Dashboard Penjualan
                        </p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-toolbox"></i></i>
                        <p>
                            Dashboard Stok
                        </p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-toolbox"></i></i>
                        <p>
                            Master
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Produk</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('master/data_pelanggan'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Pelanggan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('master/data_satuan'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Satuan Barang</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('master/data_supplier'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Supplier</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Gudang</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Rak / Penyimpanan</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-archive "></i></i>
                        <p>
                            Persediaan
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('persediaan/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Daftar produk</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('persediaan/defecta'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Defecta</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('persediaan/stok_kadaluarsa'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Stok Kadaluarsa/ED</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('persediaan/stok_opname'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Stok Opname</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Riwayat Stok Opname</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <?php } ?>
                <?php if($this->session->userdata('hak_akses') == "KASIR" ){?>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-shopping-cart"></i></i>
                        <p>Penjualan
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>

                    <ul class="nav nav-treeview">

                        <li class="nav-item">
                            <a href="<?php echo base_url('penjualan/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Kasir</p>
                            </a>
                        </li>

                    </ul>
                </li>
                <?php } ?>
                <?php  if($this->session->userdata('hak_akses') == "ADMIN" ){ ?>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-shopping-cart"></i></i>
                        <p>Penjualan
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>

                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('penjualan/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Kasir</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Daftar Penjulan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Penjualan Tertolak</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-credit-card"></i></i>
                        <p>Pembelian
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/tambah_data'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Rencana Pembelian</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Membuat Pesanan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Retur Pembelian</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-paper-plane"></i></i>
                        <p>
                            Konsiyasi
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/tambah_data'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Konsi Masuk</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('produk/'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Status Konsinyasi</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-toolbox"></i></i>
                        <p>
                            Data Master
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>

                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('master/data_pelanggan'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Satuan Barang</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('master/data_supplier'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Supplier</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('master/data_pelanggan'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Pelanggan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('user/dataUser'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> User</p>
                            </a>
                        </li>
                    </ul>
                </li> -->
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-user"></i></i>
                        <p>
                            Data User
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('user/dataUser'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> User</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('user/data_hak_akses'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Hak Akses</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('user/data_wilayah'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Wilayah</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <?php } ?>
                <!-- End -->
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>