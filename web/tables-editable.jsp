<%@ page import="dao.ConferenceRoomDao" %>
<%@ page import="entity.ConferenceRoom" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: cxy
  Date: 2020/6/28
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>会议室控制中心</title>
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
    <link rel="stylesheet" href="assets/vendor/select2/select2.css" />
    <link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />

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
            <a href="" class="logo">
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
                            <li class="nav-active">
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
                            <a href="index.html">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>会议室控制中心</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->
            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>

                    <h2 class="panel-title">会议室控制中心</h2>
                </header>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-md">
                                <a href="tables-add .jsp" class="btn btn-primary" >添加<i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-bordered table-striped mb-none" id="datatable-editable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>容纳人数</th>
                            <th>会议室状态</th>
                            <th>会议室地址</th>
                            <th>资源</th>
                            <th>编辑</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ConferenceRoomDao dao=new ConferenceRoomDao();
                            List<ConferenceRoom> list =dao.getAllData();
                            for(ConferenceRoom cl:list)
                            {%>
                        <tr class="gradeA">
                            <td><%=cl.getId()%></td>
                            <td><%=cl.getMax()%></td>
                            <td><%=cl.getStatus()%></td>
                            <td><%=cl.getAddress()%></td>
                            <td><%=cl.getResources()%></td>
                            <td class="actions">
                                <a href="tables-change.jsp?roomid=<%=cl.getId()%>&max=<%=cl.getMax()%>&status=<%=cl.getStatus()%>&add=<%=cl.getAddress()%>&res=<%=cl.getResources()%>"><i class="fa fa-pencil">修改</i></a>
                                <a href="servlet.UserEditServlet?caozuo=del&id=<%=cl.getId()%>"><i class="fa fa-trash-o">删除</i></a>

                            </td>
                        </tr>
                        <%}
                        %>
                        </tbody>

                    </table>
                </div>
            </section>
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

<div id="dialog" class="modal-block mfp-hide">
    <section class="panel">
        <header class="panel-heading">
            <h2 class="panel-title">你确定吗?</h2>
        </header>
        <div class="panel-body">
            <div class="modal-wrapper">
                <div class="modal-text">
                    <p>你确定你想删除这行吗？</p>
                </div>
            </div>
        </div>
        <footer class="panel-footer">
            <div class="row">
                <div class="col-md-12 text-right">
                    <button id="dialogConfirm" class="btn btn-primary">确定</button>
                    <button id="dialogCancel" class="btn btn-default">取消</button>
                </div>
            </div>
        </footer>
    </section>
</div>

<!-- Vendor -->
<script src="assets/vendor/jquery/jquery.js"></script>
<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Specific Page Vendor -->
<script src="assets/vendor/select2/select2.js"></script>
<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="assets/javascripts/theme.js"></script>

<!-- Theme Custom -->
<script src="assets/javascripts/theme.custom.js"></script>

<!-- Theme Initialization Files -->
<script src="assets/javascripts/theme.init.js"></script>


<!-- Examples -->
<script src="assets/javascripts/tables/examples.datatables.editable.js"></script>
</body>
</html>