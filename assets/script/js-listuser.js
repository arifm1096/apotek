$(document).ready(function () {
	loadUser();
	level();
	status_aktif();
	$("#loading").hide();
});

//Initialize Select2 Elements
$(".select2").select2();

function loadUser() {
	$("#tbl_user").DataTable({
		ajax: {
			url: URL + "user/load_user",
			type: "POST",
			data: {},
		},
		processing: true,
		serverSide: true,
		serverMethod: "POST",
		columns: [
			{
				data: "id_gol",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},
			{ data: "username" },
			{ data: "nama_level" },
			{ data: "is_aktif" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_user +
						"','" +
						row.username +
						"','" +
						row.level +
						"','" +
						row.id_aktif +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_user +
						"','" +
						row.username +
						"','" +
						row.nama_level +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

function level(p_id_level) {
	var html = "<option value='pil'> Pilih Level </option>";
	var data = [
		{
			id: "1",
			title: "Admin",
		},
		{
			id: "2",
			title: "Peminjam",
		},
		{
			id: "3",
			title: "Operator",
		},
		{
			id: "4",
			title: "Approval",
		},
	];
	data.forEach((e) => {
		html +=
			'<option value="' +
			e.id +
			'"' +
			(e.id === p_id_level ? 'selected="selected"' : "") +
			">" +
			e.title +
			"</option>";
	});
	$("#select_level").html(html);
}

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

function save() {
	var id = $("#id").val();
	var username = $("#username").val();
	var password = $("#password").val();
	var aktif = $("#select_aktif").val();
	var level = $("#select_level").val();
	$("#save-button").hide();
	$("#send-button").show();

	if (username !== "" || aktif !== "pil" || level !== "pil") {
		$.ajax({
			url: URL + "user/save_user",
			type: "POST",
			data: {
				id: id,
				username: username,
				password: password,
				aktif: aktif,
				level: level,
			},
			success: function (res) {
				var res = JSON.parse(res);
				$("#save-button").show();
				$("#send-button").hide();
				if (res.status == 1) {
					Swal.fire({
						icon: "success",
						title: "Success",
						text: res.message,
					});
					$("#modal_input_user").modal("hide");
					$("#tbl_user").DataTable().clear().destroy();
					loadUser();
				} else {
					Swal.fire({
						icon: "error",
						title: "Error",
						text: res.message,
					});
				}
			},
		});
	} else {
		Swal.fire({
			icon: "warning",
			title: "Perhatian !!",
			text: "Lengkapi Kolom Terlebih Dahulu",
		});
	}
}

function edit(p_id, p_username, p_level, p_aktif) {
	level(p_level);
	status_aktif(p_aktif);
	$("#mediumModalLabel").html("Edit User");
	$("#id").val(p_id);
	$("#username").val(p_username);
	$("#modal_input_user").modal("show");
}

function hapus(id, username, level) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Menghapus Data ?</b> <br> User Nama : " +
			username +
			"<br> " +
			"Level : " +
			level,
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
	level((id_level = "pil"));
	status_aktif((id_status = "pil"));
});
