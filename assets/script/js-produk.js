$(document).ready(function () {
	status_aktif();
	load_produk((text = ""), (jual = "pil"), (rak = "pil"));
	load_select();
	load_select_filter();
	$("#loading").hide();
	$("#param_row").val(1);
	$("#jenis_produk").val("obat");
	$("#p_fleksibel").val(1);
	$("#p_grosir").val(1);
	$("#p_member").val(1);
	$("#harga_option_param").val(1);
});

//Initialize Select2 Elements
$(".select2").select2();

function status_aktif(p_status) {
	var html = "<option value='pil'> Pilih Status </option>";
	var data = [
		{
			id: "y",
			title: "Aktif",
		},
		{
			id: "n",
			title: "Tidak Aktif",
		},
	];
	data.forEach((e) => {
		html +=
			'<option value="' +
			e.id +
			'"' +
			(e.id === p_status ? 'selected="selected"' : "") +
			">" +
			e.title +
			"</option>";
	});
	$("#select_aktif").html(html);
}

function load_select_filter(p_rak, p_status) {
	var html_rak = "<option value='pil'>-- Pilih Rak --</option>";
	var html_status_jual = "<option value='pil'>-- Pilih Filter Jual --</option>";
	$.ajax({
		url: URL + "produk/get_data_master_filter",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
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

				res.jual.forEach((e) => {
					html_status_jual +=
						'<option value="' +
						e.id_jual +
						'"' +
						(e.id_jual === p_status ? 'selected="selected"' : "") +
						">" +
						e.nama_jual +
						"</option>";
				});
			}
			$("#filter_status_jual").html(html_status_jual);
			$("#filter_rak").html(html_rak);
		},
	});
}

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
			$("#edit_satuan_utama").html(html_satuan);
			$("#edit_id_rak").html(html_rak);
		},
	});
}

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
	var sat = $("#sat_param_row").val();
	// $("#sat_param").html(sat);
	load_satuan(p_satuan);
	var el_satuan =
		` <div class="row" id="row_` +
		row +
		`">
									
									<div class="col-md-3"><input type="number" name="jumlah_produk1" value="` +
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
											<input type="number" name="jumlah_produk2" value="` +
		p_jumlah_produk2 +
		`" class="form-control"
												placeholder="Inputkan Produk Persatuan">
											<div class="input-group-append">
												<span class="input-group-text" id="sat_param">` +
		sat +
		`
			</span>
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

function load_produk(text, jual, rak) {
	$("#tbl_produk").DataTable({
		ajax: {
			url: URL + "produk/load_produk",
			type: "POST",
			data: { text: text, status_jual: jual, id_rak: rak },
		},
		order: [[0, "desc"]],
		processing: true,
		serverSide: true,
		searching: false,
		serverMethod: "POST",
		columns: [
			{
				data: "id_supplier",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},
			{ data: "nama_produk" },
			{ data: "sku_kode_produk" },
			{ data: "barcode" },
			{ data: "produk_by" },
			{ data: "nama_rak" },
			{ data: "jumlah_minimal" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					if (row.status_jual == 1) {
						return '<span class="right badge badge-success"> Dijual</span>';
					} else {
						return '<span class="right badge badge-danger">Tidak Dijual</span>';
					}
				},
			},
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_produk +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_produk +
						"','" +
						row.nama_produk +
						"','" +
						row.sku_kode_produk +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

function filter_data() {
	var text = $("#filter_text").val();
	var jual = $("#filter_status_jual").val();
	var rak = $("#filter_rak").val();
	$("#tbl_produk").DataTable().destroy();
	load_produk(text, jual, rak);
}

function clear_filter() {
	$("#tbl_produk").DataTable().destroy();
	load_produk((text = ""), (jual = "pil"), (rak = "pil"));
	$("#filter_text").val("");
	load_select_filter("pil", "pil");
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
				url: URL + "produk/hapus_produk",
				type: "POST",
				data: {
					id_produk: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_produk").DataTable().destroy();
						load_produk(text, jual, rak);
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

function get_ksu() {
	var p_jenis_produk = $("#jenis_produk").val();
	var p_nama_produk = $("#nama_produk").val();

	var e_jenis_produk = $("#edit_jenis_produk").val();
	var e_nama_produk = $("#edit_nama_produk").val();

	if (p_jenis_produk !== "" && p_nama_produk !== "") {
		var jenis_produk = p_jenis_produk;
		var nama_produk = p_nama_produk;
	} else {
		var jenis_produk = e_jenis_produk;
		var nama_produk = e_nama_produk;
	}

	$.ajax({
		type: "POST",
		url: URL + "produk/get_kode_ksu",
		data: { jenis_produk: jenis_produk, nama_produk: nama_produk },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				$("#sku_kode_produk").val(res.result);
				$("#edit_sku_kode_produk").val(res.result);
			} else {
				$("#sku_kode_produk").val(res.result);
				$("#edit_sku_kode_produk").val(res.result);
				Swal.fire({
					icon: "error",
					title: "Warning",
					text: res.msg,
				});
			}
		},
	});
}

function get_satuan_utama() {
	var id = $("#satuan_utama").val();
	$.ajax({
		type: "POST",
		url: URL + "produk/get_satuan",
		data: { id_satuan: id },
		success: function (data) {
			var res = JSON.parse(data);
			$("#satuan_harga_beli").html(res.res);
			$("#satuan_harga_jual").html(res.res);
			$("#sat_param_row").val(res.res);
		},
	});
}

$("input[type=radio][name=jnp_options]").change(function () {
	var val = this.value;
	var value = "";
	if (val == "obat") {
		value += 2;
	}

	if (val == "alkes") {
		value += 1;
	}

	if (val == "umum") {
		value += 3;
	}

	$("#jenis_produk").val(value);
	$("#edit_jenis_produk").val(value);
});

$("input[type=radio][name=harga_option]").change(function () {
	var val = this.value;
	$("#harga_option_param").val(val);

	if (val == 1) {
		$("#fleksibel_list").show();
		$("#grosir_list").hide();
		$("#member_list").hide();
	}

	if (val == 2) {
		$("#fleksibel_list").hide();
		$("#grosir_list").show();
		$("#member_list").hide();
	}
	if (val == 3) {
		$("#fleksibel_list").hide();
		$("#grosir_list").hide();
		$("#member_list").show();
	}
});

function loop_harga_al() {
	var param = $("#harga_option_param").val();
	if (param == 1) {
		loop_fleksibel();
	}
	if (param == 2) {
		loop_grosir();
	}
	if (param == 3) {
		loop_member();
	}
}

function loop_fleksibel() {
	var html = "";
	var row = $("#p_fleksibel").val();
	html +=
		`<div class="row" id="row_flek_` +
		row +
		`">
					<div class="col-md-5">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Rp.</span>
								</div>
								<input type="text" name="harga_jual_fleksibel" id="harga_jual_fleksibel"
									class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<input type="text" id="ket" name="ket" class="form-control"
								placeholder="Inputkan Keterangan">
						</div>
					</div>
					<div class="col-md-2">
						<button type="button" class="btn btn-sm bg-gradient-danger" onclick="rm_flek(` +
		row +
		`);"><i
								class="fa fa-trash"></i></button>
					</div>
				</div>`;

	$("#fleksibel_list").append(html);
	row++;
	$("#p_fleksibel").val(row);
}

