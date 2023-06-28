<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>:: APOTEK ::</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet"
        href="<?php echo base_url();?>assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet"
        href="<?php echo base_url();?>assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/summernote/summernote-bs4.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/select2/css/select2.min.css">
    <link rel="stylesheet"
        href="<?php echo base_url();?>assets/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/dropify/css/dropify.min.css">
    <!-- <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/toastr/toastr.min.css"> -->
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700,900|Roboto+Condensed:400,300,700'
        rel='stylesheet' type='text/css'>

    <link rel="stylesheet" type="text/css"
        href="<?php echo base_url()?>assets/plugins/anypicker/src/anypicker-font.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/plugins/anypicker/src/anypicker.css" />
    <link rel="stylesheet" type="text/css"
        href="<?php echo base_url()?>assets/plugins/anypicker/src/anypicker-ios.css" />
    <link rel="stylesheet" type="text/css"
        href="<?php echo base_url()?>assets/plugins/anypicker/src/anypicker-android.css" />
    <link rel="stylesheet" type="text/css"
        href="<?php echo base_url()?>assets/plugins/anypicker/src/anypicker-windows.css" />

    <!-- tambahan sindhu -->

    <!-- crop -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/phppotcrop/jquery.Jcrop.min.css"
        type="text/css" />

    <!-- SweetAlert2 -->
    <link rel="stylesheet"
        href="<?php echo base_url();?>assets/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/datatables-bs4/css/dataTables.bootstrap4.css">

    <!-- Toastr -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/toastr/toastr.min.css">

    <!-- Date Times Picker -->
    <link rel="stylesheet"
        href="<?php echo base_url();?>assets/plugins/bootstrap_date_time/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css"
        href="<?php echo base_url();?>assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

    <style type="text/css">
    .bootstrap-timepicker-widget.dropdown-menu {
        z-index: 1050 !important;
    }

    nav.main-header.navbar.navbar-expand.navbar-white.navbar-light {
        background-color: #d6d6d6;
    }

    i.fas.fa-bars {
        color: #00000096;
    }

    aside.main-sidebar.sidebar-dark-primary.elevation-4 {
        background-color: var(--dark);
    }

    footer.main-footer {
        background-color: #d6d6d6;
        color: #00000096;
    }

    .my_select_picker_trigger.dropup .dropdown-menu {
        bottom: auto !important;
    }

    span.select2-selection.select2-selection--single {
        height: 35px;
    }

    .select2-container--default .select2-selection--single .select2-selection__arrow {
        height: 26px;
        position: absolute;
        top: 4px;
        right: 1px;
        width: 20px;
    }

    .datepicker {
        background-color: #bbdefb;
    }
    </style>

