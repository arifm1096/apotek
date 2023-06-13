<section class="content-header">
      <div class="container-fluid">
        <!-- head -->
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile Koperasi</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Setting</a></li>
              <li class="breadcrumb-item active">Profile Koperasi</li>
            </ol>
          </div>
        </div>
        <!-- head end -->
        <div class="card">
            <div class="card-header">
             
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <form id="add_anggota">
              <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>" value="<?=$this->security->get_csrf_hash();?>" style="display: none">
                <div class="form-group row">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">Nama Koperasi*</label>
                  <div class="col-sm-3">
                    <input type="hidden" name="id_koperasi" value="<?php echo $ls_profil->id_koperasi;?>">
                    <input type="text" class="form-control" id="nama_koperasi" name="nama_koperasi" value="<?php echo $ls_profil->nama_koperasi;?>" placeholder="Nama Koperasi" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">No HP*</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="no_hp" name="no_hp" value="<?php echo $ls_profil->no_hp;?>" placeholder="No HP" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">Telephone*</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control " id="telephone" name="telephone" value="<?php echo $ls_profil->telephone;?>" placeholder="Telephone" autocomplete="off" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">Email*</label>
                  <div class="col-sm-3">
                    <input type="email" class="form-control " id="email" name="email" value="<?php echo $ls_profil->email;?>" placeholder="Email" autocomplete="off" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">Website*</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" id="website" name="website" value="<?php echo $ls_profil->website;?>" placeholder="Website" autocomplete="off" required>
                  </div>
                </div>
               
                <div class="form-group row">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">Alamat*</label>
                  <div class="col-sm-8">
                    <textarea class="form-control" name="alamat" id="alamat" cols="30" rows="3" required><?php echo $ls_profil->alamat;?></textarea>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">Kota*</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" id="kota_kab" name="kota_kab" value="<?php echo $ls_profil->kota_kab;?>" placeholder="Kota" required>
                  </div>
                </div>
								<div class="form-group row">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">Logo</label>
                  <div class="col-sm-3">
                    <input type="file" class="form-control dropify" id="logo" name="logo" 
                    data-default-file="<?php echo base_url();?>assets/images/<?php if($ls_profil->logo == ""){ echo 'images.jpg';}else{echo 'logo/'.$ls_profil->logo; }  ?>" >
                  </div>
                </div>
								<hr>
                <div class="row">
									<div class="col-sm-2"></div>
                  <div class="col-sm-4">
										<button type="submit" id="save_button" class="btn btn-success btn-block"><i class="fa fa-save"></i> Update</button>
                  </div>
									<div class="col-sm-4">
										<button type="button" onclick="batal();" class="btn btn-danger btn-block"><i class="fa fa-window-close"></i> Batal</button>
                  </div>
                </div>
              </form>
            </div>
            <!-- /.card-body -->
          </div>
      </div><!-- /.container-fluid -->
    </section>



     