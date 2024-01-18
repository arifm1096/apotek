$(document).ready(function () {
	filter_kadaluarsa();
	load_kadaluarsa((text = ""), (bulan = "pil"), (filter_tanggal = ""));
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function load_select_filter(p_rak, p_status) {
	var html_status = "<option value='pil'>-- Pilih Status --</option>";
	$.ajax({
		url: URL + "persediaan/get_status_ed",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				res.data.forEach((e) => {
					html_status +=
						'<option value="' +
						e.id_status_op_ed +
						'"' +
						(e.id_status_op_ed === p_rak ? 'selected="selected"' : "") +
						">" +
						e.nama_status +
						"</option>";
				});
			}
			$("#status_op_ed").html(html_status);
		},
	});
}

function filter_kadaluarsa(id) {
	var html_kadaluarsa = "<option value='pil'> Pilih Kondisi </option>";
	$.ajax({
		url: URL + "master/get_filter_kadaluarsa",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				res.kondisi.forEach((e) => {
					html_kadaluarsa +=
						'<option value="' +
						e.id_kadaluarsa +
						'"' +
						(e.id_kadaluarsa === id ? 'selected="selected"' : "") +
						">" +
						e.nama_kadaluarsa +
						"</option>";
				});
			}
			$("#kondisi_filter").html(html_kadaluarsa);
		},
	});
}

function load_kadaluarsa(text, bulan, filter_tanggal) {
	$("#tbl_kadaluarsa").DataTable({
		ajax: {
			url: URL + "persediaan/load_kadaluarsa",
			type: "POST",
			data: { text: text, bulan: bulan, filter_tanggal: filter_tanggal },
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
			{ data: "nama_supplier" },
			{ data: "nama_gudang" },
			{ data: "exp_date" },
			{ data: "jumlah_stok" },

			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						`<div class="row">
								<div class="col-md-12">
									<button type="button" class="btn btn-outline-success btn-sm" onclick="stok_produk('` +
						row.id_produk +
						`')">Opname</button>
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
	var bulan = $("#kondisi_filter").val();
	var filter_tanggal = $("#filter_tanggal").val();
	$("#tbl_kadaluarsa").DataTable().destroy();
	load_kadaluarsa(text, bulan, filter_tanggal);
}

function clear_filter() {
	$("#tbl_kadaluarsa").DataTable().destroy();
	load_kadaluarsa((text = ""), (bulan = "pil"), (filter_tanggal = ""));
	$("#filter_text").val("");
	$("#filter_tanggal").val("");
	filter_kadaluarsa("pil");
}

function stok_produk(id){
	$.ajax({
		url: URL + "persediaan/get_stok_opname_ed",
		type: "POST",
		data: {id:id},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$('#produk').html(res.data.nama_produk);
				$('#supplier').html(res.data.nama_supplier);
				$('#gudang').html(res.data.nama_gudang);
				$('#tgl_exp').html(res.data.exp_date);
				$('#qty_x').html(res.data.jumlah_stok);
				load_select_filter();
				$('#modal_so_ed').modal('show');
			}else{
				Swal.fire({
					icon: "warning",
					title: "Perhatian !!",
					text: res.msg,
				});
			}
		}
	})
}
