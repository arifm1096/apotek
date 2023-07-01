$(document).ready(function () {
	status_aktif();
	load_produk((text = ""), (jual = "pil"), (rak = "pil"));
	load_select();
	load_select_filter();
	$("#loading").hide();
	$("#param_row").val(1);
	$("#jenis_produk").val("obat");
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
					if (row.status_jual == "y") {
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
						"','" +
						row.kode_produk +
						"','" +
						row.nama_produk +
						"','" +
						row.alamat +
						"','" +
						row.no_hp +
						"','" +
						row.aktif +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_produk +
						"','" +
						row.nama_produk +
						"','" +
						row.kode_produk +
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

$("#add_pelanggan").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "master/save_pelanggan",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_pelanggan").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.msg,
				});

				$("#tbl_pelanggan").DataTable().clear().destroy();
				load_pelanggan();
				$("#modal_input_pelanggan").modal("hide");
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

function get_ksu() {
	var jenis_produk = $("#jenis_produk").val();
	var nama_produk = $("#nama_produk").val();
	$.ajax({
		type: "POST",
		url: URL + "produk/get_kode_ksu",
		data: { jenis_produk: jenis_produk, nama_produk: nama_produk },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				$("#sku_kode_produk").val(res.result);
			} else {
				$("#sku_kode_produk").val(res.result);
				Swal.fire({
					icon: "error",
					title: "Warning",
					text: res.msg,
				});
			}
		},
	});
}

$("input[type=radio][name=jnp_options]").change(function () {
	var val = this.value;
	$("#jenis_produk").val(val);
});

$("#modal_input_pelanggan").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_pelanggan").val("");
	$("#kode_pelanggan").val("");
	$("#alamat").val("");
	$("#nama_pelanggan").val("");
	status_aktif((id_status = "pil"));
});
