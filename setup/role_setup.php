<?php
include_once("../libs/dbfunctions.php");
include_once("../class/menu.php");
$dbobject = new dbobject();
// $id = "";
if (isset($_REQUEST['op']) && $_REQUEST['op'] == 'edit') {
    $operation = 'edit';
    $role_id = $_REQUEST['role_id'];
    $sql_menu = "SELECT * FROM role WHERE role_id = $role_id LIMIT 1";
    $role = $dbobject->db_query($sql_menu);
} else {
    $operation = 'new';
}
?>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script>
    doOnLoad();
    var myCalendar;

    function doOnLoad() {
        myCalendar = new dhtmlXCalendarObject(["start_date"]);
        myCalendar.setSensitiveRange(null, "<?php echo date('Y-m-d') ?>");
        myCalendar.hideTime();
    }
</script>
<div class="modal-header">
    <h4 class="modal-title" style="font-weight:bold">Role Setup</h4>
    <button type="button" class="btn-close bg-primary fw-bolder"  data-bs-dismiss="modal" > 
        
        </button>
</div>
<div class="modal-body m-3 ">
    <form id="form1" onsubmit="return false" autocomplete="off">
        <input type="hidden" name="op" value="role.saveRole">
        <input type="hidden" name="operation" value="<?php echo $operation; ?>">
        <input type="hidden" name="role_id" value="<?php echo $role_id; ?>">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="form-label">Role Name</label>
                    <input type="text" autocomplete="off" name="role_name" id="role_name" value="<?= $role[0]['role_name'] ?>" class="form-control" autocomplete="off" />
                </div>
            </div>
            <div class="col-sm-6 mb-3">
                <div class="form-group">
                    <label class="form-label">Enable Role</label>
                    <select name="role_enabled" id="role_enabled" class="form-select" value="<?= isset($role[0]['role_enabled']) ? $role[0]['role_enabled'] : '' ?>">
                        <option></option>
                        <option value="1" <?= isset($role[0]['role_enabled']) && $role[0]['role_enabled'] == '1' ? 'selected' : '' ?>>Yes</option>
                        <option value="0" <?= isset($role[0]['role_enabled']) && $role[0]['role_enabled'] == '0' ? 'selected' : '' ?>>No</option>
                    </select>

                </div>
            </div>
            <div>
                <?php include("form-footer.php"); ?>
                <div id="err"></div>
                <button id="save_facility" onclick="saveRecord()" class="btn btn-primary mb-1">Submit</button>

    </form>
</div>
<script>
    function saveRecord() {
        $("#save_facility").text("Loading......");
        var dd = $("#form1").serialize();
        $.post("utilities.php", dd, function(re) {
                $("#save_facility").text("Save");
                console.log(re);
                if (re.response_code == 0) {
                    $("#save_facility").attr("disabled", true);
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: re.response_message,
                        timer: 2000,
                        showConfirmButton: false
                    })
                    setTimeout(() => {
                        getpage('role_list.php', 'page');
                        $('#defaultModalPrimary').modal('hide');
                    }, 1000)

                } else {
                    regenerateCORS();
                    Swal.fire({
                        icon: 'warning',
                        title: 'Error',
                        text: re.response_message,
                        confirmButtonColor: '#d33'
                    });
                    $("#warning").val("0");
                }

            }, 'json')
            .fail(function() {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'An error occurred while processing your request.',
                    confirmButtonColor: '#d33'
                });
            });
    }



    function fetchLga(el) {
        getRegions(el);
        $("#lga-fds").html("<option>Loading Lga</option>");
        $.post("utilities.php", {
            op: 'Church.getLga',
            state: el
        }, function(re) {
            $("#lga-fds").empty();
            $("#lga-fds").html(re.state);

        }, 'json');
        //        $.blockUI();
    }

    function getRegions(state_id) {
        $("#church_region_select").html("<option>Loading....</option>");
        $.post("utilities.php", {
            op: 'Church.getRegions',
            state: state_id
        }, function(re) {
            $("#church_region_select").empty();
            $("#church_region_select").html(re);

        });
    }

    function fetchAccName(acc_no) {
        if (acc_no.length == 10) {
            var account = acc_no;
            var bnk_code = $("#bank_name").val();
            $("#acc_name").text("Verifying account number....");
            $("#account_name").val("");
            $.post("utilities.php", {
                op: "Church.getAccountName",
                account_no: account,
                bank_code: bnk_code
            }, function(res) {

                $("#acc_name").text(res);
                $("#account_name").val(res);
            });
        } else {
            $("#acc_name").text("Account Number must be 10 digits");
        }

    }

    function display_icon(ee) {
        $("#icon-display").html(`<i class="${ee}"></i>`);
    }
</script>