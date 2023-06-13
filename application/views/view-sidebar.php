<aside class="main-sidebar sidebar-dark-light" style="background:#dc3545!important">
    <!-- style="background:#dc3545" -->
    <!-- Brand Logo -->
    <a href="<?php echo base_url();?>" class="brand-link" style="border-bottom: 1px solid #efefef;">
        <img src="<?php echo base_url();?>assets/images/logo.jpeg" alt="AdminLTE Logo"
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
                        <?php echo $this->session->username." || kasir ". $this->session->level;?> </b></a> <br>
                <!-- <p class="text-muted text-md"><u><?php echo $this->session->level;?></u> </p> -->
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
                            Dashboard
                        </p>
                    </a>
                </li>

                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-toolbox"></i></i>
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
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-cogs"></i></i>
                        <p>
                            Setting
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?php echo base_url('setting/jenis_pinjaman'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Suku Bunga</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo base_url('setting/profil'); ?>" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Identitas Koperasi</p>
                            </a>
                        </li>
                    </ul>
                </li>


                <!-- End -->
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>