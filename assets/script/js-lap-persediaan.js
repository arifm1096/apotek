$(document).ready(function () {
	status_aktif();
	load_persediaan((text = ""), (jual = "pil"), (rak = "pil"));
	load_select_filter();
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});

$("#exp_date").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});

const rupiah = (number) => {
	return new Intl.NumberFormat("id-ID", {
		style: "currency",
		currency: "IDR",
	}).format(number);
};
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

function load_persediaan(text, jual, rak) {
	$("#tbl_presediaan").DataTable({
		ajax: {
			url: URL + "laporan/load_persediaan",
			type: "POST",
			data: { text: text, status_jual: jual, id_rak: rak },
		},
		order: [3, "desc"],
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
			{ data: "nama_produk" },
			{ data: "sku_kode_produk" },
			{ data: "stok" },
		],
	});
}

function filter_data() {
	var text = $("#filter_text").val();
	var jual = $("#filter_status_jual").val();
	var rak = $("#filter_rak").val();
	$("#tbl_presediaan").DataTable().destroy();
	load_persediaan(text, jual, rak);
}

function clear_filter() {
	$("#tbl_presediaan").DataTable().destroy();
	load_persediaan((text = ""), (jual = "pil"), (rak = "pil"));
	$("#filter_text").val("");
	load_select_filter("pil", "pil");
}

function export_excel() {
	var text = $("#filter_text").val();
	var jual = $("#filter_status_jual").val();
	var rak = $("#filter_rak").val();
	window.open(
		URL +
			"laporan/export_data_stok?status_jual=" +
			jual +
			"&id_rak=" +
			rak +
			"&text=" +
			text,
		"_blank"
	);
}
