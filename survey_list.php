<?php
include_once("libs/dbfunctions.php");
$dbobject = new dbobject();

?>


<div class="card">
    <div class="card-header">
        <h4 class="text-warning">Survey List</h4>
        <div class="card-title mt-3">
            <h6 class="card-subtitle text-muted">The report contains Users that have been setup in the system..</h6>
        </div>

    </div>
</div>

<div class="card">

    <div class="card-body">
        <div id="datatables-basic_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer white-space-no-wrap">
            <div class="row">
                <div class="col-sm-3">
                    <label for=""></label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 table-responsive">
                    <table id="page_list" class="table table-striped" style="width:100%">

                        <thead>
                            <tr role="row">
                                <th>S/N</th>
                                <th>Username</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Phone Number</th>
                                <th>Role</th>
                                <th>Email</th>
                                <th>Password Missed Count</th>
                                <th>Login Status</th>
                                <th></th>
                                <th></th>
                                <th style="width:500px">Action</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="defaultModalPrimary">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="modal_div">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Modal body text goes here.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script>
    function letsFilter() {
        table.draw()
    }
    var table;
    var editor;
    var op = "Users.userlist";
    // var username = $("#username").val();
    // alert(username);
    $(document).ready(function() {
        table = $("#page_list").DataTable({
            processing: true,
            columnDefs: [{
                orderable: false,
                targets: 0
            }],
            serverSide: true,
            paging: true,
            oLanguage: {
                sEmptyTable: "No record was found, please try another query"
            },

            ajax: {
                url: "utilities.php",
                type: "POST",
                data: function(d, l) {
                    d.op = op;
                    d.li = Math.random();
                    d.username = $("#user_category").val();
                    // alert(d.username);
                    //          d.start_date = $("#start_date").val();
                    //          d.end_date = $("#end_date").val();
                }
            }
        });
    });

    function do_filter() {
        table.draw();
    }

    

    function trigUser(user, status) {
        var r_status = (status == 1) ? "Unlock " : "Lock ";
        // var cnf = confirm("Are you sure you want to " + r_status + " this user ?");
        Swal.fire({
            title: 'Are you sure?',
            text: "Are you sure you want to " + r_status + " this user ?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: 'blue',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes!',
            cancelButtonText: 'Cancel',
            showLoaderOnConfirm: true,
            preConfirm: () => {
                return $.ajax({
                        url: 'utilities.php',
                        data: {
                            op: "Users.changeUserStatus",
                            current_status: status,
                            username: user
                        },
                        type: 'post',
                        dataType: 'json'
                    })
                    .done(function(resp) {
                        if (resp.response_code === 0) {
                            $("#save_facility").attr("disabled", true);
                            Swal.fire({
                                title: 'Updated!',
                                text: resp.response_message,
                                icon: 'success'
                            });
                            setTimeout(() => {
                                getpage('user_list.php', 'page');
                                // $('#defaultModalPrimary').modal('hide');
                            }, 1000)
                        } else {
                            Swal.fire({
                                title: 'Error',
                                text: resp.response_message,
                                icon: 'warning'
                            });
                        }
                    })
                    .fail(function() {
                        Swal.fire({
                            title: 'Error',
                            text: 'Request could not be processed at the moment!',
                            icon: 'error'
                        });
                    });
            }
        });
    }



    function sackUser(username_1, status_1) {
        Swal.fire({
            title: 'Confirm',
            text: 'Are you sure you want to perform this action?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: 'blue',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes!',
            cancelButtonText: 'Cancel',
            showLoaderOnConfirm: true,
            preConfirm: () => {
                return $.ajax({
                        url: 'utilities.php',
                        data: {
                            op: "Users.sackUser",
                            username: username_1,
                            status: status_1
                        },
                        type: 'post',
                        dataType: 'json'
                    })
                    .done(function(rr) {
                        if (rr.response_code === 0) {
                            Swal.fire({
                                title: 'Sacked!',
                                text: rr.response_message,
                                icon: 'success'
                            }).then(function() {
                                getpage('user_list.php', 'page');
                            });
                        } else {
                            Swal.fire({
                                title: 'Error',
                                text: rr.response_message,
                                icon: 'error'
                            });
                        }
                    })
                    .fail(function() {
                        Swal.fire({
                            title: 'Error',
                            text: 'Request could not be processed at the moment!',
                            icon: 'error'
                        });
                    });
            }
        });
    }


    function getModal(url, div) {
        $('#' + div).html("<h2>Loading....</h2>");
        //        $('#'+div).block({ message: null });
        $.post(url, {}, function(re) {
            $('#' + div).html(re);
        })
    }
</script>