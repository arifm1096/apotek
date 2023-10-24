$(document).ready(function () {
	// filter_data_penjualan();
	load_penjualan((text = ""), (tgl = ""));
	load_total_penjualan((text = ""), (tgl1 = ""), (tgl2 = ""));
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

function add_data() {
	$("#modal_input_produk").modal("show");
}

const rupiah = (number) => {
	return new Intl.NumberFormat("id-ID", {
		style: "currency",
		currency: "IDR",
	}).format(number);
};

function load_total_penjualan(text, tgl1, tgl2) {
	$.ajax({
		url: URL + "laporan/load_sum_pejualan",
		type: "POST",
		data: { text: text, tgl1: tgl1, tgl2: tgl2 },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				var nom = rupiah(res.result.total);
				$("#total_pejualan").html(nom);
				// var qty = rupiah(res.result.qty_pro);
				$("#qty_pejualan").html(res.result.qty_pro);
			} else {
				var nom = rupiah(0);
				$("#total_pejualan").html(nom);
				var qty = rupiah(0);
				$("#qty_pejualan").html(qty);
			}
		},
	});
}

function load_penjualan(text, tgl1, tgl2) {
	$("#tbl_penjualan").DataTable({
		ajax: {
			url: URL + "laporan/load_data_penjualan",
			type: "POST",
			data: { text: text, tgl1: tgl1, tgl2: tgl2 },
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
		],

		drawCallback: function (settings) {
			$("#total_nominal").html(settings.json.tot_nominal);
		},
	});
}

function filter_data() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	$("#tbl_penjualan").DataTable().destroy();
	load_penjualan(text, tgl1, tgl2);
	load_total_penjualan(text, tgl1, tgl2);
}

function clear_filter() {
	$("#tbl_penjualan").DataTable().destroy();
	load_penjualan((text = ""), (tgl = ""));
	$("#filter_text").val("");
	$("#tanggal").val("");
	load_total_penjualan(text, tgl1, tgl2);
}

function export_excel() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	window.open(
		URL +
			"laporan/export_data_penjualan?tgl1=" +
			tgl1 +
			"&tgl2=" +
			tgl2 +
			"&text=" +
			text,
		"_blank"
	);
}