function rm_flek(row) {
	$("#row_flek_" + row + "").remove();
}

function loop_grosir() {
	var html = "";
	var row = $("#p_grosir").val();
	html +=
		`<div class="row" id="row_gro_` +
		row +
		`">
					<div class="col-md-5">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Rp.</span>
								</div>
								<input type="text" name ="harga_jual_grosir" id="harga_jual_grosir" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">>=</span>
								</div>
								<input type="text" id="satuan_jumlah" name="satuan_jumlah" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">Satuan</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-sm bg-gradient-danger" onclick="rm_gro(` +
		row +
		`)"><i
								class="fa fa-trash"></i></button>
					</div>
				</div>`;
	$("#grosir_list").append(html);
	row++;
	$("#p_grosir").val(row);
}

function rm_gro(row) {
	$("#row_gro_" + row + "").remove();
}

function loop_member() {
	var html = "";
	var row = $("#p_member").val();
	html +=
		` <div class="row" id="row_mem_` +
		row +
		`">
					<div class="col-md-5">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Rp.</span>
								</div>
								<input type="text" name ="harga_jual_memeber" id="harga_jual_memeber" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">.00</span>

								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="row">
							<div class="col-md-6">
								<div class="custom-control custom-checkbox">
									<input class="custom-control-input" type="checkbox"
										id="member_aktif" name="member_aktif" value="y">
									<label for="member_aktif"
										class="custom-control-label">Aktifkan</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-sm bg-gradient-danger" onclick="rm_mem(` +
		row +
		`)"><i
								class="fa fa-trash"></i></button>
					</div>
				</div>`;
	$("#member_list").append(html);
	row++;
	$("#p_member").val(row);
}

