package servlet;

import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String password = request.getParameter("pwd");
        String emailAddr = request.getParameter("email");

        if(userDao.passwordCheck(emailAddr,password)!=0){
            setResponseAccess(response);
            if (request.getParameter("rememberme").equals("on")) {
                Cookie cookie = new Cookie("userID", Integer.toString(userDao.getUserID(emailAddr)));
                cookie.setMaxAge(60*60*24*2);
                response.addCookie(cookie);
            }
            HttpSession session = request.getSession();
            session.setAttribute("userID",userDao.getUserID(emailAddr));
            response.sendRedirect("tables-advanced.jsp");
        }else {
            out.print("<script language='javascript'>alert('Wrong Email Or Password!');window.history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    private void setResponseAccess(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
        response.setContentType("text/html;charset=utf-8");
    }
}
