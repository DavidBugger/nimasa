<?php

class Role extends dbobject
{
    public function role_list($data)
    {
        $table_name    = "role";
        $primary_key   = "role_id";
        $columner = array(
            array('db' => 'role_id', 'dt' => 0),
            array('db' => 'role_name', 'dt' => 1),
            array(
                'db' => 'created',
                'dt' => 2,
                'formatter' => function ($d, $row) {
                    return $d;
                }
            ),
            array(
                'db' => 'role_id',
                'dt' => 3,
                'formatter' => function ($d, $row) {
                    $sql = "SELECT * FROM userdata WHERE role_id = '$d'";
                    $sql_rslt = $this->db_query($sql);
                    $usernameCount = is_array($sql_rslt) ? count($sql_rslt) : 0;
                    return $usernameCount; 
                }
            ),
            array('db' => 'role_id',  'dt' => 4, 'formatter' => function ($d, $row) {

                return '<a class="btn btn-success" onclick="loadModal(\'setup/role_setup.php?op=edit&role_id=' . $d . '\',\'modal_div\')"  href="javascript:void(0)" data-toggle="modal" data-target="#defaultModalPrimary" style="background:#074c88; border: none !important;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="10" fill="white" viewBox="0 0 576 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z"/></svg> view</a> ';
            })
            
           
        );
        $filter = "";
        $filter = " AND role_id <> '001'";
        $datatableEngine = new engine();

        echo $datatableEngine->generic_table($data, $table_name, $columner, $primary_key, $filter);
    }
    public function saveRole($data)
    {
        $validation = $this->validate($data, array('role_name' => 'required', 'role_enabled' => 'required|int'), array('role_name' => 'Role Name', 'role_enabled' => 'Enable Role'));
        if (!$validation['error']) {
            $data['created'] = date('Y-m-d h:i:s');

            if ($data['operation'] == "new") {
                $data['role_id'] = str_pad($this->getnextid('role'), 3, "0000000000000000", STR_PAD_LEFT);
                // $data['role_enabled'] = "1";
                $count = $this->doInsert('role', $data, array('op', 'operation', 'id', 'nrfa-csrf-token-label'));
                if ($count > 0) {
                    return json_encode(array('response_code' => 0, 'response_message' => 'Role Created Successfully'));
                } else {
                    return json_encode(array('response_code' => 291, 'response_message' => 'Role Could not be Created'));
                }
            } else {
                $count = $this->doUpdate('role', $data, array('nrfa-csrf-token-label'), array('role_id' => $data['role_id']));
                if ($count > 0) {
                    return json_encode(array('response_code' => 0, 'response_message' => 'Role Update Successfully'));
                } else {
                    return json_encode(array('response_code' => 291, 'response_message' => 'Role Could not be Updated'));
                }
            }
        } else {
            return json_encode(array("response_code" => 34, "response_message" => $validation['messages'][0]));
        }
    }
    public function getNextRoleId()
    {
        $sql    = "select CONCAT('00',max(role_id) +1) as rolee FROM role";
        $result = $this->db_query($sql);
        return $result[0]['rolee'];
    }
}
