$(document).ready(function () {
	status_aktif();
	load_racikan();
	$("#loading").hide();
});

//Initialize Select2 Elements
$(".select2").select2();

function add_racik() {
	window.open(URL + "pelayanan/racik_obat");
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

function load_racikan() {
	$("#tbl_remik").DataTable({
		ajax: {
			url: URL + "pelayanan/load_racikan",
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
			{ data: "kode_racikan" },
			{ data: "nama_racikan" },
			{ data: "ket" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					if (row.aktif == "y") {
						return '<span class="badge bg-success">aktif</span>';
					} else {
						return '<span class="badge bg-danger">Tidak aktif</span>';
					}
				},
			},
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_racik +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button"  class="btn btn-success btn-sm" onclick="shop(\'' +
						row.id_racik +
						'\')"><i class="fa fa-shopping-cart"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_racik +
						"','" +
						row.kode_racikan +
						"','" +
						row.nama_racikan +
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
				load_racikan();
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
						load_racikan();
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

function edit(id) {
	window.open(URL + "pelayanan/get_detail_racikan?id_racik=" + id, +"_blank");
}

function shop(id) {
	$.ajax({
		url: URL + "pelayanan/get_shop_racik",
		type: "POST",
		data: { id: id },
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.msg,
				});
				window.open(URL + "penjualan");
			} else {
				Swal.fire({
					icon: "error",
					title: "Error",
					text: res.msg,
				});
			}
		},
	});
}
