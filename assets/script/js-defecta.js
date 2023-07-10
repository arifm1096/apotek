$(document).ready(function () {
	filter_data_defecta();
	load_defecta((text = ""), (jual = "pil"), (rak = "pil"));
	load_select_stok((p_supplier = "pil"), (p_satuan = "pil"));
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

function filter_data_defecta(id) {
	var html_kondisi = "<option value='pil'> Pilih Kondisi </option>";
	var html_gudang = "<option value='pil'> Pilih Gudang </option>";
	$.ajax({
		url: URL + "master/get_filter_defecta",
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

function add_data() {
	$("#modal_input_produk").modal("show");
}

function load_select_stok(p_supplier, p_satuan) {
	var html_supplier = "<option value='pil'>-- Pilih Supplier --</option>";
	var html_satuan = "<option value='pil'>-- Pilih Satuan --</option>";
	$.ajax({
		url: URL + "persediaan/get_data_master_persediaan",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				res.supplier.forEach((e) => {
					html_supplier +=
						'<option value="' +
						e.id_supplier +
						'"' +
						(e.id_supplier === p_supplier ? 'selected="selected"' : "") +
						">" +
						e.nama_supplier +
						"</option>";
				});

				res.satuan.forEach((e) => {
					html_satuan +=
						'<option value="' +
						e.id_satuan +
						'"' +
						(e.id_satuan === p_satuan ? 'selected="selected"' : "") +
						">" +
						e.nama_satuan +
						"</option>";
				});
			}
			$("#id_satuan_stok").html(html_satuan);
			$("#id_supplier_stok").html(html_supplier);
		},
	});
}

function load_defecta(text, jual, rak) {
	$("#tbl_defecta").DataTable({
		ajax: {
			url: URL + "persediaan/load_defecta",
			type: "POST",
			data: { text: text, status_jual: jual, id_rak: rak },
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
			{ data: "nama_sku_produk" },
			{ data: "jumlah_minimal" },
			{ data: "stok" },

			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						`<div class="row">
								<div class="col-md-12">
									<button type="button" class="btn btn-outline-success btn-sm" onclick="stok_produk('` +
						row.id_produk +
						"','" +
						row.id_stok +
						`')"><i class="fa fa-plus"></i> Beli</button>
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
	var jual = $("#filter_status_jual").val();
	var rak = $("#filter_rak").val();
	$("#tbl_defecta").DataTable().destroy();
	load_defecta((text = ""), (jual = "pil"), (rak = "pil"));
}

function clear_filter() {
	$("#tbl_defecta").DataTable().destroy();
	load_defecta((text = ""), (jual = "pil"), (rak = "pil"));
	$("#filter_text").val("");
	filter_data_defecta("pil", "pil");
}

function stok_produk(id_produk = null, id_stok = null) {
	$.ajax({
		url: URL + "persediaan/get_produk",
		type: "POST",
		data: { id_produk: id_produk, id_stok: id_stok },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#id_produk_stok").val(id_produk);
				$("#id_stok").val(id_stok);
				$("#nama_produk_stok").html(res.produk.nama_produk);
				$("#nama_gudang_stok").html(res.gudang.nama_gudang);
				$("#satuan_stok").html(res.produk.nama_satuan);
				load_select_stok((p_supplier = null), res.produk.satuan_utama);
				$("#modal_stok_produk").modal("show");
			} else {
				Swal.fire({
					icon: "error",
					title: "Perhatian !",
					text: res.msg,
				});
			}
		},
	});
}

function save_stok_produk() {
	var id_produk = $("#id_produk_stok").val();
	var id_stok = $("#id_stok").val();
	var jumlah = $("#jumlah_stok").val();
	var exp_date = $("#exp_date").val();
	var id_satuan = $("#id_satuan_stok").val();
	var supplier = $("#id_supplier_stok").val();
	var harga_beli = $("#harga_beli").val();

	$.ajax({
		url: URL + "persediaan/save_stok_produk",
		type: "POST",
		data: {
			id_produk: id_produk,
			id_stok: id_stok,
			jumlah: jumlah,
			exp_date: exp_date,
			id_satuan: id_satuan,
			supplier: supplier,
			harga_beli: harga_beli,
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Berhasil Input Data",
					text: res.msg,
				});
				$("#modal_stok_produk").modal("hide");
				$("#tbl_defecta").DataTable().destroy();
				load_defecta((text = ""), (jual = "pil"), (rak = "pil"));
			} else {
				Swal.fire({
					icon: "error",
					title: "Perhatian !",
					text: res.msg,
				});
				$("#tbl_defecta").DataTable().destroy();
				load_defecta((text = ""), (jual = "pil"), (rak = "pil"));
			}
		},
	});
}

// $("#modal_stok_produk").on("hide.bs.modal", function () {
// 	load_select_stok((p_supplier = "pil"), (p_satuan = "pil"));
// 	$("#id_produk_stok").val("");
// 	$("#id_stok").val("");
// 	$("#jumlah_stok").val("");
// 	$("#harga_beli").val("");
// 	$("#exp_date").val("");
// });
