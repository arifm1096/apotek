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
				$("#produk_barcode").val("");
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
			$("#str_sub_tot").val(sub_tot);
			$("#list_kasir").html(html);
			total_harga();
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
				$("#str_sub_tot").val(res.sub_tot);
				$("#total_" + id).val(formatRupiah(res.result.total_harga, "Rp. "));
				$("#harga_" + id).val(formatRupiah(res.result.harga_jual, "Rp. "));
				total_harga();
			} else {
				load_kasir();
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

	if (ribuan) {
		separator = sisa ? "." : "";
		rupiah += separator + ribuan.join(".");
	}

	rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
	return prefix == undefined ? rupiah : rupiah ? "Rp. " + rupiah : "";
}

const rupiah = (number) => {
	return new Intl.NumberFormat("id-ID", {
		style: "currency",
		currency: "IDR",
	}).format(number);
};

function total_harga() {
	var sub = $("#str_sub_tot").val();
	var ser = $("#service").val();
	var emb = $("#embalase").val();
	var lai = $("#lain").val();
	var id = $("#id_kasir").val();

	var sub1 = parseInt(sub.replaceAll(".", ""));
	var ser1 = parseInt(ser.replaceAll(".", ""));
	var emb1 = parseInt(emb.replaceAll(".", ""));
	var lai1 = parseInt(lai.replaceAll(".", ""));

	let tot = sub1 + ser1 + emb1 + lai1;
	// if (tot !== "") {
	let for_tot = rupiah(tot);
	// }

	$("#str_tot").html(for_tot);
	$("#total").val(tot);
	$("#total_pem").html(for_tot);
}

function bayar() {
	$("#jumlah_uang").focus();
	$("#modal_bayar_kasir").modal({ backdrop: "static", keyboard: false });
}

function selisih() {
	var tot = $("#total").val();
	var jumlah_uang = $("#jumlah_uang").val();
	var tot1 = parseInt(tot.replaceAll(".", ""));
	var jum1 = parseInt(jumlah_uang.replaceAll(".", ""));
	kem = jum1 - tot1;
	$("#kembalian").val(kem);
	$("#str_kembalian").val(rupiah(kem));
}

function add_kasir() {
	var sub = $("#str_sub_tot").val();
	var ser = $("#service").val();
	var emb = $("#embalase").val();
	var lai = $("#lain").val();
	var kembalian = $("#kembalian").val();
	var tot = $("#total").val();
	var jumlah_uang = $("#jumlah_uang").val();
	$("#save-button").hide();
	$("#send-button").show();
	$.ajax({
		url: URL + "penjualan/get_add_kasir",
		type: "POST",
		data: {
			sub: sub,
			ser: ser,
			emb: emb,
			lai: lai,
			tot: tot,
			kembalian: kembalian,
			jumlah_uang: jumlah_uang,
		},
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				$("#id_kasir").val(res.id);
				$("#save-button").show();
				$("#send-button").hide();
				Swal.fire({
					title: "<strong><u>Data Tersimpan</u></strong>",
					icon: "success",
					html: res.msg,
				});
			} else {
				$("#save-button").show();
				$("#send-button").hide();
				Swal.fire({
					title: "<strong><u>Perhatian !!/u></strong>",
					icon: "error",
					html: res.msg,
				});
			}
		},
	});
}
