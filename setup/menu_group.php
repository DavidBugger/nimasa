<?php
include_once("../libs/dbfunctions.php");
$dbobject = new dbobject();

// $sql_ch_type = "SELECT id,name FROM church_type";
// $church_type = $dbobject->db_query($sql_ch_type);

$sql_role = "SELECT * FROM role  order by role_name";
//$sql_role = "SELECT * FROM role";

$roles = $dbobject->db_query($sql_role);


// if (isset($_REQUEST['op']) && $_REQUEST['op'] == 'edit') {
//     $operation  = 'edit';
//     $id  = $_REQUEST['id'];
//     $sql_church = "SELECT * FROM church_type WHERE id = '$id'";
//     $church     = $dbobject->db_query($sql_church);
// } else {
//     $operation = 'new';
// }
// 
?>

<script>
    doOnLoad();
    var myCalendar;

    function doOnLoad() {
        myCalendar = new dhtmlXCalendarObject(["start_date"]);
        myCalendar.hideTime();
    }
</script>
<link rel="stylesheet" href="../css/jkanban.min.css" integrity="<?php echo $dbobject->CORS('../css/jkanban.min.css') ?>" crossorigin="<?php echo $crossorigin ?>">


<div class="modal-header">
    <h4 class="modal-title" style="font-weight:bold;">Menu Group Menu</h4>
    <!-- <button type="button" class="btn btn-primary" style="float:right !important; margin-left: 79%" data-bs-dismiss="modal" aria-label="Close"> -->
    <button type="button" class="btn-close bg-primary fw-bolder" data-bs-dismiss="modal" aria-label="Close"> </button>
</div>

<input type="hidden" name="operation" value="<?php echo $operation; ?>">

<div class="row">
    <div class="col-sm-12">
        <!--System Administrator-->
    </div>
</div>



<div class="row">
    <div class="col-sm-4">
        <div class="card flex-fill">
            <div class="card-header">
            </div>
            <div class="card-body d-flex">
                <select name="roles" id="role_id" onchange="loadMenus(this.value)" class="form-select">
                    <option value="">:: SELECT ROLE ::</option>
                    <?php
                    foreach ($roles as $row) {
                        echo "<option value='" . $row['role_id'] . "'>" . $row['role_name'] . "</option>";
                    }
                    ?>
                </select>
            </div>
        </div>
        <?php include("form-footer.php"); ?>
        <button id="save_facility" onclick="saveRecord()" class="btn btn-primary btn-block mx-4">Save</button>
    </div>

    <div class="col-sm-4">
        <div class="card flex-fill">
            <div class="card-header">
                <h5 class="card-title mb-0">Visible Menus </h5>
            </div>
            <div class="card-body d-flex">
                <form action="" id="form1" style="width:100%">
                    <div id="div1" class="form-group" ondrop="drop(event)" ondragover="allowDrop(event)">

                    </div>
                </form>
            </div>
        </div>

    </div>
    <div class="col-sm-4">
        <div class="card flex-fill">
            <div class="card-header">
                <h5 class="card-title mb-0">Invisible Menus</h5>
            </div>
            <div class="card-body d-flex">
                <form action="" style="width:100%">
                    <div id="div2" ondrop="drop(event)" ondragover="allowDrop(event)">

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>





<style>
    #div1 {
        width: 100%;
        height: 300px;
        margin: 10px;
        padding: 10px;
        overflow-y: scroll;
        border: 1px solid black;
    }

    #div2 {
        width: 100%;
        height: 300px;
        margin: 10px;
        overflow-y: scroll;
        padding: 10px;
        border: 1px solid black;
    }

    #div1 .form-group {
        background: #306450;
        color: #fff;
        padding: 10px
    }

    #div2 .form-group {
        background: #f44455;
        color: #fff;
        padding: 10px
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    function saveRecord() {
        var role = $("#role_id").val();
        if (role != "") {
            $("#save_facility").text("Loading......");
            var dd = $("#form1").serialize();
            console.log(dd);

            $.post("utilities.php?op=Menu.saveMenuGroup&role_id=" + $("#role_id").val(), dd, function(re) {
                $("#save_facility").text("Save");
                console.log(re);

                // Check the response and show a SweetAlert
                if (re.response_code == 0) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: re.response_message,
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: re.response_message,
                    });
                }
            }, 'json');
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: 'Please select a menu',
            });
        }
    }


    function loadMenus(el) {
        //        $.blockUI();
        $.post('utilities.php', {
            op: 'Menu.loadmenus',
            role_id: el
        }, function(res) {
            //            $.unblockUI();
            $('#div1').html(res.data.visible);
            $('#div2').html(res.data.invisible);
        }, 'json');
    }
</script>
<script>
    function allowDrop(ev) {
        ev.preventDefault();
    }

    function drag(ev) {
        ev.dataTransfer.setData("text", ev.target.id);
    }

    function drop(ev) {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("text");
        ev.target.appendChild(document.getElementById(data));
    }
</script>