<%@ page import="entity.ConferenceRoom" %>
<%@ page import="dao.ConferenceRoomDao" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.UserDao" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="fixed">
<head>

	<!-- Basic -->
	<meta charset="UTF-8">

	<title>会议室使用情况</title>
	<meta name="keywords" content="HTML5 Admin Template" />
	<meta name="description" content="Porto Admin - Responsive HTML5 Template">
	<meta name="author" content="okler.net">

	<!-- Mobile Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

	<!-- Web Fonts  -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

	<!-- Vendor CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
	<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

	<!-- Specific Page Vendor CSS -->
	<link rel="stylesheet" href="assets/vendor/morris/morris.css" />

	<!-- Theme CSS -->
	<link rel="stylesheet" href="assets/stylesheets/theme.css" />

	<!-- Skin CSS -->
	<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

	<!-- Head Libs -->
	<script src="assets/vendor/modernizr/modernizr.js"></script>

</head>
<body>
<section class="body">

	<!-- start: header -->
	<header class="header">
		<div class="logo-container">
			<a href="../" class="logo">
				<img src="assets/images/logo.png" height="35" alt="Porto Admin" />
			</a>
			<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
				<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
			</div>
		</div>

		<!-- start: search & user box -->
		<div class="header-right">

			<span class="separator"></span>

			<div id="userbox" class="userbox">
				<a href="#" data-toggle="dropdown">
					<figure class="profile-picture">
						<img src="assets/images/!logged-user.jpg" alt="Joseph Doe" class="img-circle" data-lock-picture="assets/images/!logged-user.jpg" />
					</figure>
					<%
						UserDao userDao=new UserDao();
						String id_str = request.getSession().getAttribute("userID").toString();
						int id = Integer.parseInt(id_str);
						Object userInfo[] = userDao.getUserInfo(id);
					%>
					<div class="profile-info" data-lock-name=<%=userInfo[1]%> data-lock-email=<%=userInfo[3]%>>
						<span class="name"><%=userInfo[1]%></span>
						<span class="role"><%=userInfo[3]%></span>
					</div>

					<i class="fa custom-caret"></i>
				</a>

				<div class="dropdown-menu">
					<ul class="list-unstyled">
						<li class="divider"></li>
						<li>
							<a role="menuitem" tabindex="-1" href="#" data-lock-screen="true"><i class="fa fa-lock"></i> 锁屏</a>
						</li>
						<li>
							<a role="menuitem" tabindex="-1" href="pages-signin.jsp"><i class="fa fa-power-off"></i> 登出</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- end: search & user box -->
	</header>
	<!-- end: header -->

	<div class="inner-wrapper">
		<!-- start: sidebar -->
		<aside id="sidebar-left" class="sidebar-left">

			<div class="sidebar-header">
				<div class="sidebar-title">
					浅草会议
				</div>
				<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
					<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
				</div>
			</div>

			<div class="nano">
				<div class="nano-content">
					<nav id="menu" class="nav-main" role="navigation">
						<ul class="nav nav-main">
							<li>
								<a href="pages-search-results.jsp">
									<i class="fa fa-tasks" aria-hidden="true"></i>
									<span>权限设置</span>
								</a>
							</li>
							<li>
								<a href="ui-elements-portlets.jsp">
									<i class="fa fa-list-alt"></i>
									<span>会议预定审核</span>
								</a>
							</li>
							<li>
								<a href="tables-editable.jsp">
									<i class="fa fa-columns"></i>
									<span>会议室控制中心</span>
								</a>
							</li>
							<li class="nav-active">
								<a href="ui-elements-charts.jsp">
									<i class="fa fa-table"></i>
									<span>会议室使用情况</span>
								</a>
							</li>

						</ul>
					</nav>

				</div>

			</div>

		</aside>
		<!-- end: sidebar -->

		<section role="main" class="content-body">
			<header class="page-header">
				<h2>会议室使用情况</h2>

				<div class="right-wrapper pull-right">
					<ol class="breadcrumbs">
						<li>
							<a href="index.html">
								<i class="fa fa-home"></i>
							</a>
						</li>
						<li><span>会议室使用情况</span></li>
					</ol>

					<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
				</div>
			</header>

			<!-- start: page -->
			<h2 class="mt-none">图表展示</h2>
			<p class="mb-lg">Flot is a pure JavaScript plotting library for jQuery, with a focus on simple usage, attractive looks and interactive features.</p>

			<div class="row">
				<div class="col-md-12">
					<section class="panel">
						<header class="panel-heading">
							<div class="panel-actions">
								<a href="#" class="fa fa-caret-down"></a>
								<a href="#" class="fa fa-times"></a>
							</div>

							<h2 class="panel-title">会议室使用情况</h2>
							<p class="panel-subtitle">You don't have to do much to get an attractive plot. Create a placeholder, make sure it has dimensions (so Flot knows at what size to draw the plot), then call the plot function with your data.</p>
						</header>

						<div class="panel-body">

							<!-- Flot: Basic -->
							<div class="chart chart-md" id="flotBasic"></div>
							<script type="text/javascript">
								var flotBasicData = [{
									data: [
										[8, 17],
										[9, 16],
										[10, 17],
										[11, 18],
										[12, 14],
										[13, 11],
										[14, 12],
										[15, 16],
										[16, 17],
										[17, 12],
										[18, 12]
									],
									label: "空闲中",
									color: "#0088cc"
								}, {
									data: [
										[8, 11],
										[9, 12],
										[10, 11],
										[11, 12],
										[12, 11],
										[13, 8],
										[14, 10],
										[15, 14],
										[16, 14],
										[17, 10],
										[18, 11]
									],
									label: "使用中",
									color: "#2baab1"
								}, {
									data: [
										[8, 4],
										[9, 4],
										[10, 4],
										[11, 4],
										[12, 4],
										[13, 3],
										[14, 2],
										[15, 6],
										[16, 7],
										[17, 2],
										[18, 2]
									],
									label: "维修中",
									color: "#734ba9"
								}];
								// See: assets/javascripts/ui-elements/examples.charts.js for more settings.
							</script>

						</div>
					</section>
				</div>

			</div>

			<div class="row">
				<div class="col-md-12">
					<section class="panel">
						<header class="panel-heading">
							<div class="panel-actions">
								<a href="#" class="fa fa-caret-down"></a>
								<a href="#" class="fa fa-times"></a>
							</div>

							<h2 class="panel-title">会议室状态</h2>
							<p class="panel-subtitle">从左到右分别为.</p>
							<%
								ConferenceRoomDao dao=new ConferenceRoomDao();
								List<ConferenceRoom> list =dao.getAllData();
								int i=0,total=0, freerate=0;
								String sta="free";
								for(ConferenceRoom cl:list)
								{
									System.out.println(cl.getStatus());
									if(sta.equals(cl.getStatus()))
										i=i+1;
									total=total+1;
								}
								System.out.println(i);
								if(total==0)
									freerate=0;
								else
									freerate=i*100/total;
							%>
						</header>
						<div class="panel-body">
							<div class="row text-center">
								<div class="col-md-3">
									<div class="circular-bar">
										<div class="circular-bar-chart" data-percent="<%=freerate%>>" data-plugin-options='{ "barColor": "#0088CC", "delay": 300 }'>
											<strong>空闲中</strong>
											<label><span class="percent">52</span>%</label>
										</div>
									</div>
								</div>
								<%
									int j=0, busyrate=0;
									total=0;
									String stb="busy";
									for(ConferenceRoom cl:list)
									{
										System.out.println(cl.getStatus());
										if(stb.equals(cl.getStatus()))
											j=j+1;
										total=total+1;
									}
									System.out.println(j);
									if(total==0)
										busyrate=0;
									else
										busyrate=j*100/total;
								%>
								<div class="col-md-3">
									<div class="circular-bar">
										<div class="circular-bar-chart" data-percent="<%=busyrate%>>" data-plugin-options='{ "barColor": "#2BAAB1", "delay": 600 }'>
											<strong>使用中</strong>
											<label><span class="percent">45</span>%</label>
										</div>
									</div>
								</div>
								<%
									int k=0, repairrate=0;
									total=0;
									String stc="repair";
									for(ConferenceRoom cl:list)
									{
										if(stc.equals(cl.getStatus()))
											k=k+1;
										total=total+1;
									}
									System.out.println(k);
									if(total==0)
										repairrate=0;
									else
										repairrate=k*100/total;
								%>
								<div class="col-md-3">
									<div class="circular-bar">
										<div class="circular-bar-chart" data-percent="<%=repairrate%>>" data-plugin-options='{ "barColor": "#734ba9", "delay": 600 }'>
											<strong>维修中</strong>
											<label><span class="percent">3</span>%</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
			<!-- end: page -->
		</section>
	</div>

	<aside id="sidebar-right" class="sidebar-right">
		<div class="nano">
			<div class="nano-content">
				<a href="#" class="mobile-close visible-xs">
					Collapse <i class="fa fa-chevron-right"></i>
				</a>

				<div class="sidebar-right-wrapper">

					<div class="sidebar-widget widget-calendar">
						<h6>Upcoming Tasks</h6>
						<div data-plugin-datepicker data-plugin-skin="dark" ></div>

						<ul>
							<li>
								<time datetime="2014-04-19T00:00+00:00">04/19/2014</time>
								<span>Company Meeting</span>
							</li>
						</ul>
					</div>

					<div class="sidebar-widget widget-friends">
						<h6>Friends</h6>
						<ul>
							<li class="status-online">
								<figure class="profile-picture">
									<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
								</figure>
								<div class="profile-info">
									<span class="name">Joseph Doe Junior</span>
									<span class="title">Hey, how are you?</span>
								</div>
							</li>
							<li class="status-online">
								<figure class="profile-picture">
									<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
								</figure>
								<div class="profile-info">
									<span class="name">Joseph Doe Junior</span>
									<span class="title">Hey, how are you?</span>
								</div>
							</li>
							<li class="status-offline">
								<figure class="profile-picture">
									<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
								</figure>
								<div class="profile-info">
									<span class="name">Joseph Doe Junior</span>
									<span class="title">Hey, how are you?</span>
								</div>
							</li>
							<li class="status-offline">
								<figure class="profile-picture">
									<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
								</figure>
								<div class="profile-info">
									<span class="name">Joseph Doe Junior</span>
									<span class="title">Hey, how are you?</span>
								</div>
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</aside>
</section>

