<%--
  Created by IntelliJ IDEA.
  User: lin
  Date: 2020/6/28
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserEdit</title>
</head>
<body>
<div class="panel-body">
    <form action="servlet.UserInfoEditServlet" method="post">
    <!<--form action="" method="post">-->
        <div class="form-group mb-lg">
            <label>userID</label>
            <div style="color: #3c3c3c" class="input-group input-group-icon">
                <input name="userID" type="text" value="${sessionScope['userID']}" style="color: #3c3c3c" class="form-control input-lg" readonly/>
                <span class="input-group-addon">
            <span class="icon icon-lg">
                <i class="fa fa-user"></i>
            </span>
        </span>
            </div>
        </div>

        <div class="form-group mb-lg">
            <label>权限等级${sessionScope['department']}</label>
            <div style="color: #3c3c3c" class="input-group input-group-icon">
                <input name="userIdentity" type="text" value="${sessionScope['department']}" style="color: #3c3c3c" class="form-control input-lg" readonly/>
                <span class="input-group-addon">
            <span class="icon icon-lg">
                <i class="fa fa-user"></i>
            </span>
        </span>
            </div>
        </div>

        <div class="form-group mb-lg">
            <label>邮箱</label>
            <div class="input-group input-group-icon">
                <input name="userEmail" type="email" class="form-control input-lg" value="${sessionScope['email']}"/>
                <span class="input-group-addon">
            <span class="icon icon-lg">
                <i class="fa fa-user"></i>
            </span>
        </span>
            </div>
        </div>

        <div class="form-group mb-lg">
            <div class="input-group input-group-icon">
                userName<input name="userName" type="text" class="form-control input-lg" value="${sessionScope['name']}"/>
                <span class="input-group-addon">
            <span class="icon icon-lg">
                <i class="fa fa-user"></i>
            </span>
        </span>
            </div>
        </div>

        <div class="col-sm-4 text-right">
            <button type="submit" class="btn btn-primary hidden-xs">修改</button>
        </div>

    </form>
</div>


</body>
</html>
