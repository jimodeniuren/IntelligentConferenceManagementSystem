package servlet;

import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        if(checkCookie(request, response))
            response.sendRedirect("");
        else{
            String password = request.getParameter("userPwd");
            String emailAddr = request.getParameter("EmailAddr");
            UserDao userDao = new UserDao();
            if(userDao.passwordCheck(emailAddr,password)!=0){
                response.setHeader("Access-Control-Allow-Origin", "*");
                response.setHeader("Access-Control-Allow-Methods", "POST");
                response.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
                response.setContentType("text/html;charset=utf-8");
                Cookie cookie = new Cookie("user", emailAddr);
                cookie.setMaxAge(60*60*24*2);
                response.addCookie(cookie);

                response.sendRedirect("");
            }else {
                response.sendRedirect("login.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    private boolean checkCookie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if(c.getName().equals("user"))
                    return true;
            }
        }
        return false;
    }
}
