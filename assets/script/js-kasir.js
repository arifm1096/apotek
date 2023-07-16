$(document).ready(function () {
	$(".navbar-collapse").collapse("hide");
	load_kasir();
	$(".uang").mask("000.000.000", { reverse: true });
});

$("#produk_barcode").on("input", function () {
	var param = $("#produk_barcode").val();
	$.ajax({
		url: URL + "penjualan/get_produk_barcode",
		type: "POST",
		data: { param: param },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#produk_barcode").autocomplete({
					source: res.result,
					autoFocus: true,
				});
			}
		},
	});
});

$("#add_produk").submit(function (e) {
	e.preventDefault();
	$.ajax({
		url: URL + "penjualan/get_add_produk",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				load_kasir();
			}
		},
	});
});
//Initialize Select2 Elements
$(".select2").select2();

function load_select(p_id, p_jenis_harga, p_satuan) {
	var html_harga = "<option value='pil'>-- Pilih Jenis Harga--</option>";
	var html_satuan = "<option value='pil'>-- Pilih Satuan --</option>";
	$.ajax({
		url: URL + "penjualan/get_satuan",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				res.harga.forEach((e) => {
					html_harga +=
						'<option value="' +
						e.id_jenis_harga +
						'"' +
						(e.id_jenis_harga === p_jenis_harga ? 'selected="selected"' : "") +
						">" +
						e.nama_jenis_harga +
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

			$("#satuan_" + p_id).html(html_satuan);
			$("#jenis_harga_" + p_id).html(html_harga);
		},
	});
}

function load_kasir() {
	var html = "";
	var sub_tot = "";
	$.ajax({
		url: URL + "penjualan/load_data_produk",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			var no = 1;
			if (res.status == 1) {
				sub_tot += res.sub_tot;
				res.result.forEach((e) => {
					load_select(e.id_jual, e.id_jenis_harga, e.id_satuan);
					html +=
						`<tr id="row_` +
						e.id_jual +
						`">
                                    <td style="width: 10px; text-align: right;">` +
						no +
						`</td>
                                    <td>` +
						e.nama_produk +
						`
                                        <button type="button" class="btn btn-danger btn-xs float-right"
                                            onclick="hapus_list(` +
						e.id_jual +
						`);"><i class="fa fa-trash"
                                                aria-hidden="true"></i></button>
                                    </td>
                                    <td style="width: 100px; "><input type="number" class="form-control"
                                            name="jumlah_produk" value="` +
						e.qty +
						`" id="jumlah_produk_` +
						e.id_jual +
						`" onchange="get_nom(` +
						e.id_jual +
						`,1,this.value)"> </td>
                                    <td>
                                        <select class="form-control" id="satuan_` +
						e.id_jual +
						`"  onchange="get_nom(` +
						e.id_jual +
						`,2,this.value)">
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control" id="jenis_harga_` +
						e.id_jual +
						`"  onchange="get_nom(` +
						e.id_jual +
						`,3,this.value)">
                                        </select>
                                    </td>
                                    <td style="width: 100px; ">
                                        <input type="text" class="form-control" name="harga" value="` +
						formatRupiah(e.harga_jual, "Rp. ") +
						`" id="harga_` +
						e.id_jual +
						`">
                                    </td>
                                    <td style="width: 130px; ">
                                        <input type="text" class="form-control" name="total" value="` +
						formatRupiah(e.total_harga, "Rp. ") +
						`" id="total_` +
						e.id_jual +
						`" readonly>
                                    </td>
                            </tr>`;
					no++;
				});
			}
			$("#sub_tot").val(formatRupiah(sub_tot, "Rp. "));
			$("#list_kasir").html(html);
			total();
		},
	});
}

function hapus_list(id) {
	$.ajax({
		url: URL + "penjualan/hapus_produk_kasir",
		type: "POST",
		data: { id: id },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				load_kasir();
				total();
				Swal.fire({
					icon: "success",
					title: "Berhasil",
					text: res.msg,
				});
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

function get_nom(id, el, val) {
	$.ajax({
		url: URL + "penjualan/get_nom_change",
		type: "POST",
		data: { id: id, el: el, val: val },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#sub_tot").val(formatRupiah(res.sub_tot, "Rp. "));
				$("#total_" + id).val(formatRupiah(res.result.total_harga, "Rp. "));
				$("#harga_" + id).val(formatRupiah(res.result.harga_jual, "Rp. "));
			} else {
				load_kasir();
				total();
				Swal.fire({
					icon: "error",
					title: "Perhatian !!!",
					text: res.msg,
				});
			}
		},
	});
}

function formatRupiah(angka, prefix) {
	var number_string = angka.replace(/[^,\d]/g, "").toString(),
		split = number_string.split(","),
		sisa = split[0].length % 3,
		rupiah = split[0].substr(0, sisa),
		ribuan = split[0].substr(sisa).match(/\d{3}/gi);

	// tambahkan titik jika yang di input sudah menjadi angka ribuan
	if (ribuan) {
		separator = sisa ? "." : "";
		rupiah += separator + ribuan.join(".");
	}

	rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
	return prefix == undefined ? rupiah : rupiah ? "Rp. " + rupiah : "";
}

function total() {
	var sub = $("#sub_tot").val();
	var ser = $("#service").val();
	var emb = $("#embalase").val();
	var lai = $("#lain").val();

	var sub_1 = sub.replace(".", "");
	var sub_tot = sub_1.replace("Rp. ", "");
	var ser1 = ser.replace(".", "");
	var emb1 = emb.replace(".", "");
	var lai1 = lai.replace(".", "");

	let tot = parseInt(ser1) + parseInt(emb1) + parseInt(lai1);
	console.log(tot);
	// $("#total").val(tot);
	$("#str_tot").html(formatRupiah(tot, "Rp. "));
}

$(".uang").on("input", function () {
	total();
});
