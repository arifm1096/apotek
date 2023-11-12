$(document).ready(function () {
	// filter_data_penjualan();
	// load_lap_keu((text = ""), (tgl1 = ""), (tgl2 = ""));
	$("#loading").hide();
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function load_lap_keu(tgl1, tgl2) {

		$.ajax({
			url: URL + "laporan/load_laporan_keu",
			type: "POST",
			data: { tgl1: tgl1, tgl2: tgl2 },
			success : function(data){
				var res = JSON.parse(data);

				if(res.status == 1){
					$("#modal").html(res.res.tot_modal);
					$("#m_penjualan").html(res.res.tot_margin_kas);
					$("#m_resep").html(res.res.tot_margin_res);
					$("#tot_margin").html(res.res.tot_margin);
					$("#pen_kas").html(res.res.tot_pen_kas);
					$("#pen_dok").html(res.res.tot_pen_dok);
					$("#pem_kas").html(res.res.tot_pem_kas);
					$("#pem_dok").html(res.res.tot_pem_dok);
					$("#tot_pen").html(res.res.tot_penjualan);
					$("#tot_pem").html(res.res.tot_pembelian);
					$("#tot_pen_x").html(res.res.tot_penjualan);
					$("#tot_pem_x").html(res.res.tot_pembelian);
					$("#laba_rugi").html(res.res.tot_margin);
				}else{
					Swal.fire({
						icon : 'error',
						title : 'Perhatian !!',
						text : res.msg,
					});
				}
			}
		});
			
		
}

function filter_data() {
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	if (tgl1 !== "" && tgl2 !== "") {
		$("#tbl_margin").DataTable().destroy();
		load_lap_keu(tgl1, tgl2);
	}
}

function clear_filter() {
	$("#tbl_margin").DataTable().destroy();
	load_lap_keu((text = ""), (tgl = ""));
	$("#filter_text").val("");
	$("#tanggal").val("");
}

function export_excel() {
	var tgl1 = $("#tanggal1").val();
	var tgl2 = $("#tanggal2").val();
	if (tgl1 !== "" && tgl2 !== "") {
		window.open(
			URL + "laporan/export_data_keu?tgl1=" + tgl1 + "&tgl2=" + tgl2,
			+"_blank"
		);
	} else {
		Swal.fire({
			icon: "warning",
			title: "Perhatian !!",
			text: "Pilih FIlter Terlebih Dahulu",
		});
	}
}
