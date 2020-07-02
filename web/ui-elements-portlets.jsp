<%@ page import="entity.Conference" %>
<%@ page import="dao.ConferenceDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="dao.UserDao" %>
<%@ page import="entity.ConferenceRoom" %>
<%@ page import="dao.ConferenceRoomDao" %>

<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>预定审核</title>
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
		<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />

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
									<li class="nav-active">
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
									<li>
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
						<h2>会议预定审核</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="tables-advanced.jsp">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>会议预定审核</span></li>
							</ol>
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<h3 class="mt-none">会议预定审核</h3>
					<p>
						你可以在这里查看会议发起者提交的会议预定申请，并进行审核。
					</p>
					<p>
						<button id="portletRefresh" type="button" class="mb-xs mt-xs mr-xs btn btn-default"><i class="fa fa-refresh"></i> Refresh</button>
						<button id="portletReset" type="button" class="mb-xs mt-xs mr-xs btn btn-default"><i class="fa fa-undo"></i> Reset</button>
					</p>

					<div class="row">
						<div class="col-md-4" data-plugin-portlet id="portlet-1">

							<%
								ConferenceDao dao = new ConferenceDao();
								ConferenceRoomDao crDao = new ConferenceRoomDao();
								List<Conference> conferences = dao.getUnreviewedConference();
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
								for (Conference x:conferences){
							%>
							<section class="panel panel-primary" id="panel-1" data-portlet-item>
								<header class="panel-heading portlet-handler">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title"><%=x.getConferenceName()%></h2>
								</header>
								<div class="panel-body">
									<label>申请人：<%=userDao.getNameById(x.getHostId()+"")%></label><br>
									<label>举办部门：<%=x.getHostDepartment()%></label><br>
									<label>会议室：<%=crDao.getNameByID(x.getMrId())%></label><br>
									<label>会议时间：<%=x.getStartTime()+"-"+x.getEndTime()%></label><br>
									<div class="col-md-3"></div>
									<div class="col-md-2"></div>
									<form method="post">
											<button type="button" class="mb-xs mt-xs mr-xs btn btn-success"  onclick="pass(<%=x.getConferenceId()%>)">通过</button>
                                            <button type="button" class="mb-xs mt-xs mr-xs btn btn-danger" onclick="reject(<%=x.getConferenceId()%>)">不通过</button>
											<script>
												function pass(value) {
													window.location.href = "servlet.reviewConf?caozuo=pass&id="+value;
												}
												function reject(value) {
													window.location.href = "servlet.reviewConf?caozuo=reject&id="+value;
												}
											</script>
									</form>

								</div>
							</section>
							<%}%>
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
		<script src="assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
		<script src="assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
		<script src="assets/vendor/store-js/store.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>


		<!-- Examples -->
		<script src="assets/javascripts/ui-elements/examples.portlets.js"></script>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>