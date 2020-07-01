<%@ page import="dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: lin
  Date: 2020/6/28
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>checkCookie</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if(c.getName().equals("userID")){
                UserDao userDao = new UserDao();
                System.out.println();
                if(userDao.getUserInfo(Integer.parseInt(c.getValue()))[4].equals("administrator")){
                    response.sendRedirect("pages-search-results.jsp");
                }else{
                    response.sendRedirect("tables-advanced.jsp");
                }
                session.setAttribute("userID",c.getValue());
                return;
            }
        }
    }
    response.sendRedirect("pages-signin.jsp");
%>

</body>
</html>
