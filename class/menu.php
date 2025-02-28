<?php
include_once("response.php");
class Menu extends dbobject
{
    private $response   = "";
    public function __construct()
    {
        $this->response = new Response();
    }
    public function generateMenu($role_id)
    {
        $output = array();
        $sub_menu = array();

        $sql = "select * from menu where menu_level='0' and menu_id in (select menu_id from menugroup where role_id ='$role_id') order by menu_id desc";
        $result = $this->db_query($sql);
        $count = (!empty($result)) ? count($result) : 0;
        if ($count > 0) {
            foreach ($result as $row) {
                $menu_id    = $row["menu_id"];
                $parent_id  = $row["parent_id"];
                $menu_level = $row["menu_level"];
                $icon       = $row['icon'];
                $url        = $row["menu_url"];
                $menu_name  = $row["menu_name"];

                $sql_2 = "select * from menu where parent_id = '$menu_id' and menu_id in (select menu_id from menugroup where role_id ='$role_id') order by menu_order";
                $result2 = $this->db_query($sql_2);
                $has_sub_menu = ($result2 > 0) ? true : false;
                if ($result2 > 0) {
                    foreach ($result2 as $row_1) {
                        $menu_id_1       = $row_1["menu_id"];
                        $menu_url_1       = $row_1["menu_url"];
                        $name             = $row_1["menu_name"];
                        $sub_menu[]       = array(
                            'menu_id'     => $menu_id_1,
                            'menu_url'    => $menu_url_1,
                            'name'        => $name
                        );
                    }
                }
                $output[] = array(
                    'menu_id'      => $menu_id,
                    'menu_name'    => $menu_name,
                    'parent_id'    => $parent_id,
                    'menu_level'   => $menu_level,
                    'icon'         => $icon,
                    'has_sub_menu' => $has_sub_menu,
                    'sub_menu'     => $sub_menu
                );
                $sub_menu = array();
            }
        }
        return array('response_code' => 0, 'data' => $output);
    }
    public function saveMenu($data)
    {

        $menu_name    = $data['menu_name'];
        $menu_url     = $data['menu_url'];
        $parent_menu  = $data['parent_id'];
        $parent_icon  = $data['icon'];
        $menu_level   = ($data['parent_id'] == "#") ? "0" : "1";
        $parent_menu2 = "";
        if ($data['operation'] == "new") {
            $menu_id      = $this->genMenuId();

            $sql = "insert into menu (menu_id,menu_name,menu_url,parent_id,parent_id2,menu_level,created,icon) values( '$menu_id','$menu_name','$menu_url','$parent_menu','$parent_menu2','$menu_level',now(),'$parent_icon')";
            $count = $this->db_query($sql, false);
            if ($count > 0) {
                return json_encode(array('response_code' => 0, 'response_message' => 'Menu Created Successfully'));
            } else {
                return json_encode(array('response_code' => 47, 'response_message' => 'Menu Creation Failed'));
            }
        } else {
            $menu_id      = $data['id'];
            $sql = "UPDATE menu SET menu_name = '$menu_name', menu_url='$menu_url', parent_id ='$parent_menu', menu_level='$menu_level',icon = '$parent_icon' WHERE menu_id = '$menu_id'";
            $count = $this->db_query($sql, false);
            if ($count > 0) {
                return json_encode(array('response_code' => 0, 'response_message' => 'Menu Updated Successfully'));
            } else {
                return json_encode(array('response_code' => 47, 'response_message' => 'No update made'));
            }
        }
    }
    public function genMenuId()
    {
        $sql    = "select max(menu_id)+1 as maximum from menu";
        $result = $this->db_query($sql);
        return $result[0]['maximum'];
    }
    public function loadParentMenu($data)
    {
        $sql    = "SELECT * FROM menu WHERE parent_id = '#'";
        $result = $this->db_query($sql);
        if (count($result) > 0) {
            $r = array();
            foreach ($result as $row) {
                $r[] = array($row['menu_id'], $row['menu_name']);
            }
            return $this->response->publishResponse(0, "parent menu found", $r, "array");
        } else {
            return $this->response->publishResponse("44", "No parent menu found", "", "array");
        }
    }

