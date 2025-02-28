<?php
include_once "templates/base.php";
require_once('libs/dbfunctions.php');
$dbobject = new dbobject();

$crossorigin = 'anonymous';
@session_start();
if (!isset($_SESSION['username_sess'])) {
	header('location: logout.php');
}

$username = $_SESSION['username_sess'];
$sql11 = "SELECT * FROM userdata where username = '$username'";
$login_user = $dbobject->db_query($sql11);
$role_name = $login_user[0]['role_name'];
$admin_name = $login_user[0]['firstname'] . " " .  $login_user[0]['lastname'];
require_once('class/menu.php');
$menu = new Menu();
$menu_list = $menu->generateMenu($_SESSION['role_id_sess']);
$roleId = $_SESSION['role_id_sess'];
$menu_list = $menu_list['data'];

// survey
$survey = "SELECT * FROM poll WHERE title = 'survey' order by id";
$survey_rslt = $dbobject->db_query($survey);
$total_survey = is_array($survey_rslt) ? count($survey_rslt) : 0;

// complaint
$complaint = "SELECT * FROM poll WHERE title = 'complaint' order by id";
$complaint_rslt = $dbobject->db_query($complaint);
$total_complaint = is_array($complaint_rslt) ? count($complaint_rslt) : 0;

// feedback
$feedback = "SELECT * FROM poll WHERE title = 'feedback' order by id";
$feedback_rslt = $dbobject->db_query($survey);
$total_feedback = is_array($feedback_rslt) ? count($feedback_rslt) : 0;

// total responses 
$responses = "SELECT * FROM poll  order by id";
$response_rslt = $dbobject->db_query($responses);
$total_response = is_array($response_rslt) ? count($response_rslt) : 0;



?>
<style>
	.filter {
		border: none !important;
	}

	.sidebar-link:hover {
		background: #ffff;
		color: #1e6092 !important;

	}

	.sidebar-link.active {
		background-color: #ffff !important;
		color: #1e6092 !important;
	}


	#categories:hover {
		transform: scale(0.95);
		transition: transform 0.3s ease-in-out;
	}

	label {
		font-weight: bold;
	}

	th {
		white-space: nowrap;
	}
</style>


