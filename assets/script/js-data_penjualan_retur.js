$(document).ready(function () {
	// filter_data_penjualan();
	load_penjualan((text = ""), (tgl = ""), (tgl2 = ""), (shif = "pil"));
	load_total_penjualan((text = ""), (tgl1 = ""), (tgl2 = ""), (shif = "pil"));
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

function filter_data_penjualan(id = null) {
	var html_kondisi = "<option value='pil'> Pilih Kondisi </option>";
	var html_gudang = "<option value='pil'> Pilih Gudang </option>";
	var html_retur = "<option value='pil'> Pilih Shif </option>";

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
					html_retur +=
						'<option value="' +
						e.id_retur +
						'"' +
						(e.id_retur === id ? 'selected="selected"' : "") +
						">" +
						e.nama_retur +
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

			$("#shif").html(html_retur);
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
		url: URL + "penjualan/load_sum_pejualan_retur",
		type: "POST",
		data: { text: text, tgl1: tgl1, tgl2: tgl2, shif: shif },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				var nom = rupiah(res.result.total);
				$("#total_pejualan").html(nom);
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
			url: URL + "penjualan/load_data_penjualan_retur",
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
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						`<div class="row">
								<div class="col-md-12">
									<button type="button" class="btn btn-outline-success btn-sm" onclick="retur_pen('` +
						row.id_jual +
						`')"><i class="fa fa-undo"></i> Retur</button>
								</div>
							</div>

							`
					);
				},
			},
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
			"penjualan/export_data_penjualan_retur?tgl1=" +
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

function retur_pen(id_jual){
	$.ajax({
		url : URL +'penjualan/get_detail_data_jual_retur',
		type : 'POST',
		data: {id_jual:id_jual},
		success : function(data){
			var res = JSON.parse(data);

			if(res.status == 1){
				$("#nama_produk").html(res.result.nama_produk);
				$("#no_nota").html(res.result.no_nota);
				$("#id_produk").val(res.result.id_produk);
				$("#id_gudang").val(res.result.id_gudang);
				$("#id_stok").val(res.result.id_stok);
				$("#id_jual").val(res.result.id_jual);
				$("#id_satuan").val(res.result.id_satuan);
				$("#jumlah_produk_p").val(res.result.jumlah_produk);
				$("#jumlah_produk").val(res.result.jumlah_produk);
				$("#nama_satuan").val(res.result.nama_satuan);
				$("#harga_jual").val(res.result.harga_jual);
				$('#modal_retur').modal('show');
			}else{
				Swal.fire({
					icon : 'error',
					title : 'Perhatian',
					text : res.msg
				});
			}
		}
	})
}

$("#add_retur").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "penjualan/save_retur",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_satuan").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.message,
				});

				$("#tbl_penjualan").DataTable().destroy();
				load_penjualan(text, tgl1, tgl2, shif);
				$("#modal_retur").modal("hide");
			} else {
				Swal.fire({
					icon: "error",
					title: "Error",
					text: res.message,
				});
			}
		},
	});
});

