$(document).ready(function () {
	// filter_data_penjualan();
	loda_retur((text = ""), (tgl = ""));
	$("#loading").hide();
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function filter_data_penjualan(id) {
	var html_kondisi = "<option value='pil'> Pilih Kondisi </option>";
	var html_gudang = "<option value='pil'> Pilih Gudang </option>";
	$.ajax({
		url: URL + "master/get_filter_penjualan",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				res.kondisi.forEach((e) => {
					html_kondisi +=
						'<option value="' +
						e.id_kondisi +
						'"' +
						(e.id_kondisi === id ? 'selected="selected"' : "") +
						">" +
						e.nama_kondisi +
						"</option>";
				});

				res.gudang.forEach((e) => {
					html_gudang +=
						'<option value="' +
						e.id_gudang +
						'"' +
						(e.id_gudang === id ? 'selected="selected"' : "") +
						">" +
						e.nama_gudang +
						"</option>";
				});
			}
			$("#gudang_filter").html(html_gudang);
			$("#kondisi_filter").html(html_kondisi);
		},
	});
}

function add_data_retur() {
	window.location.href = URL + "pembelian/retur_detail";
}

const rupiah = (number) => {
	return new Intl.NumberFormat("id-ID", {
		style: "currency",
		currency: "IDR",
	}).format(number);
};

// function load_total_penjualan(text, tgl1, tgl2) {
// 	$.ajax({
// 		url: URL + "penjualan/load_sum_pejualan",
// 		type: "POST",
// 		data: { text: text, tgl1: tgl1, tgl2: tgl2 },
// 		success: function (data) {
// 			var res = JSON.parse(data);
// 			if (res.status == 1) {
// 				var nom = rupiah(res.result.total);
// 				$("#total_pejualan").html(nom);
// 			} else {
// 				var nom = rupiah(0);
// 				$("#total_pejualan").html(nom);
// 			}
// 		},
// 	});
// }

function loda_retur(text, tgl1, tgl2) {
	$("#tbl_retur").DataTable({
		ajax: {
			url: URL + "pembelian/load_retur",
			type: "POST",
			data: { text: text, tgl1: tgl1, tgl2: tgl2 },
		},
		processing: true,
		serverSide: true,
		searching: false,
		serverMethod: "POST",
		columns: [
			{
				data: "id_retur",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},
			{ data: "tgl_retur" },
			{ data: "no_faktur" },
			{ data: "nama_supplier" },
			{ data: "produk" },
			{ data: "jumlah_retur_p" },
			{ data: "satuan" },
			// {
			// 	data: null,
			// 	orderable: false,
			// 	render: function (data, type, row) {
			// 		return (
			// 			`<div class="row">
			// 					<div class="col-md-12">
			// 						<button type="button" class="btn btn-outline-warning btn-sm" onclick="edit_ret('` +
			// 			row.id_retur +
			// 			`')"><i class="fa fa-pencil-alt"></i></button>
			// 			<button type="button" class="btn btn-outline-danger btn-sm ml-1" onclick="detail_pen('` +
			// 			row.id_retur +
			// 			`')"><i class="fa fa-trash"></i></button>
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
	$("#tbl_retur").DataTable().destroy();
	loda_retur(text, tgl1, tgl2);
}

function clear_filter() {
	$("#tbl_retur").DataTable().destroy();
	loda_retur((text = ""), (tgl = ""));
	$("#filter_text").val("");
	$("#tanggal1").val("");
	$("#tanggal2").val("");
}

function edit_ret(id) {
	window.location.href = URL + "pembelian/edit_retur/" + id;
}

function export_pdf() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	window.open(
		URL +
			"pembelian/export_retur_pdf?tgl1=" +
			tgl1 +
			"&tgl2=" +
			tgl2 +
			"&text=" +
			text,
		"_blank"
	);
}

function export_excel() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	window.open(
		URL +
			"pembelian/export_retur_excel?tgl1=" +
			tgl1 +
			"&tgl2=" +
			tgl2 +
			"&text=" +
			text,
		"_blank"
	);
}
