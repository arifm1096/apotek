$(document).ready(function () {
	loda_exp_list();
	load_hak_akses();
	$("#loading").hide();
});

//Initialize Select2 Elements
$(".select2").select2();

function loda_exp_list(p_status) {
	var html = "";
	$.ajax({
		url: URL + "/persediaan/load_kadaluarsa_home",
		type: "POST",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				var no = 1;
				res.result.forEach((e) => {
					html +=
						`<tr>
						<td>` +
						no +
						`</td>
						<td>` +
						e.nama_produk +
						`</td>
						<td>` +
						e.exp_date +
						`</td>
						<td>` +
						e.jumlah_stok +
						`</td>
					</tr>`;
					no++;
				});
				$("#list_exp").html(html);
			}
		},
	});
}

function load_hak_akses() {
	$("#tbl_hak_akses").DataTable({
		ajax: {
			url: URL + "user/load_hak_akses",
			type: "POST",
			data: {},
		},
		processing: true,
		serverSide: true,
		serverMethod: "POST",
		columns: [
			{
				data: "id_hak_akses",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},
			{ data: "nama" },
			{ data: "ket" },
			{ data: "is_aktif" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_hak_akses +
						"','" +
						row.nama +
						"','" +
						row.ket +
						"','" +
						row.aktif +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_hak_akses +
						"','" +
						row.nama +
						"','" +
						row.ket +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

$("#add_hak_akses").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "user/save_hak_akses",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_hak_akses").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.message,
				});

				$("#tbl_hak_akses").DataTable().clear().destroy();
				load_hak_akses();
				$("#modal_input_hak_akses").modal("hide");
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

function edit(p_id_hak_akses, p_nama, p_ket, p_aktif) {
	status_aktif(p_aktif);
	$("#mediumModalLabel").html("Edit Hak Akses");
	$("#id_hak_akses").val(p_id_hak_akses);
	$("#ket").val(p_ket);
	$("#nama").val(p_nama);
	$("#modal_input_hak_akses").modal("show");
}

function hapus(id, hak_akses, ket) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Menghapus Data ?</b> <br> Hak Akses  : " +
			hak_akses +
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
				url: URL + "user/hapus_hak_akses",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_hak_akses").DataTable().clear().destroy();
						load_hak_akses();
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
	$("#id_hak_akses").val("");
	$("#ket").val("");
	$("#nama").val("");
	status_aktif((id_status = "pil"));
});