<!-- Vendor -->
<script src="assets/vendor/jquery/jquery.js"></script>
<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Specific Page Vendor -->
<script src="assets/vendor/jquery-appear/jquery.appear.js"></script>
<script src="assets/vendor/jquery-easypiechart/jquery.easypiechart.js"></script>
<script src="assets/vendor/flot/jquery.flot.js"></script>
<script src="assets/vendor/flot-tooltip/jquery.flot.tooltip.js"></script>
<script src="assets/vendor/flot/jquery.flot.pie.js"></script>
<script src="assets/vendor/flot/jquery.flot.categories.js"></script>
<script src="assets/vendor/flot/jquery.flot.resize.js"></script>
<script src="assets/vendor/jquery-sparkline/jquery.sparkline.js"></script>
<script src="assets/vendor/raphael/raphael.js"></script>
<script src="assets/vendor/morris/morris.js"></script>
<script src="assets/vendor/gauge/gauge.js"></script>
<script src="assets/vendor/snap-svg/snap.svg.js"></script>
<script src="assets/vendor/liquid-meter/liquid.meter.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="assets/javascripts/theme.js"></script>

<!-- Theme Custom -->
<script src="assets/javascripts/theme.custom.js"></script>

<!-- Theme Initialization Files -->
<script src="assets/javascripts/theme.init.js"></script>


<!-- Examples -->
<script src="assets/javascripts/ui-elements/examples.charts.js"></script>
</body>
</html>