<body>

	<div class="wrapper">
		<nav id="sidebar" class="sidebar">
			<div class="sidebar-content js-simplebar" style="background:linear-gradient(90deg, #1d80b8, #205a8a);">
				<a class="sidebar-brand" href="home.php" style="width: 100%;">
					<div class="row" style="margin-left:30px !important;">
						<img src="img/avatars/logo_servicom.png" class="img-fluid" alt="Servicom" style="width: 40% !important;height:auto !important;">
						<img src="img/avatars/nimasa_logo.png" class="img-fluid" alt="NIMASA" style="width: 35% !important; height:auto !important;">
					</div>
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
		<div class="main">
			<nav class="navbar navbar-expand navbar-bg">
				<a class="sidebar-toggle">
					<i class="hamburger align-self-center"></i>
				</a>
				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown">

						</li>
						<li class="nav-item dropdown">

						</li>
						<li class="nav-item nav-theme-toggle dropdown">

						</li>
						<li class="nav-item dropdown">

						</li>
						<li class="nav-item dropdown">

							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
								<img src="img/avatars/avatar.png" class="img-fluid rounded-circle me-1 mt-n2 mb-n2" alt="Dev Dave" width="40" height="40" /> <span class="text-primary">Dev Dave</span>
							</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class='dropdown-item' href='#' onclick="getpage('change_password.php', 'page')"><i class="align-middle me-1" data-lucide="user"></i> Profile</a>
								<a class="dropdown-item" href="logout.php">Sign out</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>

			<main class="content " id="page">
				<div class="container-fluid p-0">
					<div class="row mb-2 mb-xl-3">
						<div class="col-auto d-none d-sm-block">
							<h3>Dashboard</h3>
							<p>Here is an analytical report details</p>
						</div>

						<div class="col-auto ms-auto text-end mt-n1">
							<div class="row">
								<div class="col-md-4">
									<span class="fw-bolder">Filter By<span>
								</div>
								<div class="col-lg-4">
									<select name="" class="form-select filter" id="">
										<option value="" disabled selected>This Week</option>
									</select>
								</div>
								<div class="col-lg-4">
									<input type="date" class="form-control  filter">
								</div>
							</div>
							<!-- <div class="dropdown me-2 d-inline-block position-relative">
									<label for="select_session" style="margin-right:40px;">Filter By:</label>
									<select name="session_name" id="session_id" class="form-select" >
										<option value="" disabled> This Week</option>
										<?php foreach ($academic_sessions as $acad_session): ?>
											<option value="<?= $acad_session['academic_year']; ?>"><?= $acad_session['academic_year']; ?></option>
										<?php endforeach; ?>
									</select>
								
							</div>

							<button class="btn btn-primary shadow-sm">
								<i class="align-middle" data-lucide="filter">&nbsp;</i>
							</button>
							<button class="btn btn-primary shadow-sm">
								<i class="align-middle" data-lucide="refresh-cw">&nbsp;</i>
							</button> -->
						</div>
					</div>
					<div class="row">
						<div class="col-12 col-sm-6 col-xxl-3 d-flex">
							<div class="card flex-fill">
								<div class="card-body py-4">
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<p class="mb-2 text-muted fw-bolder " style="font-size: 16px;">Total Number of <br> Survey</p>
											<h3 class="mb-0 fw-bolder mt-4" style="font-size: 32px;"><?php echo $total_survey; ?></h3>
										</div>
										<div class="icon-container ms-3 mt-6">
											<img src="fonts/svg/survey.svg" alt="Survey">
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-12 col-sm-6 col-xxl-3 d-flex">
							<div class="card flex-fill">
								<div class="card-body py-4">
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<p class="mb-2 text-muted fw-bolder " style="font-size: 16px;">Total Number of Complaints</p>
											<h3 class="mb-0 fw-bolder mt-4" style="font-size: 32px;"><?php echo $total_complaint; ?></h3>
										</div>
										<div class="icon-container ms-3 mt-6">
											<img src="fonts/svg/complaints.svg" alt="Complaints">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-sm-6 col-xxl-3 d-flex">
							<div class="card flex-fill">
								<div class="card-body py-4">
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<p class="mb-2 text-muted fw-bolder " style="font-size: 16px;">Total Number of <br> Feeback</p>
											<h3 class="mb-0 fw-bolder mt-4" style="font-size: 32px;"><?php echo $total_feedback; ?></h3>
										</div>
										<div class="icon-container ms-3 mt-6">
											<img src="fonts/svg/feedback.svg" alt="Feedback">

										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-12 col-sm-6 col-xxl-3 d-flex">
							<div class="card flex-fill">
								<div class="card-body py-4">
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<p class="mb-2 text-muted fw-bolder " style="font-size: 16px;">Total Number of Responses</p>
											<h3 class="mb-0 fw-bolder mt-4" style="font-size: 32px;"><?php echo $total_response; ?></h3>
										</div>
										<div class="icon-container ms-3 mt-6">
											<img src="fonts/svg/responses.svg" alt="Responses">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12 col-sm-6 col-xxl-4 d-flex">
							<div class="card flex-fill">
								<div class="card-header text-center">
									<p class="mb-0" style="font-size: 18px; font-weight: bold;">Department with highest number of complaints</p>
								</div>
								<div class="card-body py-4">
									<div class="d-flex justify-content-center">
										<div class="chart chart-sm">
											<canvas id="chartjs-pie"></canvas>
										</div>
									</div>
									<div class="row text-center mt-3">
										<?php
										// Query to get department survey data
										$sql = "SELECT debtName, COUNT(*) AS department_survey
												FROM nimasa_dept_survey
												GROUP BY debtName
												ORDER BY department_survey DESC
												LIMIT 5";
										$result = $dbobject->db_query($sql);
										// Array of colors to use for each department
										$colors = ['#f77eb9', '#00a5e2', '#2a4d79', '#ffcd56', '#4bc0c0'];
										$colorIndex = 0;
										// Function to generate abbreviation
										function getAbbreviation($name)
										{
											$words = explode(' ', $name);
											$abbreviation = '';
											foreach ($words as $word) {
												$abbreviation .= strtoupper($word[0]);
												if (strlen($abbreviation) >= 3) {
													break;
												}
											}
											if (strlen($abbreviation) < 3) {
												$abbreviation = strtoupper(substr($words[0], 0, 3));
											}
											return $abbreviation;
										}
										// Prepare data for the chart
										$labels = [];
										$data = [];
										$colors = ['#e987a0', '#1198da', '#273e74', '#ffcd56', '#4bc0c0'];
										$colorIndex = 0;
										$backgroundColors = [];
										foreach ($result as $row) {
											$departmentName = $row['debtName'];
											$surveyCount = $row['department_survey'];
											// Get the abbreviation for the department name
											$abbreviation = getAbbreviation($departmentName);
											echo '
											<div class="col-md-4">
												<span style="display:inline-block; width: 12px; height: 12px; background-color:' . $colors[$colorIndex] . ';"></span> ' . $abbreviation . '
												<p class="mb-0" style="font-size: 24px; font-weight: bold;">' . $surveyCount . '</p>
												<p class="text-muted small">' . $departmentName . '</p>
											</div>';
											
											// Push data into JavaScript variables
											$labels[] = $abbreviation;
											$data[] = $surveyCount;
											$backgroundColors[] = $colors[$colorIndex];
											// Increment color index to get the next color for the next department
											$colorIndex++;
										}
										?>
									</div>
								</div>

							</div>
						</div>
						<div class="col-12 col-sm-6 col-xxl-4 d-flex">
							<div class="card flex-fill">
								<div class="card-header text-center">
									<p class="mb-0" style="font-size: 18px; font-weight: bold;">CSAT Chart</p>
								</div>
								<div class="card-body py-4">
									<div class="d-flex justify-content-center">
										<div class="chart chart-sm">
											<canvas id="chartjs-doughnut"></canvas>
										</div>
									</div>
									<div class="text-center my-3">
										<p class="mb-0" style="font-size: 40px; font-weight: bold;">1780</p>
										<p class="text-muted">Responses Received</p>
									</div>
									<div class="row text-center mt-3">
										<div class="col-md-4">
											<span style="display:inline-block; width: 50px; height: 12px; border-radius: 12px 13px; background-color:#3aaa35;"></span>Positive
											<p class="mb-0" style="font-size: 12px; margin-left: 9px; font-weight: bold;">
												<img src="img/avatars/success.png" alt="">
												580 <span class="text-info"> • 32.6%</span>
											</p>
										</div>
										<div class="col-md-4">
											<span style="display:inline-block; width: 50px; height: 12px; border-radius: 12px 13px; background-color:#f7c32e;"></span>Neutral
											<p class="mb-0" style="font-size: 12px; font-weight: bold;"><img src="img/avatars/neutral.png" alt=""> 196 <span class="text-info"> • 11.0%</span></p>

										</div>
										<div class="col-md-4">
											<span style="display:inline-block; width: 50px; height: 12px; border-radius: 12px 13px;  background-color:#f76d6d;"></span> Negative
											<p class="mb-0" style="font-size: 12px; font-weight: bold;"><img src="img/avatars/negative.png" alt=""> 1004 <span class="text-info"> • 56.4%</span></p>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="col-12 col-sm-6 col-xxl-4 d-flex">
							<div class="card flex-fill">
								<div class="card-header text-left">
									<p class="mb-0" style="font-size: 18px; font-weight: bold;">NPS CHART</p>
								</div>
								<div class="card-body py-4">
									<div class="text-left my-3">
										<div class="card" style="background:#f2f2f2; width: 250px; padding: 10px;">
											<p class="mb-0" style="font-size: 16px; font-weight: bold;">NPS SCORE</p>
											<p class="mb-0" style="font-size: 22px; font-weight: bold;">60% - 12% = 48%</p>
										</div>
									</div>

									<div class="row text-center mt-3">
										<div class="col-md-6">
											<p class="mb-0" style="background-color:#6aae2c; color: white; padding: 5px; font-weight: bold;">Promoters</p>
											<p class="mb-0" style="font-size: 24px; font-weight: bold;">205</p>
											<!-- <p class="text-muted small">% Promoters • 60%</p> -->
										</div>
										<div class="col-md-6">
											<p class="mb-0" style="background-color:#6aae2c; color: white; padding: 5px; font-weight: bold;">% Promoters</p>
											<p class="mb-0" style="font-size: 24px; font-weight: bold;">60%</p>
										</div>
									</div>
									<div class="row text-center mt-3">
										<div class="col-md-6">
											<p class="mb-0" style="background-color:#f7c301; color: white; padding: 5px; font-weight: bold;">Passives</p>
											<p class="mb-0" style="font-size: 24px; font-weight: bold;">134</p>
											<!-- <p class="text-muted small">% Passives • 28%</p> -->
										</div>
										<div class="col-md-6">
											<p class="mb-0" style="background-color:#f7c301; color: white; padding: 5px; font-weight: bold;">% Passives</p>
											<p class="mb-0" style="font-size: 24px; font-weight: bold;">28%</p>
										</div>
									</div>
									<div class="row text-center mt-3">
										<div class="col-md-6">
											<p class="mb-0" style="background-color:#ea2c04; color: white; padding: 5px; font-weight: bold;">Detractors</p>
											<p class="mb-0" style="font-size: 24px; font-weight: bold;">68</p>
											<!-- <p class="text-muted small">% Detractors • 12%</p> -->
										</div>
										<div class="col-md-6">
											<p class="mb-0" style="background-color:#ea2c04; color: white; padding: 5px; font-weight: bold;">% Detractors</p>
											<p class="mb-0" style="font-size: 24px; font-weight: bold;">12%</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>

			<footer class="footer" style="background:#eceff4;">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0"><?php echo DATE('Y') ?> &copy; Managed by Servicom Unit</p>
						</div>
						<div class="col-6 text-end">
							<p class="mb-0">
								Designed by ACCESS SOLUTIONS LIMITED</a>
							</p>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="js/app.js"></script>
	<script src="js/jquery.blockUI.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="assets/js/select2.min.js"></script>
	<script src="js/main.js"></script>


	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Bar chart
			new Chart(document.getElementById("chartjs-dashboard-bar"), {
				type: "bar",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "Last year",
						backgroundColor: window.cssVariables.primary,
						borderColor: window.cssVariables.primary,
						hoverBackgroundColor: window.cssVariables.primary,
						hoverBorderColor: window.cssVariables.primary,
						data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
						barPercentage: .325,
						categoryPercentage: .5
					}, {
						label: "This year",
						backgroundColor: window.cssVariables.primarySubtle,
						borderColor: window.cssVariables.primarySubtle,
						hoverBackgroundColor: window.cssVariables.primarySubtle,
						hoverBorderColor: window.cssVariables.primarySubtle,
						data: [69, 66, 24, 48, 52, 51, 44, 53, 62, 79, 51, 68],
						barPercentage: .325,
						categoryPercentage: .5
					}]
				},
				options: {
					maintainAspectRatio: false,
					cornerRadius: 15,
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							gridLines: {
								display: false
							},
							ticks: {
								stepSize: 20
							},
							stacked: true,
						}],
						xAxes: [{
							gridLines: {
								color: "transparent"
							},
							stacked: true,
						}]
					}
				}
			});
		});
	</script>
	<script>
		// Workaround for theme switch re-initialization issue
		var isTempusDominusInitialized = false;
		document.addEventListener("DOMContentLoaded", function() {
			if (isTempusDominusInitialized) {
				return;
			}
			isTempusDominusInitialized = true;
			new tempusDominus.TempusDominus(document.getElementById('calendar-dashboard'), {
				display: {
					inline: true,
					components: {
						clock: false,
						hours: false,
						minutes: false
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-dashboard-pie"), {
				type: "pie",
				data: {
					labels: ["Direct", "Affiliate", "E-mail", "Other"],
					datasets: [{
						data: [2602, 1253, 541, 1465],
						backgroundColor: [
							window.cssVariables.primary,
							window.cssVariables.warning,
							window.cssVariables.danger,
							"#E8EAED"
						],
					}]
				},
				options: {
					responsive: !window.MSInputMethodContext,
					maintainAspectRatio: false,
					cutoutPercentage: 70,
					legend: {
						display: false
					},
					elements: {
						arc: {
							borderWidth: 5,
							borderColor: window.cssVariables.secondaryBg
						}
					},
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			$("#datatables-dashboard-projects").DataTable({
				destroy: true,
				pageLength: 6,
				lengthChange: false,
				bFilter: false,
				autoWidth: false
			});
		});

		document.addEventListener("DOMContentLoaded", function() {
			// Get the data from PHP
			var labels = <?php echo json_encode($labels); ?>;
			var data = <?php echo json_encode($data); ?>;
			var backgroundColors = <?php echo json_encode($backgroundColors); ?>;

			// Pie chart
			new Chart(document.getElementById("chartjs-pie"), {
				type: "pie",
				data: {
					labels: labels,
					datasets: [{
						data: data,
						backgroundColor: backgroundColors,
						borderColor: "transparent"
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					}
				}
			});
		});

		document.addEventListener("DOMContentLoaded", function() {
			// Doughnut chart
			new Chart(document.getElementById("chartjs-doughnut"), {
				type: "doughnut",
				data: {
					labels: ["Positive", "Neutral", "Negative"],
					datasets: [{
						data: [260, 125, 54],
						backgroundColor: [
							'#e72b02',
							window.cssVariables.success,
							window.cssVariables.warning,
							"#E8EAED"
						],
						borderColor: "transparent"
					}]
				},
				options: {
					maintainAspectRatio: false,
					cutoutPercentage: 65,
					legend: {
						display: false
					}
				}
			});
		});
	</script>

</body>

</html>