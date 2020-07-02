<%--
  Created by IntelliJ IDEA.
  User: cxy
  Date: 2020/6/29
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
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
                            <a role="menuitem" tabindex="-1" href="pages-user-profile.jsp"><i class="fa fa-user"></i> 个人中心</a>
                        </li>
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

            <!-- start: page -->
            <section role="main" class="content-body">
                <header class="page-header">
                    <h2>会议室控制中心</h2>

                    <div class="right-wrapper pull-right">
                        <ol class="breadcrumbs">
                            <li>
                                <a href="pages-search-results.jsp">
                                    <i class="fa fa-home"></i>
                                </a>
                            </li>
                            <li><span>会议室控制中心</span></li>
                            <li><span>修改会议室</span></li>
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

                        <h2 class="panel-title">修改会议室</h2>
                    </header>
                    <%String roomid=request.getParameter("roomid");%>
                    <%String max=request.getParameter("max");%>
                    <%String status=request.getParameter("status");%>
                    <%String add=request.getParameter("add");%>
                    <%String res=request.getParameter("res");%>
                    <div class="panel-body">
                        <form class="form-horizontal form-bordered" action="servlet.UserEditServlet?caozuo=xiugai&roomid=<%=roomid%>&max=<%=max%>&status=<%=status%>&add=<%=add%>&res=<%=res%>" method="post" id="change"
                              method="post" id="add">

                            <%
                                if ((String) request.getAttribute("str") == "false") {
                            %>
                            <script>
                                alert("会议室id已被使用！");
                            </script>
                            <%
                                }
                            %>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputMrId">会议室ID</label>
                                <div class="col-md-6">
                                    <input type="number" class="form-control" id="inputMrId" name="cid" value="<%=roomid%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputMax">容纳人数</label>
                                <div class="col-md-6">
                                    <input type="number" class="form-control" id="inputMax" name="cmax" value="<%=max%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">会议室状态</label>
                                <div class="col-md-6">
                                    <select class="form-control mb-md" name="cstatus">
                                        <option>空闲中</option>
                                        <option>使用中</option>
                                        <option>维修中</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputAddr">会议室地址</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" id="inputAddr" name="cadd" value="<%=add%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">会议室资源</label>
                                <div class="col-md-6">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="投影仪" name="cpro" >
                                            投影仪
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="电脑" name="cpc">
                                            电脑
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="麦克风" name="cmic">
                                            麦克风
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="饮水机" name="cdm">
                                            饮水机
                                        </label>
                                    </div>

                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="白板" name="awb">
                                            白板
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6"></div>
                            <a href="#" onclick="document:change.submit()"><i class="fa fa-save">保存</i></a>
                            <a href="tables-editable.jsp"><i class="fa fa-times">取消</i></a>
                        </form>
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