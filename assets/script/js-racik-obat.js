$(document).ready(function () {
	$(".navbar-collapse").collapse("hide");
	load_racik();
	$(".uang").mask("000.000.000", { reverse: true });
	status_aktif();
});

function status_aktif(p_status) {
	var html = "<option value='pil'> Pilih Status </option>";
	var data = [
		{
			id: "y",
			title: "Aktif",
		},
		{
			id: "n",
			title: "Tidak Aktif",
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
	$("#aktif").html(html);
}

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

$("#nama_produk_tolak").on("input", function () {
	var param = $("#nama_produk_tolak").val();
	$.ajax({
		url: URL + "penjualan/get_produk_barcode",
		type: "POST",
		data: { param: param },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#nama_produk_tolak").autocomplete({
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
		url: URL + "pelayanan/get_add_produk_racik",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				load_racik();
				$("#produk_barcode").val("");
			} else {
				Swal.fire({
					icon: "warning",
					title: "Perhatian !!!",
					html: res.msg,
				});
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

function load_racik() {
	var html = "";
	var sub_tot = 0;
	$.ajax({
		url: URL + "pelayanan/load_data_racik",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			var no = 1;
			if (res.status == 1) {
				sub_tot += res.sub_tot;
				res.result.forEach((e) => {
					load_select(e.id_racik_obat, e.id_jenis_harga, e.id_satuan);
					html +=
						`<tr id="row_` +
						e.id_racik_obat +
						`">
                                    <td style="width: 10px; text-align: right;">` +
						no +
						`</td>
                                    <td>` +
						e.nama_produk +
						`
                                        
                                    </td>
                                    <td style="width: 100px; "><input type="number" class="form-control"
                                            name="jumlah_produk" value="` +
						e.qty +
						`" id="jumlah_produk_` +
						e.id_racik_obat +
						`" onchange="get_nom(` +
						e.id_racik_obat +
						`,1,this.value)"> </td>
                                    <td >
                                        <select class="form-control" id="satuan_` +
						e.id_racik_obat +
						`"  onchange="get_nom(` +
						e.id_racik_obat +
						`,2,this.value)">
                                        </select>
                                    </td>
                                    <td style="display: none;">
                                        <select class="form-control" id="jenis_harga_` +
						e.id_racik_obat +
						`"  onchange="get_nom(` +
						e.id_racik_obat +
						`,3,this.value)">
                                        </select>
                                    </td>
                                    <td style="width: 100px; display: none;">
                                        <input type="text" class="form-control" name="harga" value="` +
						rupiah(e.harga_jual) +
						`" id="harga_` +
						e.id_racik_obat +
						`">
                                    </td>
                                    <td style="width: 130px; display: none;">
                                        <input type="text" class="form-control" name="total" value="` +
						rupiah(e.total_harga) +
						`" id="total_` +
						e.id_racik_obat +
						`" readonly>
                                    </td>
									<td><button type="button" class="btn btn-danger btn-xs float-right"
                                            onclick="hapus_list(` +
						e.id_racik_obat +
						`);"><i class="fa fa-trash"
                                                aria-hidden="true"></i></button></td>
                            </tr>`;
					no++;
				});
			}
			$("#sub_tot").val(rupiah(sub_tot));
			$("#str_sub_tot").val(sub_tot);
			$("#list_kasir").html(html);
			total_harga();
		},
	});
}

function hapus_list(id) {
	$.ajax({
		url: URL + "pelayanan/hapus_produk_racik",
		type: "POST",
		data: { id: id },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				load_racik();
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

function clear_list(id) {
	$.ajax({
		url: URL + "penjualan/clear_produk_kasir",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Berhasil",
					text: res.msg,
				});
				load_racik();
				total();
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
	var jen_har = $("#jenis_harga_" + id).val();
	var sat = $("#satuan_" + id).val();
	$.ajax({
		url: URL + "pelayanan/get_nom_racik",
		type: "POST",
		data: { id: id, el: el, val: val, jen_har: jen_har, sat: sat },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				load_racik();
				Swal.fire({
					icon: "success",
					title: "Success !!!",
					text: res.msg,
				});
			} else {
				load_racik();
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
	if (isNaN(tot)) {
		var for_tot = "Rp. 0";
	} else {
		var for_tot = rupiah(tot);
	}

	console.log(tot);

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
