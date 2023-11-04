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
						row.id_remik +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button"  class="btn btn-info btn-sm" onclick="detail(\'' +
						row.id_remik +
						'\')"><i class="fa fa-search"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_remik +
						"','" +
						row.kode_remik +
						"','" +
						row.nama_pelanggan +
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

function detail(id) {
	$.ajax({
		url: URL + "pelayanan/get_id_remik",
		type: "POST",
		data: { id: id },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#nama_pelanggan").val(res.result.nama_pelanggan);
				$("#kode_remik").val(res.result.kode_remik);
				$("#alamat").val(res.result.alamat);
				$("#tekanan_darah").val(res.result.tekanan_darah);
				$("#tekanan_nafas").val(res.result.tekanan_nafas);
				$("#denyut_nadi").val(res.result.denyut_nadi);
				$("#suhu_tubuh").val(res.result.suhu_tubuh);
				$("#kadar_oksigen").val(res.result.kadar_oksigen);
				$("#skala_nyeri").val(res.result.skala_nyeri);
				$("#lokasi_nyeri").val(res.result.lokasi_nyeri);

				if (res.result.alergi_obat == 1) {
					$("#alergi_obat").prop("checked", true);
				}

				if (res.result.alergi_makanan == 1) {
					$("#alergi_makanan").prop("checked", true);
				}

				if (res.result.alergi_suhu == 1) {
					$("#alergi_suhu").prop("checked", true);
				}
				$("#button-save").hide();
				$("#mediumModalLabel").html("Detail Rekamedik Dasar");
				$("#modal_input_dokter").modal("show");
			} else {
				Swal.fire({
					icon: "warning",
					title: "Perhatian",
					text: res.msg,
				});
			}
		},
	});
}

function edit(id) {
	$("#button-save").show();
	$.ajax({
		url: URL + "pelayanan/get_id_remik",
		type: "POST",
		data: { id: id },
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				$("#id_remik").val(res.result.id_remik);
				$("#nama_pelanggan").val(res.result.nama_pelanggan);
				$("#kode_remik").val(res.result.kode_remik);
				$("#alamat").val(res.result.alamat);
				$("#tekanan_darah").val(res.result.tekanan_darah);
				$("#tekanan_nafas").val(res.result.tekanan_nafas);
				$("#denyut_nadi").val(res.result.denyut_nadi);
				$("#suhu_tubuh").val(res.result.suhu_tubuh);
				$("#kadar_oksigen").val(res.result.kadar_oksigen);
				$("#skala_nyeri").val(res.result.skala_nyeri);
				$("#lokasi_nyeri").val(res.result.lokasi_nyeri);

				if (res.result.alergi_obat == 1) {
					$("#alergi_obat").prop("checked", true);
				}

				if (res.result.alergi_makanan == 1) {
					$("#alergi_makanan").prop("checked", true);
				}

				if (res.result.alergi_suhu == 1) {
					$("#alergi_suhu").prop("checked", true);
				}
				$("#mediumModalLabel").html("Detail Rekamedik Dasar");
			} else {
				Swal.fire({
					icon: "warning",
					title: "Perhatian",
					text: res.msg,
				});
			}
		},
	});
}

function hapus(id, kode, nama_pelanggan) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Menghapus Data ?</b> <br> Kode Remik  : " +
			kode +
			"<br> " +
			"Nama Pelanggan: " +
			nama_pelanggan,
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Hapus Data",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				url: URL + "pelayanan/hapus_remik",
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