    public function deleteMenu($data)
    {
        $menu_id = $data['menu_id'];
        $sql     = "DELETE FROM menu WHERE menu_id = '$menu_id'";
        $this->db_query($sql, false);
        $sql     = "DELETE FROM menugroup WHERE menu_id = '$menu_id'";
        $this->db_query($sql, false);
        return $this->response->publishResponse("0", "Deleted successfully", "");
    }

    public function menuList($data)
    {
        $table_name    = "menu";
        $primary_key   = "menu_id";
        $columner = array(
            array('db' => 'menu_id', 'dt' => 0),
            //			array( 'db' => 'menu_id', 'dt' => 1 ),
            array('db' => 'menu_name',  'dt' => 1),
            array('db' => 'menu_url',  'dt' => 2),
            array('db' => 'parent_id',  'dt' => 3, 'formatter' => function ($d, $row) {
                return ($d == "#") ? "This is a Parent Menu" : $this->getitemlabel('menu', 'menu_id', $d, 'menu_name');
            }),
            //			array( 'db' => 'menu_level',  'dt' => 5 ),
            //			array( 'db' => 'menu_order',  'dt' => 6 ),
            array('db' => 'icon',  'dt' => 4),
            array(
                'db' => 'created',
                'dt' => 5,
                'formatter' => function ($d, $row) {
                    return $d;
                }
            ),
            array('db' => 'menu_id',  'dt' => 6, 'formatter' => function ($d, $row) {

                return '<a class="btn btn-success" onclick="loadModal(\'setup/menu_setup.php?op=edit&menu_id=' . $d . '\',\'modal_div\')"  href="javascript:void(0)" data-toggle="modal" data-target="#defaultModalPrimary" style="background:#074c88; border: none !important;"><svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg> Edit</a> | <a class="btn btn-danger" onclick="deleteMenu(\'' . $d . '\')"  href="javascript:void(0)" >
                <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg> Delete</a>';
            })

        );
        $filter = "";
        //		$filter = " AND role_id='001'";
        $datatableEngine = new engine();

        echo $datatableEngine->generic_table($data, $table_name, $columner, $primary_key, $filter);
    }

    public function loadmenus($data)
    {
        $role_id = $data['role_id'];
        $visible = $this->visibleMenus($role_id);
        $invisible = $this->inVisibleMenus($role_id);
        return json_encode(array('response_code' => 0, 'response_message' => 'Menu Created Successfully', 'data' => array('visible' => $visible, 'invisible' => $invisible)));
    }

    private function visibleMenus($role_id)
    {
        $sql     = "SELECT menu_id,menu_name FROM menu WHERE menu_id IN (SELECT menu_id FROM menugroup WHERE role_id = '$role_id') order by menu_name";
        $result  = $this->db_query($sql);
        $visible = '';
        $count = (!empty($result)) ? count($result) : 0;
        if ($count > 0) {
            foreach ($result as $row) {
                $visible = $visible . '<div class="form-group" draggable="true" ondragstart="drag(event)" id="tt' . $row['menu_id'] . '">
                          <div>' . $row['menu_name'] . '</div>
                          <input type="hidden" name="menus[]" value="' . $row['menu_id'] . '" class="form-group" />
                      </div>';
            }
        }

        return $visible;
    }

    private function inVisibleMenus($role_id)
    {
        $sql     = "SELECT menu_id,menu_name FROM menu WHERE menu_id NOT IN (SELECT menu_id FROM menugroup WHERE role_id = '$role_id') order by menu_name";
        $result  = $this->db_query($sql);
        $invisible = '';
        if (count($result) > 0) {
            foreach ($result as $row) {
                $invisible = $invisible . '<div class="form-group" draggable="true" ondragstart="drag(event)" id="tt' . $row['menu_id'] . '">
                          <div>' . $row['menu_name'] . '</div>
                          <input type="hidden" name="menus[]" value="' . $row['menu_id'] . '" class="form-group" />
                      </div>';
            }
        }
        return $invisible;
    }
    public function saveMenuGroup($data)
    {
        $role_id = $data['role_id'];
        $sql = "DELETE FROM menugroup WHERE role_id = '$role_id'";
        $this->db_query($sql, false);
        foreach ($data['menus'] as $value) {
            $sql = "INSERT INTO menugroup (role_id,menu_id) VALUES('$role_id','$value')";
            $this->db_query($sql, false);
        }
        return json_encode(array('response_code' => 0, 'response_message' => 'Menu Role saved Successfully'));
    }
}