function rm_mem(row) {
	$("#row_mem_" + row + "").remove();
}

function save_data_produk() {
	var id_produk = $("#id_produk").val();
	var nama_produk = $("#nama_produk").val();
	var produk_by = $("#produk_by").val();
	var sku_kode_produk = $("#sku_kode_produk").val();
	var barcode = $("#barcode").val();
	var satuan_utama = $("#satuan_utama").val();
	var id_rak = $("#id_rak").val();
	var jumlah_minimal = $("#jumlah_minimal").val();
	var status_jual = $("input[type=radio][name=harga_option]").val();
	var harga_beli = $("#harga_beli").val();
	var jenis_produk = $("#jenis_produk").val();

	// obejct satuan
	var jumlah_produk = [];
	var satuan = [];
	var jumlah_produk_p = [];

	$("input[name=jumlah_produk1]").each(function () {
		jumlah_produk.push($(this).val());
	});

	$(".p_satuan").each(function () {
		satuan.push($(this).val());
	});

	$("input[name=jumlah_produk2]").each(function () {
		jumlah_produk_p.push($(this).val());
	});

	// objeck harga
	var harga_jual = $("#harga_jual").val();

	// object fleksibel
	var harga_fleksibel = [];
	var ket = [];

	$("input[name=harga_jual_fleksibel]").each(function () {
		harga_fleksibel.push($(this).val());
	});

	$("input[name=ket]").each(function () {
		ket.push($(this).val());
	});

	// object grosir
	var harga_grosir = [];
	var jumlah_satuan = [];

	$("input[name=harga_jual_grosir]").each(function () {
		harga_grosir.push($(this).val());
	});

	$("input[name=satuan_jumlah]").each(function () {
		jumlah_satuan.push($(this).val());
	});

	// obecjt member
	var harga_member = [];
	var status_aktif = [];

	$("input[name=harga_jual_memeber]").each(function () {
		harga_member.push($(this).val());
	});

	$("input[name=member_aktif]").each(function () {
		status_aktif.push($(this).val());
	});

	$.ajax({
		type: "POST",
		url: URL + "produk/save_produk",
		data: {
			id_produk: id_produk,
			nama_produk: nama_produk,
			produk_by: produk_by,
			sku_kode_produk: sku_kode_produk,
			barcode: barcode,
			satuan_utama: satuan_utama,
			id_rak: id_rak,
			jumlah_minimal: jumlah_minimal,
			status_jual: status_jual,
			harga_beli: harga_beli,
			jumlah_produk: jumlah_produk,
			satuan: satuan,
			jumlah_produk_p: jumlah_produk_p,
			harga_jual: harga_jual,
			harga_fleksibel: harga_fleksibel,
			ket: ket,
			harga_grosir: harga_grosir,
			jumlah_satuan: jumlah_satuan,
			harga_member: harga_member,
			id_jenis_produk: jenis_produk,
			status_aktif: status_aktif,
		},
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Berhasil !",
					text: res.msg,
				});
				$("#tbl_produk").DataTable().destroy();
				load_produk(text, jual, rak);
				$("#modal_input_produk").modal("hide");
			} else {
				Swal.fire({
					icon: "warning",
					title: "Pehatian !",
					text: res.msg,
				});
			}
		},
	});
}

