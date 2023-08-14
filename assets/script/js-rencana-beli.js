$(document).ready(function () {
	load_select("pil", "pil", "pil");
	load_produk_rencana("");
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function load_select(id_produk, id_jenis_pesanan) {
	var html_jenis_pes =
		"<option value='pil'> -- Pilih Jenis Pesanan -- </option>";
	var html_produk = "<option value='pil'>-- Pilih Produk --</option>";
	var html_satuan = "<option value='pil'>-- Pilih Patuan --</option>";
	$.ajax({
		url: URL + "pembelian/get_produk_pesan",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				res.jenis_pesanan.forEach((e) => {
					html_jenis_pes +=
						'<option value="' +
						e.id_jenis_pesanan +
						'"' +
						(e.id_jenis_pesanan === id_jenis_pesanan
							? 'selected="selected"'
							: "") +
						">" +
						e.nama_jenis_pesanan +
						"</option>";
				});

				res.produk.forEach((e) => {
					html_produk +=
						'<option value="' +
						e.id_produk +
						'"' +
						(e.id_produk === id_produk ? 'selected="selected"' : "") +
						">" +
						e.nama_produk +
						"</option>";
				});

				res.satuan.forEach((e) => {
					html_satuan +=
						'<option value="' +
						e.id_satuan +
						'"' +
						(e.id_satuan === id_satuan ? 'selected="selected"' : "") +
						">" +
						e.nama_satuan +
						"</option>";
				});
			}
			$("#id_produk").html(html_produk);
			$("#jenis_pesanan").html(html_jenis_pes);
			$("#id_satuan").html(html_satuan);
		},
	});
}

$("#produk_add").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "pembelian/save_produk",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#produk_add").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.message,
				});
				$("#modal_add_produk").modal("hide");
				clear_filter();
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

function load_produk_rencana(text) {
	$("#tbl_produk_ren").DataTable({
		ajax: {
			url: URL + "pembelian/load_data_produk",
			type: "POST",
			data: { text: text },
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
			{ data: "nama_produk" },
			{ data: "jumlah_produk" },
			{ data: "nama_satuan" },
			{ data: "stok" },

			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						`<button type="button" class="btn btn-danger btn-sm" onclick="hapus_pro('` +
						row.id_rencana_beli +
						`')"><i class="fa fa-trash"></i></button>`
					);
				},
			},
		],
	});
}

function hapus_pro(id) {
	$.ajax({
		url : URL +
		type :'POST',

	});
}

function filter_data() {
	var text = $("#filter_text").val();
	$("#tbl_produk_ren").DataTable().destroy();
	load_produk_rencana(text);
}

function clear_filter() {
	$("#tbl_produk_ren").DataTable().destroy();
	load_produk_rencana((text = ""));
	$("#jumlah_produk").val("");
	$("#harga_beli").val("");
	$("#keterangan").val("");
	load_select("pil", "pil", "pil");
}