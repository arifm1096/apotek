$(document).ready(function () {
	select_trans_keu();
	$("#loading").hide();
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
$(".uang").mask("000.000.000.000.000", { reverse: true });
//Initialize Select2 Elements
$(".select2").select2();
//Date picker
$("#reservationdate").datetimepicker({
	format: "L",
});

function select_trans_keu(p_akun) {
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

function load_trans_keu(text, tgl_awal, tgl_akhir) {
	$("#tbl_trans_keu").DataTable({
		ajax: {
			url: URL + "laporan/load_trans_keu",
			type: "POST",
			data: { text: text, tgl_awal: tgl_awal, tgl_akhir: tgl_akhir },
		},
		processing: true,
		serverSide: true,
		searching: false,
		serverMethod: "POST",
		columns: [
			{
				data: "id_trans_keu",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},

			{ data: "kd_akun" },
			{ data: "nama_akun" },
			{ data: "nama_transaksi" },
			{ data: "nominal", render: $.fn.dataTable.render.number(".", ".", 0) },
			{ data: "ket" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					return (
						'<button type="button"  class="btn btn-warning btn-sm" onclick="edit(\'' +
						row.id_trans_keu +
						"','" +
						row.id_akun +
						"','" +
						row.tgl_trans +
						"','" +
						row.nominal +
						"','" +
						row.ket +
						'\')"><i class="fa fa-pencil-alt"></i></button> &nbsp' +
						'<button type="button" class="btn btn-danger btn-sm" onclick="hapus(\'' +
						row.id_trans_keu +
						"','" +
						row.nama_trans_keu +
						'\')"><i class="fa fa-trash"></i></button>'
					);
				},
			},
		],
	});
}

function filter_data() {
	var text = $("#filter_text").val();
	var tgl_awal = $("#tanggal1").val();
	var tgl_akhir = $("#tanggal2").val();

	if (tgl_awal !== "" && tgl_akhir !== "") {
		$("#tbl_trans_keu").DataTable().clear().destroy();
		load_trans_keu(text, tgl_awal, tgl_akhir);
	}
}

$("#add_trans_keu").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "laporan/save_trans_keu",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_trans_keu").find("span.error-text").text();
		},
		success: function (data) {
			var res = JSON.parse(data);
			if (res.status == 1) {
				Swal.fire({
					icon: "success",
					title: "Success",
					text: res.message,
				});

				$("#modal_input_trans_keu").modal("hide");
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

function edit(p_id_trans_keu, p_id_akun, p_tgl_trans, p_nominal, p_ket) {
	select_trans_keu(p_id_akun);
	$("#mediumModalLabel").html("Edit Rak");
	$("#id_trans_keu").val(p_id_trans_keu);
	$("#tgl_trans").val(p_tgl_trans);
	$("#nominal").val(p_nominal);
	$("#ket").val(p_ket);
	$("#modal_input_trans_keu").modal("show");
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
				url: URL + "laporan/hapus_trans_keu",
				type: "POST",
				data: {
					id: id,
				},
				success: function (res) {
					var r = JSON.parse(res);
					if (r.status == 1) {
						//success show success modal

						Swal.fire("Terhapus!", "Data Telah Dihapus", "success");
						$("#tbl_trans_keu").DataTable().clear().destroy();
						load_trans_keu();
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

$("#modal_input_trans_keu").on("hide.bs.modal", function () {
	$("#mediumModalLabel").html("Add New Data");
	$("#id_trans_keu").val("");
	$("#nama_trans_keu").val("");
	$("#jam_pulang").val("");
	$("#jam_masuk").val("");
});
