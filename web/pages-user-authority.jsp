<%@ page import="dao.UserDao" %>
<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>权限设置</title>
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
					<a href="pages-search-results.jsp" class="logo">
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
									<li class="nav-active">
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
						<h2>权限设置</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="pages-search-results.jsp">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>权限设置</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->

					<div class="row">
						<div class="col-md-4 col-lg-3">
							<%
								int setid = Integer.parseInt(request.getParameter("id"));
								Object Info[] = userDao.getUserInfo(setid);
							%>
							<section class="panel">
								<div class="panel-body">
									<div class="thumb-info mb-md">
										<img src="assets/images/!logged-user.jpg" class="rounded img-responsive" alt="John Doe">
										<div class="thumb-info-title">
											<span class="thumb-info-inner" ><%=Info[1]%></span>
											<span class="thumb-info-type"><%=Info[4]%></span>
										</div>
									</div>

									

									<hr class="dotted short">

									<h6 class="text-muted">关于</h6>
									<p><%=Info[5]%></p>
									<div class="clearfix">
										<a class="text-uppercase text-muted pull-right" href="#">(View All)</a>
									</div>

									<hr class="dotted short">

									<div class="social-icons-list">
										<a rel="tooltip" data-placement="bottom" target="_blank" href="http://www.facebook.com" data-original-title="Facebook"><i class="fa fa-facebook"></i><span>Facebook</span></a>
										<a rel="tooltip" data-placement="bottom" href="http://www.twitter.com" data-original-title="Twitter"><i class="fa fa-twitter"></i><span>Twitter</span></a>
										<a rel="tooltip" data-placement="bottom" href="http://www.linkedin.com" data-original-title="Linkedin"><i class="fa fa-linkedin"></i><span>Linkedin</span></a>
									</div>

								</div>
							</section>						
						</div>
						<div class="col-md-8 col-lg-6">
					
									<div id="edit">

										<form class="form-horizontal" name="Iden" action="servlet.IdentitySettingServlet" method="post">
											<h4 class="mb-xlg">个人信息</h4>
											<fieldset>
												<form id="testid" action="servlet.IdentitySettingServlet" method="get">
													<div class="form-group">
														<label class="col-md-3 control-label" for="profileID">ID</label>
														<div class="col-md-8">
															<input type="text" class="form-control" id="profileID" value="<%=setid%>" name="ID">
														</div>
														<script>
															function test() {
																document.Iden.action = "servlet.IdentitySettingServlet";
																document.Iden.submit();
															}
														</script>
												</div>
												</form>


												<div class="form-group">
													<label class="col-md-3 control-label" for="profileName">姓名</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileName" value="<%=Info[1]%>" readonly>
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label" for="profileDep">部门</label>
													<div class="col-md-8">
														<input type="text" class="form-control" id="profileDep" value="<%=Info[2]%>" readonly>
													</div>
												</div>												
												<div class="form-group">
													<label class="col-md-3 control-label" >权限设置</label>
													<div class="col-md-8">
														<div class="radio-custom radio-primary">
															<input id="administrator" type="radio" value="administrator" name="indentity" required>
															<label for="administrator">管理员</label>
														</div>
														<div class="radio-custom radio-primary">
															<input id="initiator" type="radio" value="initiator" name="indentity" required>
															<label for="initiator">会议发起者</label>
														</div>
														<div class="radio-custom radio-primary">
															<input id="attendee" type="radio" value="attendee" name="indentity" required>
															<label for="attendee">参会者</label>
														</div>
													</div>
												</div>
											</fieldset>
											
											<hr class="dotted tall">
											
											<div class="panel-footer">
												<div class="row">
													<div class="col-md-9 col-md-offset-3">
														<button type="submit" class="btn btn-primary" onclick="test()">提交</button>
														<button type="cancel" class="btn btn-default" onclick="javascript:history.go(-2);">取消</button>
													</div>
												</div>
											</div>
											<%--<%
												session.removeAttribute("testName");
												session.removeAttribute("testDep");
											%>--%>
										</form>

									</div>
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
		<script src="assets/vendor/jquery-autosize/jquery.autosize.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>

	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>