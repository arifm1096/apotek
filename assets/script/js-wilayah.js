$(document).ready(function () {
	load_wilayah();
	status_aktif();
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

function load_wilayah() {
	$("#tbl_wilayah").DataTable({
		ajax: {
			url: URL + "user/load_wilayah",
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
			{ data: "nama_wilayah" },
			{ data: "alamat" },
			{ data: "is_aktif" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_wilayah +
						"','" +
						row.nama_wilayah +
						"','" +
						row.alamat +
						"','" +
						row.aktif +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_wilayah +
						"','" +
						row.nama_wilayah +
						"','" +
						row.alamat +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

$("#add_wilayah").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "user/save_wilayah",
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
					text: res.msg,
				});

				$("#tbl_wilayah").DataTable().clear().destroy();
				load_wilayah();
				$("#modal_input_wilayah").modal("hide");
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

function edit(p_id_wilayah, p_nama_wilayah, p_alamat, p_aktif) {
	status_aktif(p_aktif);
	$("#mediumModalLabel").html("Edit User");
	$("#id_wilayah").val(p_id_wilayah);
	$("#nama_wilayah").val(p_nama_wilayah);
	$("#alamat").val(p_alamat);
	$("#modal_input_wilayah").modal("show");
}

function hapus(id, nama_wilayah, alamat) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Menghapus Data ?</b> <br> User Nama : " +
			nama_wilayah +
			"<br> " +
			"Hak Akses : " +
			alamat,
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Hapus Data",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				url: URL + "user/hapus_wilayah",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_wilayah").DataTable().clear().destroy();
						load_wilayah();
					} else {
						Swal.fire({
							icon: "error",
							title: "Perhatian...",
							text: res.msg,
						});
					}
				},
			});
		}
	});
}

$("#modal_input_wilayah").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_wilayah").val("");
	$("#nama_wilayah").val("");
	$("#alamat").val("");
	status_aktif((id_status = "pil"));
});
