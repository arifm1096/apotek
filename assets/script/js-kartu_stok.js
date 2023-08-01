$(document).ready(function () {
	tahun();
	load_stok(
		(id_produk = $("id_produk").val()),
		(bulan = "pil"),
		(tahun = ""),
		(id_gudang = "pil"),
		(kode_batch = "")
	);
	$("#loading").hide();
});

$(".thn_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "yyyy",
	showButtonPanel: true,
	viewMode: "years",
	minViewMode: "years",
});
//Initialize Select2 Elements
$(".select2").select2();

function tahun(id) {
	var html_bulan = "<option value='pil'> Pilih Bulan </option>";
	var html_gudang = "<option value='pil'> Pilih Gudang </option>";
	$.ajax({
		url: URL + "master/get_filter_stok",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == "1") {
				res.result.forEach((e) => {
					html_bulan +=
						'<option value="' +
						e.id_bulan +
						'"' +
						(e.id_bulan === id ? 'selected="selected"' : "") +
						">" +
						e.nama_bulan +
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
			$("#bulan_filter").html(html_bulan);
		},
	});
}

function load_stok(id_produk, bulan, tahun, id_gudang, kode_batch) {
	var html = "";
	var id_produk = $("#id_produk").val();
	$.ajax({
		url: URL + "persediaan/get_kartu_stok",
		type: "POST",
		data: {
			bulan: bulan,
			tahun: tahun,
			id_gudang: id_gudang,
			kode_batch: kode_batch,
			id_produk: id_produk,
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				var no = 1;
				var sisa = 0;
				let masuk_tot = 0;
				let keluar_tot = 0;
				res.data.forEach((e) => {
					masuk_tot = e.masuk;
					keluar_tot = e.keluar;
					sisa += masuk_tot - keluar_tot;
					html +=
						"<tr>" +
						"<td>" +
						no +
						"</td>" +
						"<td>" +
						e.tgl +
						"</td>" +
						"<td>" +
						e.catat +
						"</td>" +
						"<td>" +
						e.sku_kode_produk +
						"</td>" +
						"<td>" +
						e.exp_date +
						"</td>" +
						"<td>" +
						e.petugas +
						"</td>" +
						"<td>" +
						e.masuk +
						"</td>" +
						"<td>" +
						e.keluar +
						"</td>" +
						"<td>" +
						sisa +
						"</td>" +
						"</tr>";
					no++;
				});
			}
			$("#tbl_kartu_stok").html(html);
		},
	});
}
