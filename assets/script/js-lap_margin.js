$(document).ready(function () {
	// filter_data_penjualan();
	// load_margin((text = ""), (tgl1 = ""), (tgl2 = ""));
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

function load_margin(tgl1, tgl2) {
	$("#tbl_margin").DataTable({
		ajax: {
			url: URL + "laporan/load_margin",
			type: "POST",
			data: { tgl1: tgl1, tgl2: tgl2 },
		},
		processing: true,
		serverSide: true,
		searching: false,
		serverMethod: "POST",
		columns: [
			{
				data: "id_jual",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return row.nama_produk + "<br> SKU : " + row.sku_kode_produk;
				},
			},
			{ data: "harga_beli", render: $.fn.dataTable.render.number(".", ".", 0) },
			{ data: "tot_produk_jual" },
			{
				data: "tot_harga_beli",
				render: $.fn.dataTable.render.number(".", ".", 0),
			},
			{
				data: "tot_harga_jual",
				render: $.fn.dataTable.render.number(".", ".", 0),
			},
			{ data: "margin", render: $.fn.dataTable.render.number(".", ".", 0) },
		],
		drawCallback: function (settings) {
			$("#total_nominal").html(settings.json.total_nominal);
		},
	});
}

function filter_data() {
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	if (tgl1 !== "" && tgl2 !== "") {
		$("#tbl_margin").DataTable().destroy();
		load_margin(tgl1, tgl2);
	}
}

function clear_filter() {
	$("#tbl_margin").DataTable().destroy();
	load_margin((text = ""), (tgl = ""));
	$("#filter_text").val("");
	$("#tanggal").val("");
}

function export_excel() {
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	if (tgl1 !== "" && tgl2 !== "") {
		window.open(
			URL + "laporan/export_excel_margin?tgl1=" + tgl1 + "&tgl2=" + tgl2,
			+"_blank"
		);
	} else {
		Swal.fire({
			icon: "warning",
			title: "Perhatian !!",
			text: "Pilih FIlter Terlebih Dahulu",
		});
	}
}
