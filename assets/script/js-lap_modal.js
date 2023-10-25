$(document).ready(function () {
	load_modal((text = ""), (tgl1 = ""), (tgl2 = ""));
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

const rupiah = (number) => {
	return new Intl.NumberFormat("id-ID", {
		style: "currency",
		currency: "IDR",
	}).format(number);
};

function load_modal(text, tgl1, tgl2) {
	$("#tbl_penjualan").DataTable({
		ajax: {
			url: URL + "laporan/load_modal",
			type: "POST",
			data: { text: text, tgl1: tgl1, tgl2: tgl2 },
		},
		processing: true,
		serverSide: true,
		serverMethod: "POST",
		lengthMenu: [100, 500, 1000],
		pageLength: 1000,
		columns: [
			{
				data: "id_stok",
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
			{ data: "jumlah_stok" },
			{
				data: "total_harga",
				render: $.fn.dataTable.render.number(".", ".", 0),
			},
		],

		drawCallback: function (settings) {
			$("#total_nominal").html(settings.json.total_nominal);
			$("#total_produk").html(settings.json.total_produk);
		},
	});
}

function export_excel() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	window.open(URL + "laporan/export_excel_modal?_blank");
}
