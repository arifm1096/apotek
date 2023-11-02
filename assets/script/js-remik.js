$(document).ready(function () {
	status_aktif();
	load_remik();
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

function load_remik() {
	$("#tbl_remik").DataTable({
		ajax: {
			url: URL + "pelayanan/load_remik",
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
			{ data: "kode_remik" },
			{ data: "nama_pelanggan" },
			{ data: "alamat" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_dokter +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button"  class="btn btn-info btn-sm" onclick="detail(\'' +
						row.id_dokter +
						'\')"><i class="fa fa-search"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_dokter +
						"','" +
						row.nama_dokter +
						"','" +
						row.kode_dokter +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

$("#add_remik").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "pelayanan/save_remik",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_remik").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.msg,
				});

				$("#tbl_remik").DataTable().clear().destroy();
				load_remik();
				$("#modal_input_dokter").modal("hide");
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
	p_id_dokter,
	p_kode_dokter,
	p_nama_dokter,
	p_klinik,
	p_username,
	p_alamat,
	p_no_hp,
	p_nama_print
) {
	$("#mediumModalLabel").html("Edit Dokter");
	$("#id_dokter").val(p_id_dokter);
	$("#kode_dokter").val(p_kode_dokter);
	$("#alamat").val(p_alamat);
	$("#klinik_rs").val(p_klinik);
	$("#no_hp").val(p_no_hp);
	$("#username").val(p_username);
	$("#nama_print").val(p_nama_print);
	$("#nama_dokter").val(p_nama_dokter);
	$("#modal_input_dokter").modal("show");
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
				url: URL + "master/hapus_dokter",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_remik").DataTable().clear().destroy();
						load_remik();
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

$("#modal_input_dokter").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_dokter").val("");
	$("#kode_dokter").val("");
	$("#alamat").val("");
	$("#nama_dokter").val("");
	status_aktif((id_status = "pil"));
});
