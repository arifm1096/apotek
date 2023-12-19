$(document).ready(function () {
	// filter_data_penjualan();
	// load_penjualan((text = ""), (tgl = ""), (tgl2 = ""), (shif = "pil"));
	// load_total_penjualan((text = ""), (tgl1 = ""), (tgl2 = ""), (shif = "pil"));
	$("#loading").hide();
	filter_data_penjualan();
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});

$("#tanggal").datetimepicker({ icons: { time: "fa fa-clock" } });
//Initialize Select2 Elements
$(".select2").select2();

function filter_data_penjualan(id = null) {
	var html_kondisi = "<option value='pil'> Pilih Kondisi </option>";
	var html_gudang = "<option value='pil'> Pilih Gudang </option>";
	var html_shif = "<option value='pil'> Pilih Shif </option>";

	$.ajax({
		url: URL + "master/get_filter_penjualan",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				// res.kondisi.forEach((e) => {
				// 	html_kondisi +=
				// 		'<option value="' +
				// 		e.id_kondisi +
				// 		'"' +
				// 		(e.id_kondisi === id ? 'selected="selected"' : "") +
				// 		">" +
				// 		e.nama_kondisi +
				// 		"</option>";
				// });

				res.shif.forEach((e) => {
					html_shif +=
						'<option value="' +
						e.id_shif +
						'"' +
						(e.id_shif === id ? 'selected="selected"' : "") +
						">" +
						e.nama_shif +
						"</option>";
				});

				// res.gudang.forEach((e) => {
				// 	html_gudang +=
				// 		'<option value="' +
				// 		e.id_gudang +
				// 		'"' +
				// 		(e.id_gudang === id ? 'selected="selected"' : "") +
				// 		">" +
				// 		e.nama_gudang +
				// 		"</option>";
				// });
			}

			$("#shif").html(html_shif);
			// $("#gudang_filter").html(html_gudang);
			// $("#kondisi_filter").html(html_kondisi);
		},
	});
}

function add_data() {
	$("#modal_input_produk").modal("show");
}

const rupiah = (number) => {
	return new Intl.NumberFormat("id-ID", {
		style: "currency",
		currency: "IDR",
	}).format(number);
};

function load_total_penjualan(text, tgl1, tgl2, shif) {
	$.ajax({
		url: URL + "penjualan/load_sum_pejualan_shif",
		type: "POST",
		data: { text: text, tgl1: tgl1, tgl2: tgl2, shif: shif },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				var nom = rupiah(res.result.total);
				$("#total_pejualan").html(nom);
				$("#tot_jual").html(nom);
				$("#tot_produk").html(res.result.tot_produk);
			} else {
				var nom = rupiah(0);
				$("#total_pejualan").html(nom);
			}
		},
	});
}

function load_penjualan(text, tgl1, tgl2, shif) {
	$("#tbl_penjualan").DataTable({
		ajax: {
			url: URL + "penjualan/load_data_penjualan_shif",
			type: "POST",
			data: { text: text, tgl1: tgl1, tgl2: tgl2, shif: shif },
		},
		processing: true,
		serverSide: true,
		searching: false,
		serverMethod: "POST",
		columns: [
			{
				data: "id_produk",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},
			{ data: "no_nota" },
			{ data: "nama_produk" },
			{ data: "jumlah_nama_satuan" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return rupiah(row.total_harga);
				},
			},
			// {
			// 	data: null,
			// 	orderable: false,
			// 	render: function (data, type, row) {
			// 		return (
			// 			`<div class="row">
			// 					<div class="col-md-12">
			// 						<button type="button" class="btn btn-outline-success btn-sm" onclick="detail_pen('` +
			// 			row.id_jual +
			// 			`')"><i class="fa fa-search"></i> Detail</button>
			// 					</div>
			// 				</div>

			// 				`
			// 		);
			// 	},
			// },
		],
	});
}

