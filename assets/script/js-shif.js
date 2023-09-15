$(document).ready(function () {
	status_aktif();
	load_shif();
	$("#loading").hide();
});

//Initialize Select2 Elements
$(".select2").select2();
//Date picker
$("#reservationdate").datetimepicker({
	format: "L",
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
	$("#select_aktif").html(html);
}

function load_shif() {
	$("#tbl_shif").DataTable({
		ajax: {
			url: URL + "master/load_shif",
			type: "POST",
			data: {},
		},
		processing: true,
		serverSide: true,
		serverMethod: "POST",
		columns: [
			{
				data: "id_shif",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},

			{ data: "nama_shif" },
			{ data: "jam_masuk" },
			{ data: "jam_pulang" },
			{ data: "is_aktif" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_shif +
						"','" +
						row.nama_shif +
						"','" +
						row.jam_masuk +
						"','" +
						row.jam_pulang +
						"','" +
						row.aktif +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_shif +
						"','" +
						row.nama_shif +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

$("#add_shif").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "master/save_shif",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_shif").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.message,
				});

				$("#tbl_shif").DataTable().clear().destroy();
				load_shif();
				$("#modal_input_shif").modal("hide");
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

function edit(p_id_shif, p_nama, p_aktif) {
	status_aktif(p_aktif);
	$("#mediumModalLabel").html("Edit Rak");
	$("#id_shif").val(p_id_shif);
	$("#nama_shif").val(p_nama);
	status_aktif(p_aktif);
	$("#modal_input_shif").modal("show");
}

function hapus(id, rak) {
	Swal.fire({
		html: "<b>Apakah Anda yakin Menghapus Data ?</b> <br> Nama Shif : " + rak,
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Hapus Data",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				url: URL + "master/hapus_shif",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_shif").DataTable().clear().destroy();
						load_shif();
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

$("#modal_input_shif").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_shif").val("");
	$("#nama_shif").val("");
	$("#jam_pulang").val("");
	$("#jam_masuk").val("");
	status_aktif((id_status = "pil"));
});
