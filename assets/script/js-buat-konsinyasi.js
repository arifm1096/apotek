$(document).ready(function () {
	load_edit_konsinyasi();
	load_select_konsinyasi_add("pil", "pil");
	load_produk_konsinyasi();
	// load_select_konsinyasi_head();
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});

//Initialize Select2 Elements
$(".select2").select2();

function load_edit_konsinyasi() {
	var id = $("#id_konsinyasi").val();
	if (id !== "") {
		$.ajax({
			type: "POST",
			url: URL + "konsinyasi/get_data_konsinyasi",
			data: { id: id },
			success: function (data) {
				var res = JSON.parse(data);
				if (res.status == 1) {
					load_select_konsinyasi_head(
						res.result.id_supplier,
						res.result.id_gudang,
						res.result.id_kas,
						res.result.jenis_pembayaran,
						res.result.metode_pembayaran
					);
					$("#no_faktur").val(res.result.no_faktur);
					$("#no_sp").val(res.result.no_sp);
					$("#tgl_terima").val(res.result.tgl_terima);
					$("#tgl_faktur").val(res.result.tgl_faktur);
					$("#jatuh_tempo").val(res.result.jatuh_tempo);
				} else {
					load_select_konsinyasi_head();
				}
			},
		});
	}
}

function load_select_konsinyasi_add(id_produk, id_satuan) {
	var html_produk = "<option value='pil'>-- Pilih Produk --</option>";
	var html_satuan = "<option value='pil'>-- Pilih Patuan --</option>";
	$.ajax({
		url: URL + "konsinyasi/get_konsinyasi_select",
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

function load_select_konsinyasi_head(
	id_supplier,
	id_gudang,
	id_kas,
	id_pembayaran
) {
	var html_supplier = "<option value='pil'>-- Pilih Supplier --</option>";
	var html_gudang = "<option value='pil'>-- Pilih Gudang --</option>";
	var html_kas = "<option value='pil'>-- Pilih KAS --</option>";
	var html_pembayaran = "<option value='pil'>-- Pilih Pembayaran --</option>";
	$.ajax({
		url: URL + "konsinyasi/get_konsinyasi_select",
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
						(e.id_wilayah === id_gudang ? 'selected="selected"' : "") +
						">" +
						e.nama_wilayah +
						"</option>";
				});

				res.kas.forEach((e) => {
					html_kas +=
						'<option value="' +
						e.id_kas +
						'"' +
						(e.id_kas === id_kas ? 'selected="selected"' : "") +
						">" +
						e.nama_kas +
						"</option>";
				});

				res.jenis_pembayaran.forEach((e) => {
					html_pembayaran +=
						'<option value="' +
						e.id_pembayaran +
						'"' +
						(e.id_pembayaran === id_pembayaran ? 'selected="selected"' : "") +
						">" +
						e.nama_pembayaran +
						"</option>";
				});
			}
			$("#id_supplier").html(html_supplier);
			$("#id_gudang").html(html_gudang);
			$("#id_kas").html(html_kas);
			$("#jenis_pembayaran").html(html_pembayaran);
		},
	});
}

function get_ksu_pro() {
	var id_produk = $("#id_produk").val();
	$.ajax({
		url: URL + "konsinyasi/get_ksu",
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

$("#kons_add").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "konsinyasi/save_produk_konsinyasi",
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
				$("#tbl_produk_re").DataTable().destroy();
				load_produk_konsinyasi();
				$("#modal_add_produk_kons").modal("hide");
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

$("#kons_submit").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "konsinyasi/save_konsinyasi",
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
				// $("#modal_add_produk").modal("hide");
				// clear_filter_pro();
				// $("#tbl_produk_ren").DataTable().destroy();
				// load_produk_konsinyasi("");
				window.location.href = URL+'konsinyasi/data_konsinyasi';
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

function load_produk_konsinyasi() {
	var id = $("#id_konsinyasi").val();
	$("#tbl_produk_re").DataTable({
		ajax: {
			url: URL + "konsinyasi/load_detail_konsinyasi",
			type: "POST",
			data: { id: id },
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
			{ data: "jumlah_konsinyasi" },
			{ data: "nama_satuan" },
			{ data: "harga_beli" , render: $.fn.dataTable.render.number(".", ".", 0)},
			{ data: "ppn" , render: $.fn.dataTable.render.number(".", ".", 0)},
			{ data: "harga_pokok" , render: $.fn.dataTable.render.number(".", ".", 0)},
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						`<button type="button" class="btn btn-warning btn-sm mr-1" onclick="edit_kons('` +
						row.id_konsinyasi_detail +
						`','` +
						row.tgl_exp +
						`','` +
						row.kode_ksu +
						`','` +
						row.jumlah_konsinyasi +
						`','` +
						row.harga_beli +
						`','` +
						row.harga_pokok +
						`','` +
						row.ppn +
						`','` +
						row.id_produk +
						`','` +
						row.id_satuan +
						`')"><i class="fa fa-pencil-alt"></i></button> 
						<button type="button" class="btn btn-danger btn-sm" onclick="hapus_ren('` +
						row.id_konsinyasi_detail +
						`')"><i class="fa fa-trash"></i></button>
						`
					);
				},
			},
		],
	});
}

function hapus_ren(id) {
	$.ajax({
		url: URL + "konsinyasi/hapus_detail_konsinyasi",
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
				$("#tbl_produk_re").DataTable().destroy();
				load_produk_konsinyasi();
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

function edit_kons(
	id,
	tgl_exp,
	kode,
	jum,
	h_bel,
	h_pok,
	ppn,
	id_p,
	id_s
) {
	$("#id_konsinyasi_detail").val(id);
	$("#tgl_exp").val(tgl_exp);
	$("#kode_ksu").val(kode);
	$("#jumlah_konsinyasi").val(jum);
	$("#harga_beli").val(h_bel);
	$("#harga_pokok").val(h_pok);
	$("#ppn").val(ppn);
	load_select_konsinyasi_add(id_p, id_s);
	$("#modal_add_produk_kons").modal("show");
}

function filter_data() {
	var text = $("#filter_text").val();
	$("#tbl_produk_ren").DataTable().destroy();
	load_produk_konsinyasi(text);
}

function clear_filter() {
	$("#id_detail_konsinyasi").val("");
	$("#harga").val("");
	$("#tgl_exp").val("");
	$("#tgl_pesan").val("");
	$("#kode_ksu").val("");
	$("#jumlah_produk_beli").val("");
	$("#jumlah_konsinyasi").val("");
	$("#keterangan").val("");
	load_select_konsinyasi_add("pil", "pil");
}

function clear_filter_pro() {
	$("#tbl_produk_ren").DataTable().destroy();
	load_produk_konsinyasi();
	$("#jumlah_produk").val("");
	$("#harga_beli").val("");
	$("#keterangan").val("");
	load_select_konsinyasi_add("pil", "pil");
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

function close_kon(){
	
	$("#modal_add_produk_kons").modal('hide');
	$("#jumlah_produk").val("");
	$("#harga_beli").val("");
	$("#keterangan").val("");
	$("#kode_ksu").val("");
	$("#tgl_exp").val("");
	$("#jumlah_konsinyasi").val("");
	$("#harga_pokok").val("");
	load_select_konsinyasi_add("pil", "pil");

}

function get_ppn(){
	var nom = $('#harga_beli').val();
	var ppn = nom * 11 / 100;

	$("#ppn").val(ppn);
}