function filter_data() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	var shif = $("#shif").val();
	$("#tbl_penjualan").DataTable().destroy();
	load_penjualan(text, tgl1, tgl2, shif);
	load_total_penjualan(text, tgl1, tgl2, shif);
}

function clear_filter() {
	$("#tbl_penjualan").DataTable().destroy();
	$("#filter_text").val("");
	$("#tanggal1").val("");
	$("#tanggal2").val("");
	filter_data_penjualan("pil");
	load_penjualan((text = ""), (tgl = ""), (tgl2 = ""), (shif = "pil"));
}

function export_excel() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	var shif = $("#shif").val();
	window.open(
		URL +
			"penjualan/export_data_penjualan_shif?tgl1=" +
			tgl1 +
			"&tgl2=" +
			tgl2 +
			"&text=" +
			text +
			"&shif=" +
			shif,
		"_blank"
	);
}

function export_pdf() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	var shif = $("#shif").val();
	window.open(
		URL +
			"penjualan/print_data_penjualan_shif?tgl1=" +
			tgl1 +
			"&tgl2=" +
			tgl2 +
			"&text=" +
			text +
			"&shif=" +
			shif,
		"_blank"
	);
}

function add_penjualan() {
	load_select();
	$("#modal_data_penjualan").modal("show");
}

function load_select(id_produk, id_satuan) {
	var produk = "<option value='pil'> Pilih Produk </option>";
	var satuan = "<option value='pil'> Pilih Satuan </option>";

	$.ajax({
		url: URL + "penjualan/get_data_master",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				res.produk.forEach((e) => {
					produk +=
						'<option value="' +
						e.id_produk +
						'"' +
						(e.id_produk === id_produk ? 'selected="selected"' : "") +
						">" +
						e.nama_produk +
						"</option>";
				});

				res.satuan.forEach((e) => {
					satuan +=
						'<option value="' +
						e.id_satuan +
						'"' +
						(e.id_satuan === id_satuan ? 'selected="selected"' : "") +
						">" +
						e.nama_satuan +
						"</option>";
				});
			}

			$("#id_produk").html(produk);
			$("#id_satuan").html(satuan);
		},
	});
}

function get_nominal() {
	$("#nama_produk").val("");
	$("#id_satuan_utama").val("");
	$("#harga_jual").val("");
	var id_produk = $("#id_produk").val();
	var id_satuan = $("#id_satuan").val();
	$.ajax({
		url: URL + "penjualan/get_harga",
		type: "POST",
		data: { id_produk: id_produk, id_satuan: id_satuan },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#nama_produk").val(res.result.nama_produk);
				$("#id_satuan_utama").val(res.result.satuan_utama);
				$("#id_jenis_harga").val(res.result.id_jenis_harga);
				$("#harga_beli").val(res.result.harga_beli);
				$("#harga_jual").val(res.nominal);
			} else {
				if (res.status == 0) {
					Swal.fire({
						icon: "error",
						title: "Perahatian..!!",
						text: res.msg,
					});
				}
			}
		},
	});
}

function hit_total() {
	var harga = $("#harga_jual").val();
	var qty = $("#jumlah_produk").val();
	$("#total_harga").val("");
	$.ajax({
		url: URL + "penjualan/get_tot_jual",
		type: "POST",
		data: { harga: harga, qty: qty },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#total_harga").val(res.result);
			}
		},
	});
}

$("#add_data_penjualan").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "penjualan/save_penjualan_back",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_dokter").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				clear_form();
				$("#modal_data_penjualan").modal("hide");
				Swal.fire({
					icon: "success",
					title: "Success",
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
});

function clear_form() {
	$("#harga_jual").val("");
	$("#jumlah_produk").val("");
	$("#nama_produk").val("");
	$("#id_satuan_utama").val("");
	$("#id_jenis_harga").val("");
	$("#harga_beli").val("");
	$("#tanggal").val("");
	$("#jumlah_produk").val("");
}
