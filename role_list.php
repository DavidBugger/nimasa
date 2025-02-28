<?php
include_once("libs/dbfunctions.php");
//var_dump($_SESSION);
?>
<div class="card">
  <div class="card-header">
    <h5 class="card-title">Role List</h5>
    <h6 class="card-subtitle text-muted">Here is a list of table showing all assigned role.</h6>
  </div>
  <div class="card-body">
    <a class="btn btn-primary mb-3 "  style="margin-left: 88%;background:linear-gradient(90deg, #1d80b8, #205a8a); border:none;"  onclick="loadModal('setup/role_setup.php','modal_div')" href="javascript:void(0)" data-toggle="modal"  ><i class="fa fa-plus"></i> Add New Role</a>
    <div id="datatables-basic_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">

      <div class="row">
        <div class="col-sm-12 table-responsive">
          <table id="page_list" class="table table-striped ">
            <thead>
              <tr role="row">
                <th>S/N</th>
                <th>Role Name</th>
                <th>Date</th>
                <th>Assigned Employee</th>
                <th>Action</th>
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

<div class="modal fade bd-example-modal-md" tabindex="-1" role="dialog" aria-hidden="true" id="defaultModalPrimary">
  <div class="modal-dialog modal-md">
    <div class="modal-content" id="modal_div">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="mb-0">Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!--<script src="../js/sweet_alerts.js"></script>-->
<!--<script src="../js/jquery.blockUI.js"></script>-->
<script>
  var table;
  var editor;
  var op = "Role.role_list";
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
          //          d.start_date = $("#start_date").val();
          //          d.end_date = $("#end_date").val();
        }
      }
    });
  });

  function do_filter() {
    table.draw();
  }


  function getModal(url, div) {
    //        alert('dfd');
    $('#' + div).html("<h2>Loading....</h2>");
    //        $('#'+div).block({ message: null });
    $.post(url, {}, function(re) {
      $('#' + div).html(re);
    })
  }

  function deleteRole(role_id) {
    Swal.fire({
      title: 'Are you sure?',
      text: 'Are you sure you want to delete Role?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: 'blue',
      cancelButtonColor: '#3085d6',
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'Cancel',
      showLoaderOnConfirm: true,
      preConfirm: () => {
        return $.ajax({
            url: 'utilities.php',
            data: {
              op: "Role.deleteRole",
              role_id: role_id
            },
            type: 'post',
            dataType: 'json'
          })
          .done(function(response) {
            if (response.response_code === 0) {
              $("#save_facility").attr("disabled", true);
              Swal.fire({
                title: 'Deleted!',
                text: response.response_message,
                icon: 'success'
              });
              setTimeout(() => {
                getpage('role_list.php', 'page');
                // $('#defaultModalPrimary').modal('hide');
              }, 1000)
            } else {
              Swal.fire({
                title: 'Error',
                text: response.response_message,
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
</script>