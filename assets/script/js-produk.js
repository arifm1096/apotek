$(document).ready(function () {
	status_aktif();
	load_produk();
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

function load_produk() {
	var status_jual = $("#filter_status_jual").val();
	var id_rak = $("#filter_rak").val();
	$("#tbl_produk").DataTable({
		ajax: {
			url: URL + "produk/load_produk",
			type: "POST",
			data: { status_jual: status_jual, id_rak: id_rak },
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
			{ data: "nama_produk" },
			{ data: "sku_kode_produk" },
			{ data: "barcode" },
			{ data: "produk_by" },
			{ data: "nama_rak" },
			{ data: "jumlah_minimal" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					if (row.status_jual == "y") {
						return '<span class="right badge badge-succss"> Dijual</span>';
					} else {
						return '<span class="right badge badge-danger">Tidak Dijual</span>';
					}
				},
			},
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_produk +
						"','" +
						row.kode_produk +
						"','" +
						row.nama_produk +
						"','" +
						row.alamat +
						"','" +
						row.no_hp +
						"','" +
						row.aktif +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_produk +
						"','" +
						row.nama_produk +
						"','" +
						row.kode_produk +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

$("#add_pelanggan").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "master/save_pelanggan",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_pelanggan").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.msg,
				});

				$("#tbl_pelanggan").DataTable().clear().destroy();
				load_pelanggan();
				$("#modal_input_pelanggan").modal("hide");
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
