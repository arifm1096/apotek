$(document).ready(function () {
	select_akun();
	load_akun();
	$("#loading").hide();
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
$(".uang").mask("000.000.000", { reverse: true });
//Initialize Select2 Elements
$(".select2").select2();
//Date picker
$("#reservationdate").datetimepicker({
	format: "L",
});

function select_akun(p_akun) {
	var html1 = "<option value='pil'> Pilih Akun </option>";

	$.ajax({
		type: "POST",
		url: URL + "master/get_akun",
		data: {},
		success: function (data) {
			var res = JSON.parse(data);

			if (res.status == 1) {
				res.result.forEach((e) => {
					html1 +=
						'<option value="' +
						e.id_akun +
						'"' +
						(e.id_akun === p_akun ? 'selected="selected"' : "") +
						">" +
						e.kd_akun +
						" - " +
						e.nama_akun +
						"</option>";
				});
			}
			$("#id_akun").html(html1);
		},
	});
}

function load_akun() {
	$("#tbl_akun").DataTable({
		ajax: {
			url: URL + "master/load_akun",
			type: "POST",
			data: {},
		},
		processing: true,
		serverSide: true,
		serverMethod: "POST",
		columns: [
			{
				data: "id_akun",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},

			{ data: "kd_akun" },
			{ data: "nama_akun" },
			{ data: "nama_transaksi" },
			{ data: "is_aktif" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_akun +
						"','" +
						row.kd_akun +
						"','" +
						row.nama_akun +
						"','" +
						row.jenis_transaksi +
						"','" +
						row.aktif +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_akun +
						"','" +
						row.nama_akun +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

$("#add_akun").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "master/save_akun",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_akun").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.message,
				});

				$("#tbl_akun").DataTable().clear().destroy();
				load_akun();
				$("#modal_input_akun").modal("hide");
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

function edit(p_id_akun, p_kd_akun, p_nama, p_jenis_transaki, p_aktif) {
	status_aktif(p_aktif);
	$("#mediumModalLabel").html("Edit Rak");
	$("#id_akun").val(p_id_akun);
	$("#kd_akun").val(p_kd_akun);
	$("#nama_akun").val(p_nama);
	status_aktif(p_aktif, p_jenis_transaki);
	$("#modal_input_akun").modal("show");
}

function hapus(id, rak) {
	Swal.fire({
		html: "<b>Apakah Anda yakin Menghapus Data ?</b> <br> Nama akun : " + rak,
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Hapus Data",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				url: URL + "master/hapus_akun",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_akun").DataTable().clear().destroy();
						load_akun();
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

$("#modal_input_akun").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_akun").val("");
	$("#nama_akun").val("");
	$("#jam_pulang").val("");
	$("#jam_masuk").val("");
	status_aktif((id_status = "pil"));
});
