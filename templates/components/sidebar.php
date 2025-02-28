<nav id="sidebar" class="sidebar">
    <div class="sidebar-content js-simplebar" style="background:#fff !important;">
        <a class="sidebar-brand" href="home.php" style="width: 100%;">
            <img src="img\avatars\edu-logo-white.png" alt="DESDL" width="40%">
            <h2 class="text-center text-white">FCT Education</h2>
        </a>
        <ul class="sidebar-nav">
            <li class="sidebar-item">
                <a href="home.php" class="sidebar-link sidebar-link-active">
                    <i class="align-middle"></i> <span class="align-middle">Dashboard</span>
                    <span class="badge badge-sidebar-primary"></span>
                </a>
            </li>
            <?php foreach ($menu_list as $value) :
                if ($value['has_sub_menu'] == false) : ?>
                    <li class="sidebar-item">
                        <a href="javascript:getpage('<?php echo $value['menu_url'] ?>','page')" class="sidebar-link sidebar-link-active">
                            <i class="align-middle" data-feather="sliders"></i> <span class="align-middle"><?php echo ucfirst($value['menu_name']) ?></span>
                            <span class="badge badge-sidebar-primary"></span>
                        </a>
                    </li>
                <?php elseif ($value['has_sub_menu'] == true) : ?>
                    <li class="sidebar-item" id="<?php echo $value['menu_id'] ?>">
                        <a data-bs-target="#l<?php echo $value['menu_id'] ?>" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="sliders"></i> <span class="align-middle"><?php echo ucfirst($value['menu_name']) ?></span>
                        </a>
                        <ul id="l<?php echo $value['menu_id'] ?>" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <?php foreach ($value['sub_menu'] as $value_1) : ?>
                                <li class="sidebar-item" id="<?php echo $value_1['menu_id'] ?>"><a class="sidebar-link sidebar-link-active" href="javascript:loadNavPage('<?php echo $value_1['menu_url'] ?>','page', '<?php echo $value_1['menu_id'] ?>')"><?php echo ucfirst($value_1['name']) ?></a></li>
                            <?php endforeach; ?>
                        </ul>
                    </li>
            <?php endif;
            endforeach; ?>
        </ul>
    </div>
    <!-- <button class="btn btn-primary">Log out</button> -->
</nav>