$("#modal_input_produk").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_produk").val("");
	$("#nama_produk").val("");
	$("#produk_by").val("");
	$("#sku_kode_produk").val("");
	$("#barcode").val("");
	$("#satuan_utama").val("");
	$("#id_rak").val("");
	$("#jumlah_minimal").val("");
	$("input[type=radio][name=harga_option]").val("");
	$("#harga_beli").val("");
	$("#jenis_produk").val("");
	load_select("pil", "pil", "pil");
});

$("#modal_edit_produk").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_produk").val("");
	$("#nama_produk").val("");
	$("#produk_by").val("");
	$("#sku_kode_produk").val("");
	$("#barcode").val("");
	$("#satuan_utama").val("");
	$("#id_rak").val("");
	$("#jumlah_minimal").val("");
	$("input[type=radio][name=harga_option]").val("");
	$("#harga_beli").val("");
	$("#jenis_produk").val("");
	load_select("pil", "pil", "pil");
	$("#edit_loop_satuan-html").find(".row").remove();
	$("#edit_satuan-html").find(".row").remove();
});

function add_data() {
	$("#modal_input_produk").modal("show");
}

// edit Produk

$("input[type=radio][name=harga_option_edit]").change(function () {
	var val = this.value;
	$("#edit_harga_option_param").val(val);

	if (val == 1) {
		$("#edit_fleksibel_list").show();
		$("#edit_grosir_list").hide();
		$("#edit_member_list").hide();
	}

	if (val == 2) {
		$("#edit_fleksibel_list").hide();
		$("#edit_grosir_list").show();
		$("#edit_member_list").hide();
	}
	if (val == 3) {
		$("#edit_fleksibel_list").hide();
		$("#edit_grosir_list").hide();
		$("#edit_member_list").show();
	}
});

function load_satuan_edit_sat(p_id_satuan, p_id) {
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
			$("#id_satuan_edit_" + p_id).html(html);
		},
	});
}

function get_satuan_utama_edit() {
	var id = $("#edit_satuan_utama").val();
	$.ajax({
		type: "POST",
		url: URL + "produk/get_satuan",
		data: { id_satuan: id },
		success: function (data) {
			var res = JSON.parse(data);
			$("#edit_satuan_harga_beli").html(res.res);
			$("#edit_satuan_harga_jual").html(res.res);
			$("#edit_sat_param_row").val(res.res);
		},
	});
}

function loop_fleksibel_edit(param) {
	var html = "";
	param.forEach((e) => {
		if (e.id_jenis_harga == "1") {
			html +=
				`<div class = "row" id="row_flek_ed_` +
				e.id_harga +
				`">
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Rp.</span>
								</div>
								<input type="text" name="edit_id_detail_produk" id="edit_id_detail_produk_fleksibel"
									class="form-control" value="` +
				e.harga_jual +
				`">
								
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<input type="text" id="edit_ket" name="edit_ket" class="form-control"
								placeholder="Inputkan Keterangan" value="` +
				e.ket +
				`">
						</div>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-sm bg-gradient-danger" onclick="rm_flek_ed(` +
				e.id_harga +
				`,` +
				e.id_harga +
				`);"><i
								class="fa fa-trash"></i></button>
					</div>
				</div>`;
		}
	});

	$("#edit_fleksibel_list").html(html);
}

