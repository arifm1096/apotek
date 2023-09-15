$(document).ready(function () {
	viewpass();
	$("#view_shif").hide();
});

$(document).on("keydown", "body", function (e) {
	var charCode = e.which ? e.which : event.keyCode;

	if (charCode == 13) {
		//hitung
		Login();
		return false;
	}
});

function viewpass() {
	if ($("#ck_login").is(":checked")) {
		$("#password").attr("type", "text");
	} else {
		$("#password").attr("type", "password");
	}
}

function get_shif() {
	var id = $("#panel").val();

	if (id == 3) {
		$("#view_shif").show();
	} else {
		$("#view_shif").hide();
	}
}

$("#contentLogin").submit(function (e) {
	e.preventDefault();
	$("#save_button").html("Sending...");
	$.ajax({
		url: URL + "login/proses_login",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		async: false,
		beforeSend: function () {
			$("#add_kas").find("span.error-text").text();
		},
		success: function (data) {
			var json = JSON.parse(data);
			if (json.status == 1) {
				// alert('sukses');
				window.location.href = URL + "home/index";
			} else {
				if (json.status == 2) {
					// alert('sukses');
					window.location.href = URL + "anggota/index";
				} else {
					Swal.fire({
						icon: "warning",
						title: "Perhatian...",
						text: "Username atau Password Tidak Ditemukan",
					});
					// window.location.reload();
				}
			}
		},
	});
});
