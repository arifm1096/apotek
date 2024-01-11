$(document).ready(function () {
	// filter_data_penjualan();
	loda_konsinyasi((text = ""), (tgl = ""));
	$("#loading").hide();
	$(".uang").mask("000.000.000.000", { reverse: true });
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function filter_data_penjualan(id) {
	var html_kondisi = "<option value='pil'> Pilih Kondisi </option>";
	var html_gudang = "<option value='pil'> Pilih Gudang </option>";
	$.ajax({
		url: URL + "master/get_filter_penjualan",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				res.kondisi.forEach((e) => {
					html_kondisi +=
						'<option value="' +
						e.id_kondisi +
						'"' +
						(e.id_kondisi === id ? 'selected="selected"' : "") +
						">" +
						e.nama_kondisi +
						"</option>";
				});

				res.gudang.forEach((e) => {
					html_gudang +=
						'<option value="' +
						e.id_gudang +
						'"' +
						(e.id_gudang === id ? 'selected="selected"' : "") +
						">" +
						e.nama_gudang +
						"</option>";
				});
			}
			$("#gudang_filter").html(html_gudang);
			$("#kondisi_filter").html(html_kondisi);
		},
	});
}

function add_data_retur() {
	window.location.href = URL + "konsinyasi/konsinyasi_buat";
}

const rupiah = (number) => {
	return new Intl.NumberFormat("id-ID", {
		style: "currency",
		currency: "IDR",
	}).format(number);
};

function loda_konsinyasi(text, tgl1, tgl2) {
	$("#tbl_konsinyasi").DataTable({
		ajax: {
			url: URL + "konsinyasi/load_status_konsinyasi",
			type: "POST",
			data: { text: text, tgl1: tgl1, tgl2: tgl2 },
		},
		processing: true,
		serverSide: true,
		searching: false,
		order: [[1, "desc"]],
		serverMethod: "POST",
		columns: [
			{
				data: "id_retur",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},
			{ data: "no_faktur" },
			{ data: "nama_supplier" },
			{ data: "produk" },
			{ data: "jumlah_konsinyasi_p" },
			{
				data: "nom_harga_pokok",
				render: $.fn.dataTable.render.number(".", ".", 0),
			},
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						`<div class="row">
								<div class="col-md-12">
									<button type="button" class="btn btn-outline-info btn-sm" onclick="bayar_konsiyasi('` +
						row.id_konsinyasi +
						`')">BAYAR</button>
						<button type="button" class="btn btn-outline-danger btn-sm ml-1" onclick="retur_konsiyasi('` +
						row.id_konsinyasi +
						`')">RETURE</i></button>
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
	$("#tbl_konsinyasi").DataTable().destroy();
	loda_konsinyasi(text, tgl1, tgl2);
}

function clear_filter() {
	$("#tbl_konsinyasi").DataTable().destroy();
	loda_konsinyasi((text = ""), (tgl = ""));
	$("#filter_text").val("");
	$("#tanggal1").val("");
	$("#tanggal2").val("");
}

function edit_ret(id) {
	window.location.href = URL + "konsinyasi/edit_konsinyasi/" + id;
}

function export_excel() {
	var text = $("#filter_text").val();
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	window.open(
		URL +
			"penjualan/export_data_penjualan?tgl1=" +
			tgl1 +
			"&tgl2=" +
			tgl2 +
			"&text=" +
			text,
		"_blank"
	);
}

function retur_konsiyasi(id_konsinyasi) {
	$("#modal_retur").modal("hide");
	$.ajax({
		url: URL + "konsinyasi/get_data_konsiyasi",
		type: "POST",
		data: { id_konsinyasi: id_konsinyasi },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#list_konsinyasi_detail").html(res.detail_konsiyasi);
				$("#no_faktur").html(res.konsinyasi.no_faktur);
				$("#penitip").html(res.konsinyasi.nama_supplier);
				$("#modal_retur").modal("show");
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

function retur(id, id_konsinyasi) {
	var tgl_retur = $("#tgl_retur").val();

	if (tgl_retur !== "") {
		$.ajax({
			url: URL + "konsinyasi/retur_konsiyasi",
			type: "POST",
			data: { id: id, tgl_retur: tgl_retur },
			success: function (data) {
				var res = JSON.parse(data);
				if (res.status == 1) {
					Swal.fire({
						icon: "success",
						title: "Success",
						text: res.msg,
					});
					retur_konsiyasi(id_konsinyasi);
					$("#tbl_konsinyasi").DataTable().destroy();
					loda_konsinyasi((text = ""), (tgl = ""));
				} else {
					Swal.fire({
						icon: "error",
						title: "Perhatian",
						text: res.msg,
					});
				}
			},
		});
	} else {
		Swal.fire({
			icon: "error",
			title: "Perhatian",
			text: "Ketik Tgl Retur Terlebih Dahulu",
		});
	}
}

function select_trans_keu(p_akun) {
	var html1 = "<option value='pil'> Pilih Akun </option>";

	$.ajax({
		type: "POST",
		url: URL + "master/get_akun",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				res.result.forEach((e) => {
					html1 +=
						'<option value="' +
						e.id_akun +
						'"' +
						(e.id_akun === p_akun ? 'selected="selected"' : "") +
						">" +
						e.kd_akun +
						" - " +
						e.nama_akun +
						"</option>";
				});
			}
			$("#id_akun").html(html1);
		},
	});
}

function bayar_konsiyasi(id_konsinyasi) {
	$.ajax({
		url: URL + "konsinyasi/get_data_konsinyasi_det",
		type: "POST",
		data: { id_konsinyasi: id_konsinyasi },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#no_faktur_ls").html(res.konsinyasi.no_faktur);
				$("#supplier_ls").html(res.konsinyasi.nama_supplier);
				$("#produk_ls").html(res.detail);
				$("#id_konsinyasi").val(res.konsinyasi.id_konsinyasi);
				select_trans_keu();
				$("#modal_bayar").modal("show");
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

function clear_data() {
	$("#tgl_trans").val();
	$("#nominal").val();
	$("#ket").val();
}

$("#add_bayar").submit(function (e) {
	e.preventDefault();
	$("#save-button").html("Sending...");
	$.ajax({
		url: URL + "konsinyasi/bayar_konsiyasi",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_bayar").find("span.error-text").text();
		},
		success: function (data) {
			$("#save-button").html("Simpan");
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.message,
				});
				filter_data();
				clear_data();
				$("#modal_bayar").modal("hide");
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
