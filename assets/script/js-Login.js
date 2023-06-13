$(document).ready(function () {
	viewpass();
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

// function Login() {
// 	var arrInput = $("#contentLogin").find("input[name]").toArray();
// 	var value_input = "";

// 	var username = "";

// 	arrInput.forEach(function (item, index) {
// 		value_input = $("#contentLogin").find("input[name]").eq(index).val();
// 		if (value_input == "") {
// 			Swal.fire({
// 				icon: "error",
// 				title: "Perhatian...",
// 				text: "Inputan Wajib Diisi",
// 			});
// 		}
// 	});

// 	if (value_input !== "") {
// 		//start ajax
// 		var form = document.querySelector("form");

// 		var request = new XMLHttpRequest();
// 		var formData = new FormData(form);

// 		form.addEventListener(
// 			"submit",
// 			function (e) {
// 				e.preventDefault();
// 			},
// 			false
// 		);

// 		request.onreadystatechange = function () {
// 			if (request.readyState == 4 && request.status == 200) {
// 				var json = JSON.parse(request.responseText);
// 				if (json.status == 1) {
// 					// alert('sukses');
// 					window.location.href = URL + "home/index";
// 				} else {
// 					if (json.status == 2) {
// 						// alert('sukses');
// 						window.location.href = URL + "home/index";
// 					} else {
// 						Swal.fire({
// 							icon: "warning",
// 							title: "Perhatian...",
// 							text: "Username atau Password Tidak Ditemukan",
// 						});
// 					}
// 				}
// 			}
// 		};
// 		request.open("post", URL + "login/proses_login", true);
// 		request.send(formData);
// 	}
// }

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
