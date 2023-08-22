$(document).ready(function () {
	load_select_retur_add("pil", "pil");
	load_produk_rencana("");
	load_select_retur_head();
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function load_select_retur_add(id_produk, id_satuan) {
	var html_produk = "<option value='pil'>-- Pilih Produk --</option>";
	var html_satuan = "<option value='pil'>-- Pilih Patuan --</option>";
	$.ajax({
		url: URL + "pembelian/get_reture_select",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
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
			$("#id_satuan").html(html_satuan);
		},
	});
}

function load_select_retur_head(id_supplier, id_wilayah, no_sp, id_user) {
	var html_supplier = "<option value='pil'>-- Pilih Supplier --</option>";
	var html_gudang = "<option value='pil'>-- Pilih Gudang --</option>";
	var html_no_sp = "<option value='pil'>-- Pilih No. SP --</option>";
	var html_penerima = "<option value='pil'>-- Pilih Penerima --</option>";
	$.ajax({
		url: URL + "pembelian/get_reture_select",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				res.supplier.forEach((e) => {
					html_supplier +=
						'<option value="' +
						e.id_supplier +
						'"' +
						(e.id_supplier === id_supplier ? 'selected="selected"' : "") +
						">" +
						e.nama_supplier +
						"</option>";
				});

				res.gudang.forEach((e) => {
					html_gudang +=
						'<option value="' +
						e.id_wilayah +
						'"' +
						(e.id_wilayah === id_wilayah ? 'selected="selected"' : "") +
						">" +
						e.nama_wilayah +
						"</option>";
				});

				res.no_sp.forEach((e) => {
					html_no_sp +=
						'<option value="' +
						e.no_sp +
						'"' +
						(e.no_sp === no_sp ? 'selected="selected"' : "") +
						">" +
						e.no_sp +
						"</option>";
				});

				res.user.forEach((e) => {
					html_penerima +=
						'<option value="' +
						e.id_user +
						'"' +
						(e.id_user === id_user ? 'selected="selected"' : "") +
						">" +
						e.nama +
						"</option>";
				});
			}
			$("#id_supplier").html(html_supplier);
			$("#id_gudang").html(html_gudang);
			$("#no_sp").html(html_no_sp);
			$("#id_penerima").html(html_penerima);
		},
	});
}

function get_ksu_pro() {
	var id_produk = $("#id_produk").val();
	$.ajax({
		url: URL + "pembelian/get_ksu",
		type: "POST",
		data: { id_produk: id_produk },
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				$("#kode_ksu").val(res.result.kode);
			}
		},
	});
}

$("#retur_add").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "pembelian/save_produk_retur",
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
					text: res.msg,
				});
				$("#tbl_produk_ren").DataTable().destroy();
				load_produk_rencana("");
				clear_filter();
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
					text: res.msg,
				});
				$("#modal_add_produk").modal("hide");
				clear_filter_pro();
				$("#tbl_produk_ren").DataTable().destroy();
				load_produk_rencana("");
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

function load_produk_rencana(text) {
	$("#tbl_produk_re").DataTable({
		ajax: {
			url: URL + "pembelian/load_detail_retur",
			type: "POST",
			data: {},
		},
		processing: true,
		serverSide: true,
		serverMethod: "POST",
		columns: [
			{
				data: "id_produk",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},

			{ data: "nama_produk" },
			{ data: "kode_ksu" },
			{ data: "tgl_exp" },
			{ data: "harga" },
			{ data: "jumlah_produk_beli" },
			{ data: "jumlah_retur" },
			{ data: "keterangan" },
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
		url: URL + "pembelian/hapus_produk",
		type: "POST",
		data: { id: id },
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.msg,
				});
				$("#tbl_produk_ren").DataTable().destroy();
				load_produk_rencana(text);
			} else {
				Swal.fire({
					icon: "error",
					title: "Perhatian !!",
					text: res.msg,
				});
			}
		},
	});
}

function filter_data() {
	var text = $("#filter_text").val();
	$("#tbl_produk_ren").DataTable().destroy();
	load_produk_rencana(text);
}

function clear_filter() {
	$("#no_sp").val("");
	$("#tgl_pesan").val("");
	load_select_sup("pil");
}

function clear_filter_pro() {
	$("#tbl_produk_ren").DataTable().destroy();
	load_produk_rencana((text = ""));
	$("#jumlah_produk").val("");
	$("#harga_beli").val("");
	$("#keterangan").val("");
	load_select("pil", "pil", "pil");
}

function get_pesanan() {
	var arr_approve = [];
	var checkbox_checked_count = $("input[name='is_approve']:checked").length;

	if (checkbox_checked_count < 1) {
		Swal.fire({
			icon: "warning",
			title: "Perhatian...",
			text: "Pilih Approve Terlebih Dahulu",
		});
	} else {
		$.each($("input[name='is_approve']:checked"), function () {
			arr_approve.push($(this).val());
		});
		arr_approve.join(", ");
		$.ajax({
			url: URL + "Transaksi_gaji_jalan/update_approve",
			type: "POST",
			data: {
				id_tgaji_jalan: arr_approve,
			},
			success: function (data) {
				var res = JSON.parse(data);
			},
		});
	}
}
