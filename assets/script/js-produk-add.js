$(document).ready(function () {
	$("#param_row").val(1);
	load_select();
	loop_satuan();
	$("#loading").hide();
});

//Initialize Select2 Elements
$(".select2").select2();

function load_select(p_jenis_produk, p_rak, p_satuan) {
	var html_jn_pro = "<option value='pil'>-- Pilih Jenis Porduk --</option>";
	var html_rak = "<option value='pil'>-- Pilih Rak --</option>";
	var html_satuan = "<option value='pil'>-- Pilih Satuan --</option>";
	$.ajax({
		url: URL + "produk/get_data_master",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				res.jenis_produk.forEach((e) => {
					html_jn_pro +=
						'<option value="' +
						e.id_jenis_produk +
						'"' +
						(e.id_jenis_produk === p_jenis_produk
							? 'selected="selected"'
							: "") +
						">" +
						e.nama_jenis_produk +
						"</option>";
				});

				res.rak.forEach((e) => {
					html_rak +=
						'<option value="' +
						e.id_rak +
						'"' +
						(e.id_rak === p_rak ? 'selected="selected"' : "") +
						">" +
						e.nama_rak +
						"</option>";
				});

				res.satuan.forEach((e) => {
					html_satuan +=
						'<option value="' +
						e.id_satuan +
						'"' +
						(e.id_satuan === p_satuan ? 'selected="selected"' : "") +
						">" +
						e.nama_satuan +
						"</option>";
				});
			}
			$("#id_jenis_produk").html(html_jn_pro);
			$("#satuan_utama").html(html_satuan);
			$("#id_rak").html(html_rak);
		},
	});
}

$("#add_produk").submit(function (e) {
	e.preventDefault();
	$("#save-button-produk").html("Sending...");
	$.ajax({
		url: URL + "produk/save_produk_name",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_produk").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.msg,
				});
			} else {
				Swal.fire({
					icon: "error",
					title: "Error",
					text: res.msg,
				});
			}
		},
	});
});

function load_satuan(p_id_satuan) {
	var html = "<option value='pil'>-- Pilih Satuan --</option>";
	$.ajax({
		url: URL + "produk/get_master_satuan",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				res.satuan.forEach((e) => {
					html +=
						'<option value="' +
						e.id_satuan +
						'"' +
						(e.id_satuan === p_id_satuan ? 'selected="selected"' : "") +
						">" +
						e.nama_satuan +
						"</option>";
				});
			}
			$(".p_satuan").html(html);
		},
	});
}

function loop_satuan(
	p_jumlah_produk1 = "",
	p_satuan = "",
	p_jumlah_produk2 = ""
) {
	var row = $("#param_row").val();
	load_satuan(p_satuan);
	var el_satuan =
		` <div class="row" id="row_` +
		row +
		`">
								
                                <div class="col-md-3"><input type="text" name="jumlah_produk" value="` +
		p_jumlah_produk1 +
		`" class="form-control"
                                        placeholder="Inputkan Jumlah Produk">
                                </div>
                                <div class="col-md-3">
                                    <select name="id_satuan" class="form-control select2 p_satuan">
                                        <option value=""> Pilih Satuan</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <input type="text" name="jumlah_produk" value="` +
		p_jumlah_produk2 +
		`" class="form-control"
                                            placeholder="Inputkan Produk Persatuan">
                                        <div class="input-group-append">
                                            <span class="input-group-text">Satuan</span>
                                            <button type="button" class="btn btn-sm bg-gradient-danger" onclick="remove_satuan(` +
		row +
		`);"><i
                                                    class="fa fa-trash"></i></button>
                                        </div>
                                    </div>

                                </div>
                            </div>`;

	$("#satuan-html").append(el_satuan);
	row++;
	$("#param_row").val(row);
}

function remove_satuan(row) {
	$("#row_" + row + "").remove();
}

function save_satuan() {
	var jumlah_produk = [];
	var satuan = [];
	var jumlah_produk_p = [];

	$("input[name=jumlah_produk]").each(function () {
		jumlah_produk.push($(this).text());
	});

	$("select[name=jumlah_produk]").each(function () {
		satuan.push($(this).text());
	});

	$("input[name=jumlah_produk]").each(function () {
		jumlah_produk_p.push($(this).text());
	});

	$.ajax({
		url: URL + "produk/save_produk_name",
		type: "POST",
		data: {
			jumlah_produk: jumlah_produk,
			id_satuan: satuan,
			jumlah_produk_p: jumlah_produk_p,
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
			} else {
			}
		},
	});
}

function edit(
	p_id_pelanggan,
	p_kode_pelanggan,
	p_nama_pelanggan,
	p_alamat,
	p_no_hp,
	p_aktif
) {
	status_aktif(p_aktif);
	$("#mediumModalLabel").html("Edit Supplier");
	$("#id_pelanggan").val(p_id_pelanggan);
	$("#kode_pelanggan").val(p_kode_pelanggan);
	$("#alamat").val(p_alamat);
	$("#no_hp").val(p_no_hp);
	$("#nama_pelanggan").val(p_nama_pelanggan);
	$("#modal_input_pelanggan").modal("show");
}

function hapus(id, supplier, ket) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Menghapus Data ?</b> <br> Hak Akses  : " +
			supplier +
			"<br> " +
			"Keterangan: " +
			ket,
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Hapus Data",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				url: URL + "master/hapus_pelanggan",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_pelanggan").DataTable().clear().destroy();
						load_pelanggan();
					} else {
						Swal.fire({
							icon: "error",
							title: "Perhatian...",
							text: "Data Gagal Dihapus",
						});
					}
				},
			});
		}
	});
}

$("#modal_input_pelanggan").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_pelanggan").val("");
	$("#kode_pelanggan").val("");
	$("#alamat").val("");
	$("#nama_pelanggan").val("");
	status_aktif((id_status = "pil"));
});
