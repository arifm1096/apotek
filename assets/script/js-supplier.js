$(document).ready(function () {
	status_aktif();
	load_supplier();
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

function load_supplier() {
	$("#tbl_supplier").DataTable({
		ajax: {
			url: URL + "master/load_supplier",
			type: "POST",
			data: {},
		},
		processing: true,
		serverSide: true,
		serverMethod: "POST",
		columns: [
			{
				data: "id_supplier",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},
			{ data: "kode_supplier" },
			{ data: "nama_supplier" },
			{ data: "alamat" },
			{ data: "is_aktif" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_supplier +
						"','" +
						row.kode_supplier +
						"','" +
						row.nama_supplier +
						"','" +
						row.alamat +
						"','" +
						row.aktif +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_supplier +
						"','" +
						row.nama_supplier +
						"','" +
						row.kode_supplier +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

$("#add_supplier").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "master/save_supplier",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_supplier").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.msg,
				});

				$("#tbl_supplier").DataTable().clear().destroy();
				load_supplier();
				$("#modal_input_supplier").modal("hide");
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
	p_id_supplier,
	p_kode_supplier,
	p_nama_supplier,
	p_alamat,
	p_aktif
) {
	status_aktif(p_aktif);
	$("#mediumModalLabel").html("Edit Supplier");
	$("#id_supplier").val(p_id_supplier);
	$("#kode_supplier").val(p_kode_supplier);
	$("#alamat").val(p_alamat);
	$("#nama_supplier").val(p_nama_supplier);
	$("#modal_input_supplier").modal("show");
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
				url: URL + "master/hapus_supplier",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_supplier").DataTable().clear().destroy();
						load_supplier();
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

$("#modal_input_supplier").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_supplier").val("");
	$("#kode_supplier").val("");
	$("#alamat").val("");
	$("#nama_supplier").val("");
	status_aktif((id_status = "pil"));
});