function loop_grosir_edit(param) {
	var html = "";
	param.forEach((e) => {
		if (e.id_jenis_harga == "2") {
			html +=
				`<div class = "row" id="row_gro_ed_` +
				e.id_harga +
				`">
					<div class="col-md-5">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Rp.</span>
								</div>
								<input type="text" id="edit_harga_jual_grosir" class="form-control" value="` +
				e.harga_jual +
				`">
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">>=</span>
								</div>
								<input type="text"  id="edit_satuan_jumlah" class="form-control" value="` +
				e.jumlah_per_satuan +
				`">
								<div class="input-group-append">
									<span class="input-group-text">Satuan</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-sm bg-gradient-danger" onclick="rm_gro_ed(` +
				e.id_harga +
				`,` +
				e.id_harga +
				`)"><i
								class="fa fa-trash"></i></button>
					</div>
				</div>`;
		}
	});

	$("#edit_grosir_list").html(html);
}

function loop_member_edit(param) {
	var html = "";
	param.forEach((e) => {
		if (e.id_jenis_harga == "3") {
			// if (e.aktif == "y") {
			$("#edit_member_aktif").prop("checked", true);
			// }

			html +=
				` <div class = "row" id="row_mem_ed_` +
				e.id_harga +
				`">
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Rp.</span>
								</div>
								<input type="text" id="edit_harga_jual_memeber" class="form-control" value="` +
				e.harga_jual +
				`">
								<div class="input-group-append">
									<span class="input-group-text">.00</span>

								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="row">
							<div class="col-md-6">
								<div class="custom-control custom-checkbox">
									<input class="custom-control-input" type="checkbox"
										id="edit_member_aktif" name="edit_edit_member_aktif" value="y">
									<label for="edit_member_aktif"
										class="custom-control-label">Aktifkan</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<button type="button" class="btn btn-sm bg-gradient-danger" onclick="rm_mem_ed(` +
				e.id_harga +
				`,` +
				e.id_harga +
				`)"><i
								class="fa fa-trash"></i></button>
					</div>
				</div>`;
		}
	});

	$("#edit_member_list").html(html);
}

function jenis_harga(param) {
	if (param !== null) {
		loop_fleksibel_edit(param);
		loop_grosir_edit(param);
		loop_member_edit(param);
	}

	// param.forEach((e) => {
	// 	if (e.id_jenis_harga == "4") {
	// 		$("#id_harga").val(e.id_harga);
	// 		$("#harga_jual").val(e.harga_jual);
	// 	}
	// });

	$("#edit_fleksibel").closest(".btn").button("toggle");
	$("#edit_grosir_list").hide();
	$("#edit_member_list").hide();
}

function loop_satuan_edit(param) {
	var el_satuan = "";
	if (param !== null) {
		param.forEach((e) => {
			load_satuan_edit_sat(e.id_satuan, e.id_produk_detail);
			el_satuan +=
				` <div class="row" id="row_ed_` +
				e.id_produk_detail +
				`">
									
									<div class="col-md-3"><input type="number" name="ed_jumlah_produk1" value="` +
				e.jumlah_produk +
				`" class="form-control"
											placeholder="Inputkan Jumlah Produk">
									</div>
									<div class="col-md-3">
										<select id="id_satuan_edit_` +
				e.id_produk_detail +
				`"
				name="id_satuan_ed_view" class="form-control select2 p_satuan">
											<option value=""> Pilih Satuan </option>
										</select>
									</div>
									<div class="col-md-6">
										<div class="input-group mb-3">
											<input type="number" name="ed_jumlah_produk2" value="` +
				e.jumlah_produk_p +
				`" class="form-control"
												placeholder="Inputkan Produk Persatuan">
											<div class="input-group-append">
												<span class="input-group-text" id="sat_param">` +
				e.nama_satuan +
				`
			</span>
												<button type="button" class="btn btn-sm bg-gradient-danger" onclick="remove_satuan_ed(` +
				e.id_produk_detail +
				`,` +
				e.id_produk_detail +
				`);"><i
														class="fa fa-trash"></i></button>
											</div>
										</div>

									</div>
								</div>`;
		});

		$("#edit_loop_satuan-html").html(el_satuan);
	}
}

