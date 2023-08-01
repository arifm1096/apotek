$(document).ready(function () {
	status_aktif();
	load_satuan();
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

function load_satuan() {
	$("#tbl_satuan").DataTable({
		ajax: {
			url: URL + "master/load_satuan",
			type: "POST",
			data: {},
		},
		processing: true,
		serverSide: true,
		serverMethod: "POST",
		columns: [
			{
				data: "id_satuan",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},

			{ data: "kd_statuan" },
			{ data: "nama_satuan" },
			{ data: "ket" },
			{ data: "is_aktif" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_satuan +
						"','" +
						row.kd_statuan +
						"','" +
						row.nama_satuan +
						"','" +
						row.ket +
						"','" +
						row.aktif +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_satuan +
						"','" +
						row.nama_satuan +
						"','" +
						row.ket +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

$("#add_satuan").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "master/save_satuan",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_satuan").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.message,
				});

				$("#tbl_satuan").DataTable().clear().destroy();
				load_satuan();
				$("#modal_input_satuan").modal("hide");
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

function edit(p_id_satuan, p_kode, p_nama, p_ket, p_aktif) {
	status_aktif(p_aktif);
	$("#mediumModalLabel").html("Edit Hak Akses");
	$("#id_satuan").val(p_id_satuan);
	$("#ket").val(p_ket);
	$("#nama_satuan").val(p_nama);
	$("#kd_statuan").val(p_kode);
	status_aktif(p_aktif);
	$("#modal_input_satuan").modal("show");
}

function hapus(id, satuan, ket) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Menghapus Data ?</b> <br> Hak Akses  : " +
			satuan +
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
				url: URL + "master/hapus_satuan",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_satuan").DataTable().clear().destroy();
						load_satuan();
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

$("#modal_input_satuan").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_satuan").val("");
	$("#ket").val("");
	$("#nama_satuan").val("");
	$("#kd_satuan").val("");
	status_aktif((id_status = "pil"));
});
