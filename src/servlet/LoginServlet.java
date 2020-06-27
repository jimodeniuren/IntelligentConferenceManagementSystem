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
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("到了Servlet！！！");
        request.setCharacterEncoding("utf-8");
        System.out.println("loginServlet"+request.getParameter("pwd"));
        if(checkCookie(request, response))
            response.sendRedirect("/index.html");
        else{
            String password = request.getParameter("pwd");
            String emailAddr = request.getParameter("email");

            if(userDao.passwordCheck(emailAddr,password)!=0){
                setResponseAccess(response);
                if (request.getParameter("rememberme").equals("on")) {
                    Cookie cookie = new Cookie("userID", Integer.toString(userDao.getUserID(emailAddr)));
                    cookie.setMaxAge(60*60*24*2);
                    response.addCookie(cookie);
                }
                response.sendRedirect("index.html");
            }else {
                response.sendRedirect("pages-signin.html");
            }
        }
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
    private boolean checkCookie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                System.out.println(c.getName());
                /*if(c.getName().equals("userID")){
                    System.out.println(c.getName());
                    return true;
                }*/

            }
        }
        return false;
    }
}
