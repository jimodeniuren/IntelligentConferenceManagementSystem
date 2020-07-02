<%@ page import="dao.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.ArrayList" %>

<!doctype html>
<html class="fixed search-results">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>权限设置</title>
    <meta name="keywords" content="HTML5 Admin Template"/>
    <meta name="description" content="Porto Admin - Responsive HTML5 Template">
    <meta name="author" content="okler.net">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <!-- Web Fonts  -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
          rel="stylesheet" type="text/css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css"/>
    <link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css"/>
    <link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css"/>

    <!-- Theme CSS -->
    <link rel="stylesheet" href="assets/stylesheets/theme.css"/>

    <!-- Skin CSS -->
    <link rel="stylesheet" href="assets/stylesheets/skins/default.css"/>

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
                <img src="assets/images/logo.png" height="35" alt="Porto Admin"/>
            </a>
            <div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html"
                 data-fire-event="sidebar-left-opened">
                <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
            </div>
        </div>

        <!-- start: search & user box -->
        <div class="header-right">

            <span class="separator"></span>

            <div id="userbox" class="userbox">
                <a href="#" data-toggle="dropdown">
                    <figure class="profile-picture">
                        <img src="assets/images/!logged-user.jpg" alt="Joseph Doe" class="img-circle"
                             data-lock-picture="assets/images/!logged-user.jpg"/>
                    </figure>
                    <%
                        UserDao userDao = new UserDao();
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
                            <a role="menuitem" tabindex="-1" href="#" data-lock-screen="true"><i class="fa fa-lock"></i>
                                锁屏</a>
                        </li>
                        <li>
                            <a role="menuitem" tabindex="-1" href="pages-signin.jsp"><i class="fa fa-power-off"></i>
                                登出</a>
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
                <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html"
                     data-fire-event="sidebar-left-toggle">
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
                <h2>查找结果</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="index.html">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>权限设置</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->
            <div class="search-content">
                <div class="search-control-wrapper">
                    <form action="servlet.SelectServlet" method="post">
                        <div class="form-group mb-lg">
                            <input name="insertid" type="search" style="width:250px;Float:left;" class="form-control"
                                   placeholder="请输入用户ID" aria-controls="datatable-default"/>
                            <button type="submit" class="btn btn-primary hidden-xs"
                                    formaction="servlet.SelectServlet?caozuo=search" style="Float:left;">查找
                            </button>
                            <button type="submit" class="btn btn-default" style="Float:left;">显示全部</button>
                        </div>
                    </form>
                </div>
                <div class="search-toolbar">
                    <ul class="list-unstyled nav nav-pills">
                        <li class="active">
                            <a href="#everything" data-toggle="tab">详细信息</a>
                        </li>
                        <li>
                            <a href="#medias" data-toggle="tab">头像</a>
                        </li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div id="everything" class="tab-pane active">
                        <p class="total-results text-muted"></p>
                        <ul class="list-unstyled search-results-list">
                            <%
                                if (request.getSession().getAttribute("list") != null) {
                                    ArrayList list = (ArrayList) request.getSession().getAttribute("list");
                                    System.out.println(list);
                                    for (Object i : list) {
                                        User u = (User) i;
                            %>
                            <li>
                                <p class="result-type">
                                    <span class="label label-primary"><%=u.getUserIdentity()%></span>
                                </p>
                                <a href="pages-user-authority.jsp?id=<%=u.getUserID()%>" class="has-thumb">
                                    <div class="result-thumb">
                                        <img src="assets/images/!logged-user.jpg" alt="John Doe"/>
                                    </div>
                                    <div class="result-data">
                                        <p class="h3 title text-primary"><%=u.getUserName()%>
                                        </p>
                                        <p class="description">
                                            <label>ID：</label><label><%=u.getUserID()%>
                                        </label><br>
                                            <label>邮箱：</label><label><%=u.getUserEmail()%>
                                        </label><br>
                                            <label>部门：</label><label><%=u.getUserDepartment()%>
                                        </label><br>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <%
                                    }
                                }
                            %>
                        </ul>

                        <hr class="solid mb-none"/>
                    </div>
                    <div id="medias" class="tab-pane">
                        <div class="row">
                            <%
                                if (request.getSession().getAttribute("list") != null) {
                                    ArrayList list = (ArrayList) request.getSession().getAttribute("list");
                                    System.out.println(list);
                                    for (Object i : list) {
                                        User u = (User) i;
                            %>
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="thumbnail">
                                    <div class="thumb-preview">
                                        <a a href="pages-user-authority.jsp?id=<%=u.getUserID()%>" class="thumb-image" href="#">
                                            <img src="assets/images/projects/project-2.jpg" class="img-responsive"
                                                 alt="Project">
                                        </a>
                                    </div>
                                    <h5 class="mg-title text-semibold"><%=u.getUserName()%><small><%=u.getUserIdentity()%>
                                    </small></h5>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                    <div id="emails" class="tab-pane">
                        <p>Recent</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat.</p>
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
                        <h6>接下来的会议</h6>
                        <div data-plugin-datepicker data-plugin-skin="dark"></div>

                        <ul>
                            <li>
                                <time datetime="2020-07-19T00:00+00:00">04/19/2014</time>
                                <span>企划会议</span>
                            </li>
                        </ul>
                    </div>

                    <div class="sidebar-widget widget-friends">
                        <h6>好友</h6>
                        <ul>
                            <li class="status-online">
                                <figure class="profile-picture">
                                    <img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                                </figure>
                                <div class="profile-info">
                                    <span class="name">李大嘴</span>
                                    <span class="title">吃了吗您？</span>
                                </div>
                            </li>
                            <li class="status-online">
                                <figure class="profile-picture">
                                    <img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                                </figure>
                                <div class="profile-info">
                                    <span class="name">老番茄</span>
                                    <span class="title">中午好！</span>
                                </div>
                            </li>
                            <li class="status-offline">
                                <figure class="profile-picture">
                                    <img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                                </figure>
                                <div class="profile-info">
                                    <span class="name">德文卷毛猫</span>
                                    <span class="title">下午来找我一趟</span>
                                </div>
                            </li>
                            <li class="status-offline">
                                <figure class="profile-picture">
                                    <img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
                                </figure>
                                <div class="profile-info">
                                    <span class="name">刘苏良</span>
                                    <span class="title">中午一起去吃饭不？</span>
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

<!-- Theme Base, Components and Settings -->
<script src="assets/javascripts/theme.js"></script>

<!-- Theme Custom -->
<script src="assets/javascripts/theme.custom.js"></script>

<!-- Theme Initialization Files -->
<script src="assets/javascripts/theme.init.js"></script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>