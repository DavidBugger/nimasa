<?php
include_once "base/base.php";
session_start();
include_once("libs/dbfunctions.php");
$dbobject = new dbobject();
// echo $dbobject->generateHTTP();
header("Cache-Control: no-cache;no-store, must-revalidate");
header_remove("X-Powered-By");
header_remove("Server");
header('X-Frame-Options: SAMEORIGIN');
?>

<style>
	/* * {
		font-family: Lexend Deca !important;

	} */

	.container-with-background {
		position: relative;
		overflow: hidden;
	}

	.container-with-background::before {
		content: "";
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-image: url('img/avatars/logo_servicom.png');
		background-size: 220px auto !important;
		background-repeat: no-repeat;
		background-size: cover;
		background-position: center;
		opacity: 0.1;
		margin-bottom: 40px !important;
		z-index: 1;
	}

	.container-with-background>* {
		position: relative;
		z-index: 2;
	}

	.custom {
		border-color: #2887bf !important;
		border-width: 1px !important;
	}

	.custom:focus {
		border-color: #2887bf !important;
		border-width: 1px !important;
		outline: none !important;
		color: red;

	}
</style>

<body>
	<div class="container-fluid p-0" style="background: #333 !important;">
		<div class="container" style="background:#f5f5f5 !important">
			<div class="row">
				<div class="col-xl-6 d-none d-xl-flex">
					<div class="auth-full-page position-relative">
						<img src="img/avatars/nimasa_bg.png" class="auth-bg" alt="NIMASA">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="auth-full-page d-flex p-4 p-xl-5">
						<div class="d-flex flex-column w-100 h-100">
							<div class="auth-form">
								<div class="mb-3 container-with-background" style="background:white !important; padding:20% !important; border-radius: 12px 14px;">
									<div class="text-left mb-4" style="font-family: Lexend Deca; font-size: 24px; font-weight: 500;line-height: 30px;text-align: left; color:#1f1f1f; font-weight: bold;">
										LOGIN
									</div>
									<form autocomplete="off" class="px-md-2" method="POST" action="javascript:void()" id="form1">
										<input type="hidden" name="op" value="Users.login">
										<div class="mb-3">
											<label class="form-label fw-bold">Username</label>
											<input class="form-control form-control-lg custom" type="text" type="username" name="username" placeholder="Enter username" />
										</div>

										<div class="mb-3">
											<label class="form-label fw-bold">Password</label>
											<input class="form-control form-control-lg custom" type="password" id="password" name="password" placeholder="Enter password" />
										</div>
										<div class="d-grid gap-2 mt-5">
											<a class='btn btn-lg btn-secondary text-muted' id="login_facility" style="color:#f1f1f1 !important;" href='#' onclick="sendOperatorLogin('form1')">Login</a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php include_once "base/footer.php"; ?>

</body>

</html>

<script>
	function sendOperatorLogin(id) {
		$("#search_facility").text("Processing......");
		var forms = $('#' + id);
		forms.parsley().validate();
		if (forms.parsley().isValid()) {
			$.blockUI();
			var data = $("#" + id).serialize();
			$.ajax({
				type: "post",
				url: "utilities_default.php",
				data: data,
				dataType: "json",
				beforeSend: function() {
					$.blockUI({
						message: "Processing..... Please wait...",
					});
				},
				success: function(data) {
					$.unblockUI();
					if (data.response_code == 0) {
						toastr.options = {
							"closeButton": true,
							"debug": false,
							"newestOnTop": false,
							"progressBar": true,
							"positionClass": "toastr-top-right",
							"preventDuplicates": true,
							"onclick": null,
							"showDuration": "300",
							"hideDuration": "1000",
							"timeOut": "2000",
							"extendedTimeOut": "1000",
							"showEasing": "swing",
							"hideEasing": "linear",
							"showMethod": "fadeIn",
							"hideMethod": "fadeOut",
							"onHidden": function() {
							window.location = 'home.php'; 
						}
						};
						toastr.success(data.response_message);
						// Swal.fire({
						// 	icon: 'success',
						// 	title: 'Success',
						// 	text: data.response_message,
						// 	timer: 2000,
						// 	showConfirmButton: false
						// }).then(function() {
						// 	window.location = 'home.php';
						// });

					} else {
						toastr.options = {
							"closeButton": true,
							"debug": false,
							"newestOnTop": false,
							"progressBar": true,
							"positionClass": "toastr-top-right",
							"preventDuplicates": true,
							"onclick": null,
							"showDuration": "300",
							"hideDuration": "1000",
							"timeOut": "3000",
							"extendedTimeOut": "1000",
							"showEasing": "swing",
							"hideEasing": "linear",
							"showMethod": "fadeIn",
							"hideMethod": "fadeOut"
						};
						toastr.error(data.response_message);
					}
				},
				error: function(data) {
					// regenerateCORS();
					$.unblockUI();
					// Swal.fire({
					//     icon: 'error',
					//     title: 'Error',
					//     text: 'Unable to process request at the moment! Please try again'
					// });

					toastr.options = {
						"closeButton": true,
						"debug": false,
						"newestOnTop": false,
						"progressBar": true,
						"positionClass": "toastr-top-right",
						"preventDuplicates": true,
						"onclick": null,
						"showDuration": "300",
						"hideDuration": "1000",
						"timeOut": "3000",
						"extendedTimeOut": "1000",
						"showEasing": "swing",
						"hideEasing": "linear",
						"showMethod": "fadeIn",
						"hideMethod": "fadeOut",
						
					};
					toastr.error('Unable to process request at the moment! Please try again');
				},
			});
		}
	}
</script>