function loop_satuan_el_edit(
	p_jumlah_produk1 = "",
	p_satuan = "",
	p_jumlah_produk2 = ""
) {
	var row = $("#edit_param_row").val();
	var sat = $("#edit_sat_param_row").val();
	// $("#sat_param").html(sat);
	load_satuan_edit_sat(p_satuan, row);
	var el_satuan =
		` <div class="row" id="row_ed_` +
		row +
		`">
									
									<div class="col-md-3"><input type="number" name="edit_jumlah_produk1" value="` +
		p_jumlah_produk1 +
		`" class="form-control"
											placeholder="Inputkan Jumlah Produk">
									</div>
									<div class="col-md-3">
										<select id="id_satuan_edit_` +
		row +
		`" name="id_satuan_edit" class="form-control select2 p_satuan_view">
											<option value=""> Pilih Satuan</option>
										</select>
									</div>
									<div class="col-md-6">
										<div class="input-group mb-3">
											<input type="number" name="edit_jumlah_produk2" value="` +
		p_jumlah_produk2 +
		`" class="form-control"
												placeholder="Inputkan Produk Persatuan">
											<div class="input-group-append">
												<span class="input-group-text" id="sat_param">` +
		sat +
		`
			</span>
												<button type="button" class="btn btn-sm bg-gradient-danger" onclick="remove_satuan_ed(` +
		row +
		`,null);"><i
														class="fa fa-trash"></i></button>
											</div>
										</div>

									</div>
								</div>`;

	$("#edit_satuan-html").append(el_satuan);
	row++;
	$("#edit_param_row").val(row);
}

function remove_satuan_ed(row, id) {
	$("#row_ed_" + row + "").remove();
	if (id !== null) {
		$.ajax({
			url: URL + "produk/hapus_satuan",
			type: "POST",
			data: { id_produk_detail: id },
			success: function (data) {
				var res = JSON.parse(data);

				if (res.status == 1) {
					Swal.fire({
						icon: "success",
						title: "Suceess",
						text: res.msg,
					});
				} else {
					Swal.fire({
						icon: "error",
						title: "Perhatian !!!",
						text: res.msg,
					});
				}
			},
		});
	}
}

function load_jenis_produk(id) {
	if (id == 2) {
		$("#edit_obat").closest(".btn").button("toggle");
		$("#edit_jenis_produk").val("obat");
	}

	if (id == 1) {
		$("#edit_alkes").closest(".btn").button("toggle");
		$("#edit_jenis_produk").val("alat kesehatan");
	}

	if (id == 3) {
		$("#edit_umum").closest(".btn").button("toggle");
		$("#edit_jenis_produk").val("umum");
	}
}

function load_status_jual(id) {
	if (id == 1) {
		$("#edit_jual").closest(".btn").button("toggle");
	}

	if (id == 2) {
		$("#edit_tidak_dijual").closest(".btn").button("toggle");
	}
}

function loop_harga_al_edit() {
	var param = $("#edit_harga_option_param").val();
	console.log(param);
	$("#edit_p_fleksibel").val(1);
	$("#edit_p_grosir").val(1);
	$("#edit_p_member").val(1);
	if (param == 1) {
		loop_fleksibel_ed();
	}
	if (param == 2) {
		loop_grosir_ed();
	}
	if (param == 3) {
		loop_member_ed();
	}
}

function loop_fleksibel_ed() {
	var html = "";
	var row = $("#edit_p_fleksibel").val();
	html +=
		`<div class="row" id="row_flek_ed_` +
		row +
		`">
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Rp.</span>
								</div>
								<input type="text" name="edit_harga_jual_fleksibel" id="edit_harga_jual_fleksibel"
									class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<input type="text" id="edit_ket" name="edit_ket" class="form-control"
								placeholder="Inputkan Keterangan">
						</div>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-sm bg-gradient-danger" onclick="rm_flek_ed(` +
		row +
		`,null);"><i
								class="fa fa-trash"></i></button>
					</div>
				</div>`;

	$("#edit_fleksibel_list").append(html);
	row++;
	$("#edit_p_fleksibel").val(row);
}

