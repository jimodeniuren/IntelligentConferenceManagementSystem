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
        String password_confirm = request.getParameter("pwd_confirm");
        String emailAddr = request.getParameter("email");
        PrintWriter out =response.getWriter();
        if(request.getParameter("agreeterms")!=null&&request.getParameter("agreeterms").equals("on")){
            if(password.equals(password_confirm)){
                User user= new User();
                user.setUserDepartment("人事部");
                user.setUserName(name);
                user.setUserPwd(password);
                user.setUserEmail(emailAddr);

                if(userDao.insert(user)!=0){
                    HttpSession session = request.getSession();
                    session.setAttribute("userID",userDao.getUserID(emailAddr));
                    response.sendRedirect("tables-advanced.jsp");
                }else{
                    out.print("<script language='javascript'>alert('user already exist');window.history.go(-1);</script>");
                }
            }else{
                out.print("<script language='javascript'>alert('Your confirmed password and password do not match!');window.history.go(-1);</script>");
            }
        }else{
            out.print("<script language='javascript'>alert('Please accept the Terms of Service.');window.history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

}
