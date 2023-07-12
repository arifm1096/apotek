$(document).ready(function () {
	filter_so();
	load_so((text = ""), (id_rak = "pil"));
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function filter_so(id) {
	var html = "<option value='pil'> Pilih Rak </option>";
	$.ajax({
		url: URL + "master/get_filter_so",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				res.rak.forEach((e) => {
					html +=
						'<option value="' +
						e.id_rak +
						'"' +
						(e.id_rak === id ? 'selected="selected"' : "") +
						">" +
						e.nama_rak +
						"</option>";
				});
			}
			$("#filter_rak").html(html);
		},
	});
}

function load_so(text, id_rak) {
	$("#tbl_so").DataTable({
		ajax: {
			url: URL + "persediaan/load_stok_opname",
			type: "POST",
			data: { text: text, id_rak: id_rak },
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
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return row.nama_produk + "<br> SKU : " + row.sku_kode_produk;
				},
			},
			{ data: "jumlah_stok" },
			{ data: "nama_rak" },
			{ data: "status_so" },

			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						`<div class="row">
								<div class="col-md-12">
									<button type="button" class="btn btn-outline-success btn-sm" onclick="stok_opname('` +
						row.id_stok +
						`')">Opname Sekarang</button>
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
	var id_rak = $("#filter_rak").val();
	$("#tbl_so").DataTable().destroy();
	load_so(text, id_rak);
}

function clear_filter() {
	$("#tbl_so").DataTable().destroy();
	load_so(text, id_rak);
	$("#filter_text").val("");
	filter_so("pil");
}

function stok_opname(id_stok) {
	$.ajax({
		url: URL + "persediaan/get_stok_opname",
		type: "POST",
		data: { id_stok: id_stok },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#nama_obat").html(res.result.nama_produk);
				$("#id_stok").html(res.result.id_produk);
				$("#nama_gudang").val(res.result.nama_gudang);
				$("#exp_date").val(res.result.exp_date);
				$("#catatan").val(res.result.catatan);
				$("#jumlah_stok").val(res.result.stok_sistem);
				$("#stok_fisik").val(res.result.stok_fisik);
				$("#penyesuaian").val(res.result.penyesuaian);
				$("#modal_stok_opname").modal("show");
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
