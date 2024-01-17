$(document).ready(function () {
	load_pesanan("","","","pil");
	status_terima("pil");
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function status_terima(p_status) {
	var html = "<option value='pil'> Pilih Status </option>";
	var data = [
		{
			id: "1",
			title: "Sudah Diterima",
		},
		{
			id: "0",
			title: "Belum Diterima",
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
	$("#status_terima").html(html);
}

function load_pesanan(text, tgl_awal, tgl_akhir, status) {
	$("#tbl_pesanan").DataTable({
		ajax: {
			url: URL + "pembelian/load_data_pesan_beli",
			type: "POST",
			data: { text: text, tgl_awal: tgl_awal, tgl_akhir: tgl_akhir, status:status },
		},
		processing: true,
		serverSide: true,
		searching: false,
		order: [[1, "desc"]],
		serverMethod: "POST",
		columns: [
			{
				data: "id_produk",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},

			{ data: "tgl" },
			{ data: "no_sp" },
			{ data: "nama_produk" },
			{ data: "jumlah_produk" },
			{ data: "jumlah_diterima" },
			{ data: "nama_satuan" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					if (row.status_terima == 1) {
						return '<span class="badge bg-success">Diterima</span>';
					} else {
						return '<span class="badge bg-warning">Belum DIterima</span>';
					}
				},
			},
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					var btn_str = "";
					if (row.status_terima == 0) {
						btn_str +=
							`<button type="button" class="btn btn-outline-primary btn-sm" onclick="get_terima('` +
							row.id_rencana_beli +
							`','` +
							row.nama_produk +
							`','` +
							row.jumlah_produk +
							`','` +
							row.nama_satuan +
							`','` +
							row.tgl +
							`')">DIterima</button>`;
					} else {
						btn_str +=
							`<button type="button" class="btn btn-outline-primary btn-sm disabled" onclick="get_terima('` +
							row.id_rencana_beli +
							`','` +
							row.nama_produk +
							`','` +
							row.jumlah_produk +
							`','` +
							row.nama_satuan +
							`','` +
							row.tgl +
							`')">DIterima</button>`;
					}
					return (
						btn_str +
						`&nbsp
						<button type="button" class="btn btn-danger btn-sm" onclick="hapus_pro('` +
						row.id_rencana_beli +
						`,` +
						row.nama_produk +
						`,` +
						row.jumlah_produk +
						`,` +
						row.nama_satuan +
						`,` +
						row.tgl +
						`')"><i class="fa fa-trash"></i></button>`
					);
				},
			},
		],
	});
}

function filter_data() {
	var text = $("#filter_text").val();
	var status = $("#status_terima").val();
	var tgl_awal = $("#tgl_awal").val();
	var tgl_akhir = $("#tgl_akhir").val();
	$("#tbl_pesanan").DataTable().destroy();
	load_pesanan(text, tgl_awal, tgl_akhir, status);
}

function clear_filter() {
	$("#tbl_pesanan").DataTable().destroy();
	load_pesanan((text = ""));
	$("#jumlah_produk").val("");
	$("#harga_beli").val("");
	$("#keterangan").val("");
	load_select("pil", "pil", "pil");
}

function get_pesanan() {
	window.open(URL + "pembelian/buat_pesanan");
}

function get_terima(id, produk, qty, satuan, tgl) {
	$.ajax({
		type: "POST",
		url: URL + "pembelian/cek_terima_pesan",
		data: { id: id },
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				$("#v-produk").html(produk);
				$("#v-qty").html(qty);
				$("#v-satuan").html(satuan);
				$("#id").val(id);
				$("#modal_terima_barang").modal("show");
			} else {
				Swal.fire({
					icon: "error",
					title: "Perhatian",
					text: res.msg,
				});
			}
		},
	});
}

function close_terima() {
	$("#jumlah_terima").val("");
	$("#modal_terima_barang").modal("hide");
}

$("#pesan_diterima").submit(function (e) {
	e.preventDefault();
	$("#save-button").html("Sending...");
	$.ajax({
		url: URL + "pembelian/get_terima_pesan",
		type: "POST",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#pesan_diterima").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.msg,
				});
				filter_data();
				close_terima();
			} else {
				Swal.fire({
					icon: "error",
					title: "Perhatian",
					text: res.msg,
				});
			}
		},
	});
});

function get_terimaa(id, produk, qty, satuan, tgl) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Sudah Terima..?</b> <br> Nama Produk  : " +
			produk +
			"<br> " +
			"Qty : " +
			qty +
			" " +
			satuan +
			"<br> " +
			"Tgl. Pesan : " +
			tgl,
		icon: "info",
		showCancelButton: true,
		confirmButtonColor: "#30d63e",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Terima",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				type: "POST",
				url: URL + "pembelian/get_terima_pesan",
				data: { id: id },
				success: function (data) {
					var res = JSON.parse(data);

					if (res.status == 1) {
						Swal.fire({
							icon: "success",
							title: "Success",
							text: res.msg,
						});
						$("#tbl_pesanan").DataTable().destroy();
						load_pesanan(text);
					} else {
						Swal.fire({
							icon: "error",
							title: "Perhatian",
							text: res.msg,
						});
					}
				},
			});
		}
	});
}

function hapus_pro(id) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Hapus Data..?</b> <br> Nama Produk  : " +
			produk +
			"<br> " +
			"Qty : " +
			qty +
			" " +
			satuan +
			"<br> " +
			"Tgl. Pesan : " +
			tgl,
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Hapus Data",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				type: "POST",
				url: URL + "pembelian/get_terima_pesan",
				data: { id: id },
				success: function (data) {
					var res = JSON.parse(data);

					if (res.status == 1) {
						Swal.fire({
							icon: "success",
							title: "Success",
							text: res.msg,
						});
						$("#tbl_pesanan").DataTable().destroy();
						load_pesanan(text);
					} else {
						Swal.fire({
							icon: "error",
							title: "Perhatian",
							text: res.msg,
						});
					}
				},
			});
		}
	});
}

function export_pdf() {
	var text = $("#filter_text").val();
	var status = $("#status_terima").val();
	var tgl_awal = $("#tgl_awal").val();
	var tgl_akhir = $("#tgl_akhir").val();
	window.open(
		URL + "pembelian/export_pdf_data_pesan?text=" + text+ "&status=" + status+ "&tgl_awal=" + tgl_awal+ "&tgl_akhir=" + tgl_akhir,
		"_blank"
	);
}

function export_excel() {
	var text = $("#filter_text").val();
	var status = $("#status_terima").val();
	var tgl_awal = $("#tgl_awal").val();
	var tgl_akhir = $("#tgl_akhir").val();
	window.open(
		URL + "pembelian/export_excel_data_pesan?text=" + text+ "&status=" + status+ "&tgl_awal=" + tgl_awal+ "&tgl_akhir=" + tgl_akhir,
		"_blank"
	);
}