function rm_flek_ed(row, id) {
	$("#row_flek_ed_" + row + "").remove();

	if (id !== null) {
		$.ajax({
			url: URL + "produk/hapus_harga_jenis",
			type: "POST",
			data: { id_harga: id },
			success: function (data) {
				var res = JSON.parse(data);

				if (res.status == 1) {
					Swal.fire({
						icon: "success",
						title: "Suceess",
						text: res.msg,
					});
				} else {
					Swal.fire({
						icon: "error",
						title: "Perhatian !!!",
						text: res.msg,
					});
				}
			},
		});
	}
}

function loop_grosir_ed() {
	var html = "";
	var row = $("#p_grosir").val();
	html +=
		`<div class="row" id="row_gro_ed_` +
		row +
		`">
					<div class="col-md-5">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Rp.</span>
								</div>
								<input type="text" name ="edit_harga_jual_grosir" id="edit_harga_jual_grosir" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">>=</span>
								</div>
								<input type="text" id="edit_satuan_jumlah" name="edit_satuan_jumlah" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">Satuan</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-sm bg-gradient-danger" onclick="rm_gro_ed(` +
		row +
		`,null)"><i
								class="fa fa-trash"></i></button>
					</div>
				</div>`;
	$("#edit_grosir_list").append(html);
	row++;
	$("#edit_p_grosir").val(row);
}

function rm_gro_ed(row, id) {
	$("#row_gro_ed_" + row + "").remove();
	if (id !== null) {
		$.ajax({
			url: URL + "produk/hapus_harga_jenis",
			type: "POST",
			data: { id_harga: id },
			success: function (data) {
				var res = JSON.parse(data);

				if (res.status == 1) {
					Swal.fire({
						icon: "success",
						title: "Suceess",
						text: res.msg,
					});
				} else {
					Swal.fire({
						icon: "error",
						title: "Perhatian !!!",
						text: res.msg,
					});
				}
			},
		});
	}
}

function loop_member_ed() {
	var html = "";
	var row = $("#edit_p_member").val();
	html +=
		` <div class="row" id="row_mem_ed_` +
		row +
		`">
					<div class="col-md-5">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Rp.</span>
								</div>
								<input type="text" name ="edit_harga_jual_memeber" id="edit_harga_jual_memeber" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">.00</span>

								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="row">
							<div class="col-md-6">
								<div class="custom-control custom-checkbox">
									<input class="custom-control-input" type="checkbox"
										id="edit_member_aktif" name="edit_member_aktif" value="y">
									<label for="edit_member_aktif"
										class="custom-control-label">Aktifkan</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-sm bg-gradient-danger" onclick="rm_mem_ed(` +
		row +
		`,null)"><i
								class="fa fa-trash"></i></button>
					</div>
				</div>`;
	$("#edit_member_list").append(html);
	row++;
	$("#edit_p_member").val(row);
}

function rm_mem_ed(row, id) {
	$("#row_mem_ed_" + row + "").remove();
	if (id !== null) {
		$.ajax({
			url: URL + "produk/hapus_harga_jenis",
			type: "POST",
			data: { id_harga: id },
			success: function (data) {
				var res = JSON.parse(data);

				if (res.status == 1) {
					Swal.fire({
						icon: "success",
						title: "Suceess",
						text: res.msg,
					});
				} else {
					Swal.fire({
						icon: "error",
						title: "Perhatian !!!",
						text: res.msg,
					});
				}
			},
		});
	}
}

function edit(id) {
	$.ajax({
		url: URL + "produk/get_id_produk",
		type: "POST",
		data: { id: id },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#edit_harga_option_param").val(1);
				load_jenis_produk(res.produk.id_jenis_produk);
				load_select("pil", res.produk.id_rak, res.produk.satuan_utama);
				load_status_jual(res.produk.status_jual);
				loop_satuan_edit(res.satuan);
				jenis_harga(res.harga);
				$("#id_produk").val(res.produk.id_produk);
				$("#id_harga").val(res.produk.id_harga);
				$("#edit_nama_produk").val(res.produk.nama_produk);
				$("#edit_produk_by").val(res.produk.produk_by);
				$("#edit_sku_kode_produk").val(res.produk.sku_kode_produk);
				$("#edit_barcode").val(res.produk.barcode);
				$("#edit_harga_beli").val(res.produk.harga_beli);
				$("#edit_harga_jual").val(res.produk.harga_jual);
				$("#edit_jumlah_minimal").val(res.produk.jumlah_minimal);
				$("#modal_edit_produk").modal("show");
			} else {
				Swal.fire({
					icon: "error",
					title: "Perhatian",
					text: res.msg,
				});
			}
		},
	});
}

