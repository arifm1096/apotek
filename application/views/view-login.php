<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>KOPKARMIK</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <!-- SweetAlert2 -->
    <link rel="stylesheet"
        href="<?php echo base_url();?>assets/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

</head>

<body class="hold-transition login-page"
    style="background-image: url('<?php echo base_url();?>assets/images/bg-login.jpg');">
    <div class="login-box">

        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <div class="login-logo">
                    <a href="<?php echo base_url();?>"><b>APOTEK</b> NAWASENA</a>
                </div>
                <p class="login-box-msg">Login Page</p>

                <form id="contentLogin">
                    <div class="input-group mb-3">
                        <select class="form-control select2" name="panel" id="panel">
                            <option selected disabled> -- Pilih Hak Akses -- </option>
                            <?php if(!empty($ls_hak_akses)){?>
                            <?php foreach ($ls_hak_akses as $key => $value) {?>
                            <option value="<?php echo $value->id_hak_akses ?>"> <?php echo $value->nama; ?>
                            </option>
                            <?php }}?>
                        </select>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-home"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>"
                            value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                        <input type="text" class="form-control" placeholder="Username" name="username"
                            placeholder="Username" col="c_username">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-users"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="Password" name="password" id="password"
                            placeholder="Password" col="c_password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="icheck-primary d-inline">
                            <input type="checkbox" id="ck_login" onclick="viewpass()">
                            <label for="ck_login">
                                Show password
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->


    <!-- jQuery -->
    <script src="<?php echo base_url();?>assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<?php echo base_url();?>assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<?php echo base_url();?>assets/dist/js/adminlte.min.js"></script>

    <!-- sweet alert cdn -->
    <script src="<?php echo base_url();?>assets/plugins/sweetalert2/sweetalert2.min.js"></script>

    <script type="text/javascript">
    var URL = "<?php echo base_url(); ?>";
    </script>

    <script type="text/javascript" src="<?php echo base_url(); ?>assets/script/js-Login.js"></script>

</body>

</html>