$(document).ready(function () {
	load_select("pil", "pil", "pil");
	load_produk_rencana("");
	load_select_sup();
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function get_ppn() {
	var nom = $("#harga_beli").val();
	var ppn = (nom * 11) / 100;

	$("#ppn").val(ppn);
}

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

function load_select_sup() {
	var html_sup = "<option value='pil'> -- Pilih Supplier -- </option>";
	$.ajax({
		url: URL + "pembelian/get_produk_buat_pesan",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				res.data.forEach((e) => {
					html_sup +=
						'<option value="' +
						e.id_supplier +
						'"' +
						(e.id_supplier === id_supplier ? 'selected="selected"' : "") +
						">" +
						e.nama_supplier +
						"</option>";
				});
			}
			$("#id_supplier").html(html_sup);
		},
	});
}

$("#add_pesanan").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "pembelian/save_pesanan",
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
	$("#tbl_produk_ren").DataTable({
		ajax: {
			url: URL + "pembelian/load_data_pesan",
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
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					var id_el = `add_prod_` + row.id_rencana_beli;
					return `<h6>` + row.nama_produk + `</h6>`;
				},
			},

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