function save_edit_data_produk() {
	var id_produk = $("#id_produk").val();
	var nama_produk = $("#edit_nama_produk").val();
	var produk_by = $("#edit_produk_by").val();
	var sku_kode_produk = $("#edit_sku_kode_produk").val();
	var barcode = $("#edit_barcode").val();
	var satuan_utama = $("#edit_satuan_utama").val();
	var id_rak = $("#edit_id_rak").val();
	var jumlah_minimal = $("#edit_jumlah_minimal").val();
	var status_jual = $('input[name="edit_status_jual"]:checked').val();
	var harga_beli = $("#edit_harga_beli").val();
	var jenis_produk = $("#edit_jenis_produk").val();

	// obejct satuan
	var jumlah_produk = [];
	var satuan = [];
	var jumlah_produk_p = [];

	$("input[name=edit_jumlah_produk1]").each(function () {
		jumlah_produk.push($(this).val());
	});

	$(".p_satuan").each(function () {
		satuan.push($(this).val());
	});

	$("input[name=edit_jumlah_produk2]").each(function () {
		jumlah_produk_p.push($(this).val());
	});

	// objeck harga
	var id_harga = $("#id_harga").val();
	var harga_jual = $("#edit_harga_jual").val();

	// object fleksibel
	var harga_fleksibel = [];
	var ket = [];

	$("input[name=edit_harga_jual_fleksibel]").each(function () {
		harga_fleksibel.push($(this).val());
	});

	$("input[name=edit_ket]").each(function () {
		ket.push($(this).val());
	});

	// object grosir
	var harga_grosir = [];
	var jumlah_satuan = [];

	$("input[name=edit_harga_jual_grosir]").each(function () {
		harga_grosir.push($(this).val());
	});

	$("input[name=edit_satuan_jumlah]").each(function () {
		jumlah_satuan.push($(this).val());
	});

	// obecjt member
	var harga_member = [];
	var status_aktif = [];

	$("input[name=edit_harga_jual_memeber]").each(function () {
		harga_member.push($(this).val());
	});

	$("input[name=edit_member_aktif]").each(function () {
		status_aktif.push($(this).val());
	});

	$.ajax({
		type: "POST",
		url: URL + "produk/save_edit_produk",
		data: {
			id_produk: id_produk,
			nama_produk: nama_produk,
			produk_by: produk_by,
			sku_kode_produk: sku_kode_produk,
			barcode: barcode,
			satuan_utama: satuan_utama,
			id_rak: id_rak,
			jumlah_minimal: jumlah_minimal,
			status_jual: status_jual,
			harga_beli: harga_beli,
			jumlah_produk: jumlah_produk,
			satuan: satuan,
			jumlah_produk_p: jumlah_produk_p,
			id_harga: id_harga,
			harga_jual: harga_jual,
			harga_fleksibel: harga_fleksibel,
			ket: ket,
			harga_grosir: harga_grosir,
			jumlah_satuan: jumlah_satuan,
			harga_member: harga_member,
			id_jenis_produk: jenis_produk,
			status_aktif: status_aktif,
		},
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Berhasil !",
					text: res.msg,
				});
				$("#tbl_produk").DataTable().destroy();
				load_produk(text, jual, rak);
				$("#modal_edit_produk").modal("hide");
			} else {
				Swal.fire({
					icon: "warning",
					title: "Pehatian !",
					text: res.msg,
				});
			}
		},
	});
}
