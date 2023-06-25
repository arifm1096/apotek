$(document).ready(function () {
	load_select();
	$("#loading").hide();
});

//Initialize Select2 Elements
$(".select2").select2();

function load_select(p_jenis_produk, p_rak, p_satuan) {
	var html_jn_pro = "<option value='pil'>-- Pilih Jenis Porduk --</option>";
	var html_rak = "<option value='pil'>-- Pilih Rak --</option>";
	var html_satuan = "<option value='pil'>-- Pilih Satuan --</option>";
	$.ajax({
		url: URL + "produk/get_data_master",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				res.jenis_produk.forEach((e) => {
					html_jn_pro +=
						'<option value="' +
						e.id_jenis_produk +
						'"' +
						(e.id_jenis_produk === p_jenis_produk
							? 'selected="selected"'
							: "") +
						">" +
						e.nama_jenis_produk +
						"</option>";
				});

				res.rak.forEach((e) => {
					html_rak +=
						'<option value="' +
						e.id_rak +
						'"' +
						(e.id_rak === p_rak ? 'selected="selected"' : "") +
						">" +
						e.nama_rak +
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
			$("#id_jenis_produk").html(html_jn_pro);
			$("#satuan_utama").html(html_satuan);
			$("#id_rak").html(html_rak);
		},
	});
}

$("#add_produk").submit(function (e) {
	e.preventDefault();
	$("#save-button-produk").html("Sending...");
	$.ajax({
		url: URL + "produk/save_produk_name",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_produk").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.msg,
				});
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

function edit(
	p_id_pelanggan,
	p_kode_pelanggan,
	p_nama_pelanggan,
	p_alamat,
	p_no_hp,
	p_aktif
) {
	status_aktif(p_aktif);
	$("#mediumModalLabel").html("Edit Supplier");
	$("#id_pelanggan").val(p_id_pelanggan);
	$("#kode_pelanggan").val(p_kode_pelanggan);
	$("#alamat").val(p_alamat);
	$("#no_hp").val(p_no_hp);
	$("#nama_pelanggan").val(p_nama_pelanggan);
	$("#modal_input_pelanggan").modal("show");
}

function hapus(id, supplier, ket) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Menghapus Data ?</b> <br> Hak Akses  : " +
			supplier +
			"<br> " +
			"Keterangan: " +
			ket,
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Hapus Data",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				url: URL + "master/hapus_pelanggan",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_pelanggan").DataTable().clear().destroy();
						load_pelanggan();
					} else {
						Swal.fire({
							icon: "error",
							title: "Perhatian...",
							text: "Data Gagal Dihapus",
						});
					}
				},
			});
		}
	});
}

$("#modal_input_pelanggan").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_pelanggan").val("");
	$("#kode_pelanggan").val("");
	$("#alamat").val("");
	$("#nama_pelanggan").val("");
	status_aktif((id_status = "pil"));
});
