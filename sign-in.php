<?php
session_start();
include_once("libs/dbfunctions.php");
$dbobject = new dbobject();
// echo $dbobject->generateHTTP();
header("Cache-Control: no-cache;no-store, must-revalidate");
header_remove("X-Powered-By");
header_remove("Server");
header('X-Frame-Options: SAMEORIGIN');
?>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark" data-layout="fluid" data-sidebar-theme="dark" data-sidebar-position="left" data-sidebar-behavior="sticky">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Bootstrap 5 Admin &amp; Dashboard Template">
    <meta name="author" content="Bootlab">

    <title>Sign In | NIMASA</title>
    <link rel="canonical" href="auth-sign-in-2.html" />
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&amp;display=swap" rel="stylesheet">
    <link href="css/app.css" rel="stylesheet">
    <!-- BEGIN SETTINGS -->
    <!-- Remove this after purchasing -->
    <script src="js/settings.js"></script>
    <!-- END SETTINGS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="plugins/css/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <script src="plugins/js/plugins.bundle.js"></script>

    <!-- <link href="assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/> -->
    <!-- <script src="assets/plugins/global/plugins.bundle.js"></script> -->
</head>

<body>
    <div class="auth-full-page d-flex" style="background:#183358;">
        <div class="auth-form p-3" style="background:#eef7ff; border-radius: 12px 14px;">

            <div class="text-center">
                <h1 class="h2">Welcome back!</h1>
                <p class="lead">
                    Sign in to your account to continue
                </p>
            </div>

            <div class="mb-3">

                <form autocomplete="off" class="px-md-2" method="POST" action="javascript:void()" id="form1">
                    <input type="hidden" name="op" value="Users.login">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input class="form-control form-control-lg" type="username" name="username" placeholder="Enter your username" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input class="form-control form-control-lg" type="password" name="password" placeholder="Enter your password" />
                        <small>
                            <a href='#'>Forgot password?</a>
                        </small>
                    </div>
                    <div>
                        <div class="form-check align-items-center">
                            <input id="customControlInline" type="checkbox" class="form-check-input" value="remember-me" name="remember-me" checked>
                            <label class="form-check-label text-small" for="customControlInline">Remember me</label>
                        </div>
                    </div>
                    <div class="d-grid gap-2 mt-3">
                        <a class='btn btn-lg btn-primary' href='#' onclick="sendOperatorLogin('form1')">Sign in</a>
                    </div>
                </form>
            </div>

            <!-- <div class="text-center">
                Don't have an account? <a href='auth-sign-up.html'>Sign up</a>
            </div> -->
        </div>
    </div>

    <script src="js/app.js"></script>
    <!-- Jquery JS-->
    <script src="js/jquery-3.6.0.min.js"></script>

    <!-- Vendor JS Files -->
    <script src="js/jquery.blockUI.js"></script>
    <script src="js/parsely.js"></script>

    <script src="js/main.js"></script>

</body>


<!-- Mirrored from appstack.bootlab.io/auth-sign-in by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Aug 2024 10:50:01 GMT -->

</html>

<script>
    function sendOperatorLogin(id) {
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
                    toastr.success("Login!", data.response_message);

                    if (data.response_code == 0) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: data.response_message,
                            timer: 2000,
                            showConfirmButton: false
                        }).then(function() {
                            window.location = 'home.php';
                        });



                    } else {
                        regenerateCORS();
                        Swal.fire({
                            icon: 'warning',
                            title: 'Error',
                            text: data.response_message
                        });
                    }
                },
                error: function(data) {
                    regenerateCORS();
                    $.unblockUI();
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Unable to process request at the moment! Please try again'
                    });
                },
            });
        }
    }
</script>