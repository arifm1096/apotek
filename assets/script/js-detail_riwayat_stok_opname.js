$(document).ready(function () {
	// filter_data_penjualan();
	load_riwayat_so((text = ""), (tgl = ""));
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

function load_riwayat_so(text, tgl1, tgl2) {
	$("#tbl_riwayat_so").DataTable({
		ajax: {
			url: URL + "persediaan/load_riwayat_stok_opname",
			type: "POST",
			data: { text: text, tgl1: tgl1, tgl2: tgl2 },
		},
		processing: true,
		serverSide: true,
		searching: false,
		serverMethod: "POST",
		columns: [
			{
				data: "id_stok_opname_detail",
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
			{ data: "tgl_so" },
			{ data: "jumlah_stok" },
			{ data: "stok_fisik" },
			{ data: "penyesuaian" },
			{ data: "catatan" },
			{ data: "nama" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					if (row.verifikasi == "y") {
						return `<span class="badge bg-success">Sudah</span>`;
					} else {
						return `<span class="badge bg-danger">Belum</span>`;
					}
				},
			},
		],
	});
}

function filter_data() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	$("#tbl_riwayat_so").DataTable().destroy();
	load_riwayat_so(text, tgl1, tgl2);
}

function clear_filter() {
	$("#tbl_riwayat_so").DataTable().destroy();
	load_riwayat_so((text = ""), (tgl = ""));
	$("#filter_text").val("");
	$("#tanggal1").val("");
	$("#tanggal2").val("");
}

function export_excel() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	$.ajax({
		url : URL +'persediaan/cek_data_riwayat_so',
		type : 'POST',
		data : {text : text,tgl1:tgl1,tgl2:tgl2},
		success :function(data){
			var res = JSON.parse(data);

			if(res.status==1){
				window.open(
					URL +
						"persediaan/export_data_riwayat_so?tgl1=" +
						tgl1 +
						"&tgl2=" +
						tgl2 +
						"&text=" +
						text,
					"_blank"
				);
			}else{
				Swal.fire({
					icon: "error",
					title: "Pehatian !",
					text: res.msg,
				});
			}
		}
	});	
}

function export_pdf() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();

	$.ajax({
		url : URL +'persediaan/cek_data_riwayat_so',
		type : 'POST',
		data : {text : text,tgl1:tgl1,tgl2:tgl2},
		success :function(data){
			var res = JSON.parse(data);

			if(res.status==1){
				window.open(
					URL +
						"persediaan/export_data_riwayat_so_pdf?tgl1=" +
						tgl1 +
						"&tgl2=" +
						tgl2 +
						"&text=" +
						text,
					"_blank"
				);
			}else{
				Swal.fire({
					icon: "error",
					title: "Pehatian !",
					text: res.msg,
				});
			}
		}
	});	

	
}
