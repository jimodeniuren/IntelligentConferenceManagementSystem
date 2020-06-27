package servlet;

import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String password = request.getParameter("pwd");
        String emailAddr = request.getParameter("email");
        PrintWriter out =response.getWriter();

        User user= new User();
        user.setUserName(name);
        user.setUserPwd(password);
        user.setUserEmail(emailAddr);

        if(userDao.insert(user)!=0){
            response.sendRedirect("login.jsp");
        }else{
            HttpSession session = request.getSession();
            //session.setAttribute("existence","<div class=\"col-sm-4 text-right\" style=\"color: #c1261d\"><h3>asdlj</h3></div>");
//            session.setAttribute("existence","<SCRIPT LANGUAGE=\"javascript\"> alert(\"用户已存在\"); </SCRIPT> ");
            out.print("<script language='javascript'>alert('UserName Wrong!!');window.location.href='Login.jsp';</script>");
            response.sendRedirect("pages-signup.html");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

}
