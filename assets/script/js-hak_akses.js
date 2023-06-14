$(document).ready(function () {
	loadUser();
	hak_akses();
	status_aktif();
	wilayah();
	$("#loading").hide();
});

//Initialize Select2 Elements
$(".select2").select2();

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
	$("#select_aktif").html(html);
}

$("#add_wilayah").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "user/load_wilayah",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_wilayah").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.message,
				});

				$("#tbl_barang").DataTable().clear().destroy();
				load_barang();
				$("#modal_input_barang").modal("hide");
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

function edit(p_id, p_username, p_id_hak_akses, p_wilayah, p_nama, p_aktif) {
	hak_akses(p_id_hak_akses);
	status_aktif(p_aktif);
	wilayah(p_wilayah);
	$("#mediumModalLabel").html("Edit User");
	$("#id").val(p_id);
	$("#username").val(p_username);
	$("#nama").val(p_nama);
	$("#modal_input_user").modal("show");
}

function hapus(id, username, hak_akses) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Menghapus Data ?</b> <br> User Nama : " +
			username +
			"<br> " +
			"Hak Akses : " +
			hak_akses,
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Hapus Data",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				url: URL + "user/hapususer",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_user").DataTable().clear().destroy();
						loadUser();
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

$("#modal_input_user").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id").val("");
	$("#username").val("");
	$("#password").val("");
	$("#nama").val("");
	hak_akses((id_level = "pil"));
	status_aktif((id_status = "pil"));
});