</head>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light" background-color: #dc35457a;>
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a class="nav-link"><i class="fa fa-calendar"></i> : <b
                            style="color:blue;"><?php echo date('d - m - Y') ?> </b>
                        &nbsp;
                        <i class="fa fa-clock"></i> : <b style="color:blue;" class="jam"></b></a>
                </li>
                <!-- <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li> -->
            </ul>
            <ul class="navbar-nav ml-auto">

                <!-- Notifications Dropdown Menu -->
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope"></i>
                        <span class="badge badge-info navbar-badge"> <i class="fa fa-check"></i> </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <span class="dropdown-item dropdown-header bg-info">Notifications</span>
                        <div class="dropdown-divider"></div>
                        <p>Belum Ada Notifkasi</p>
                        <div class="dropdown-divider"></div>
                        <a href="" class="dropdown-item dropdown-footer">Close</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <!-- <i class="fas fa-warning"></i> -->
                        <i class="fa fa-exclamation-triangle "></i>
                        <span class="badge badge-warning navbar-badge"> <i class="fa fa-check"></i> </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <span class="dropdown-item dropdown-header bg-warning">Notifications</span>
                        <div class="dropdown-divider"></div>
                        <p>Belum Ada Notifkasi</p>
                        <div class="dropdown-divider"></div>
                        <a href="" class="dropdown-item dropdown-footer">Close</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="fas fa-globe-americas"></i>
                        <span class="badge badge-success navbar-badge"> ON </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <span class="dropdown-item dropdown-header bg-success">Online Notifications</span>
                        <div class="dropdown-divider"></div>
                        <a href="<?php echo base_url()?>" class="dropdown-item">
                            <i class="fas fa-pen mr-2"></i> Ubah Password
                        </a>
                        <div class="dropdown-divider"></div>
                        <div class="dropdown-divider"></div>
                        <a href="<?php echo base_url('login/proses_logout')?>" class="dropdown-item">
                            <i class="fas fa-sign-out-alt mr-2"></i> Logout
                            <span class="float-right text-muted text-sm">Jam :
                                <i class="fa fa-clock"></i> <b style="color:blue;" class="jam"></b></a>
                        </span>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="" class="dropdown-item dropdown-footer">Close</a>
                    </div>
                </li>
            </ul>

        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <?php $this->load->view('view-sidebar');?>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <?php $this->load->view($content);?>
        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <strong>Copyright &copy; <?php echo date('Y')?> | NAWASENA</strong>
            All rights reserved.
            <div class="float-right d-none d-sm-inline-block">
                <b>Version</b> 1.0
            </div>
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <!-- jQuery -->
    <script src="<?php echo base_url();?>assets/plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="<?php echo base_url();?>assets/plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
    $.widget.bridge('uibutton', $.ui.button);
    </script>
    <script src="<?php echo base_url()?>assets/plugins/jquery-mask/jquery.mask.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<?php echo base_url();?>assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- ChartJS -->
    <script src="<?php echo base_url();?>assets/plugins/chart.js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="<?php echo base_url();?>assets/plugins/sparklines/sparkline.js"></script>
    <!-- JQVMap -->
    <!-- <script src="<?php echo base_url();?>assets/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="<?php echo base_url();?>assets/plugins/jqvmap/maps/jquery.vmap.usa.js"></script> -->
    <!-- jQuery Knob Chart -->
    <script src="<?php echo base_url();?>assets/plugins/jquery-knob/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="<?php echo base_url();?>assets/plugins/moment/moment.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="<?php echo base_url();?>assets/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js">
    </script>
    <!-- Summernote -->
    <script src="<?php echo base_url();?>assets/plugins/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="<?php echo base_url();?>assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<?php echo base_url();?>assets/dist/js/adminlte.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="<?php echo base_url();?>assets/plugins/jsClock/jqClock.min.js"></script>

    <!-- Datepicker -->
    <script src="<?php echo base_url();?>assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js">
    </script>

    <!-- SweetAlert2 -->
    <script src="<?php echo base_url();?>assets/plugins/sweetalert2/sweetalert2.min.js"></script>

    <!-- Select2  -->
    <script src="<?php echo base_url();?>assets/plugins/select2/js/select2.full.min.js"></script>

    <!-- DataTables -->
    <script src="<?php echo base_url();?>assets/plugins/datatables/jquery.dataTables.js"></script>
    <script src="<?php echo base_url();?>assets/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
    <script src="<?php echo base_url();?>assets/plugins/datatables/datetime.js"></script>

    <script src="<?php echo base_url();?>assets/plugins/dropify/js/dropify.js"></script>
    <!-- <script src="<?php echo base_url();?>assets/plugins/toastr/toastr.min.js"></script> -->




    <script type="text/javascript" src="<?php echo base_url()?>assets/plugins/daterangepicker/daterangepicker.js">
    </script>
    <script type="text/javascript"
        src="<?php echo base_url()?>assets/plugins/bootstrap_date_time/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript"
        src="<?php echo base_url()?>assets/plugins/bootstrap_date_time/js/locales/bootstrap-datetimepicker.id.js">
    </script>
    <!-- sweet alert cdn -->
    <script src="<?php echo base_url();?>assets/plugins/sweetalertbaru/js_sweetalert.js"></script>

    <!-- Toastr -->
    <script src="<?php echo base_url();?>assets/plugins/toastr/toastr.min.js"></script>




    <script type="text/javascript">
    $(document).ready(function() {
        $(".jam").clock({
            "format": "24",
            "calendar": "false"
        });
    });
    var URL = "<?php echo base_url(); ?>";
    var csfrData = {};
    csfrData['<?php echo $this->security->get_csrf_token_name(); ?>'] = '<?php echo
  $this->security->get_csrf_hash(); ?>';
    $.ajaxSetup({
        data: csfrData
    });
    </script>


    <!-- AdminLTE for demo purposes -->
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/script/<?php echo $js; ?>.js"></script>

</body>

</html>