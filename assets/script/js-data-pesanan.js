$(document).ready(function () {
	load_pesanan("");
});

$(".tgl_piker").datepicker({
	todayHighlight: "TRUE",
	autoclose: true,
	format: "dd-mm-yyyy",
	showButtonPanel: true,
});
//Initialize Select2 Elements
$(".select2").select2();

function load_pesanan(text) {
	$("#tbl_pesanan").DataTable({
		ajax: {
			url: URL + "pembelian/load_data_pesan_beli",
			type: "POST",
			data: { text: text },
		},
		processing: true,
		serverSide: true,
		searching: false,
		serverMethod: "POST",
		columns: [
			{
				data: "id_produk",
				render: function (data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
			},
			
			{ data: "tgl" },
			{ data: "no_sp" },
			{ data: "nama_produk" },
			{ data: "jumlah_produk" },
			{ data: "nama_satuan" },
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {

					if(row.status_terima==1){
						return ('<span class="badge bg-success">Diterima</span>');
					}else{
						return ('<span class="badge bg-warning">Belum DIterima</span>');
					}
				},
			},
			{
				data: null,
				orderable: false,
				render: function (data, type, row) {
					var btn_str ="";
					if(row.status_terima==0){
						btn_str +=`<button type="button" class="btn btn-outline-primary btn-sm" onclick="get_terima('` +
						row.id_rencana_beli +`','`+row.nama_produk+`','`+row.jumlah_produk+`','`+row.nama_satuan+`','`+row.tgl+
						`')">DIterima</button>`;
					}else{
						btn_str +=`<button type="button" class="btn btn-outline-primary btn-sm disabled" onclick="get_terima('` +
						row.id_rencana_beli +`','`+row.nama_produk+`','`+row.jumlah_produk+`','`+row.nama_satuan+`','`+row.tgl+
						`')">DIterima</button>`;
					}
					return (
						btn_str +`&nbsp
						<button type="button" class="btn btn-danger btn-sm" onclick="hapus_pro('` +
						row.id_rencana_beli +`,`+row.nama_produk+`,`+row.jumlah_produk+`,`+row.nama_satuan+`,`+row.tgl+
						`')"><i class="fa fa-trash"></i></button>`
					);
					
				},
			},
		],
	});
}

function filter_data() {
	var text = $("#filter_text").val();
	$("#tbl_pesanan").DataTable().destroy();
	load_pesanan(text);
}

function clear_filter() {
	$("#tbl_pesanan").DataTable().destroy();
	load_pesanan((text = ""));
	$("#jumlah_produk").val("");
	$("#harga_beli").val("");
	$("#keterangan").val("");
	load_select("pil", "pil", "pil");
}

function get_pesanan() {
	window.open(URL + "pembelian/buat_pesanan");		
}

function get_terima(id,produk,qty,satuan,tgl){
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Sudah Terima..?</b> <br> Nama Produk  : " +
			produk +
			"<br> " +
			"Qty : " +
			qty+' '+satuan+"<br> "+
			"Tgl. Pesan : "+tgl,
		icon: "info",
		showCancelButton: true,
		confirmButtonColor: "#30d63e",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Terima",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				type : 'POST',
				url : URL+'pembelian/get_terima_pesan',
				data  : {id:id},
				success : function(data){
					var res = JSON.parse(data);
		
					if(res.status == 1){
						Swal.fire({
							icon : 'success',
							title : 'Success',
							text :res.msg
						});
						$("#tbl_pesanan").DataTable().destroy();
						load_pesanan(text);
					}else{
						Swal.fire({
							icon : 'error',
							title : 'Perhatian',
							text :res.msg
						})
					}
				}
			})
		}
	});
	
}

function hapus_pro(id) {
	Swal.fire({
		html:
			"<b>Apakah Anda yakin Hapus Data..?</b> <br> Nama Produk  : " +
			produk +
			"<br> " +
			"Qty : " +
			qty+' '+satuan+"<br> "+
			"Tgl. Pesan : "+tgl,
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Ya, Hapus Data",
	}).then((result) => {
		if (result.value) {
			$.ajax({
				type : 'POST',
				url : URL+'pembelian/get_terima_pesan',
				data  : {id:id},
				success : function(data){
					var res = JSON.parse(data);
		
					if(res.status == 1){
						Swal.fire({
							icon : 'success',
							title : 'Success',
							text :res.msg
						});
						$("#tbl_pesanan").DataTable().destroy();
						load_pesanan(text);
					}else{
						Swal.fire({
							icon : 'error',
							title : 'Perhatian',
							text :res.msg
						})
					}
				}
			})
		}
	});
}
