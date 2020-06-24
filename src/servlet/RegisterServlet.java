package servlet;

import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("userName");
        String password = request.getParameter("userPwd");
        String department = request.getParameter("userDepartment");
        String emailAddr = request.getParameter("EmailAddr");


        User user= new User();
        user.setUserName(name);
        user.setUserPwd(password);
        user.setUserDepartment(department);
        user.setUserEmail(emailAddr);

        UserDao userDao = new UserDao();
        if(userDao.insert(user)!=0){
            response.sendRedirect("");
        }else{
            response.sendRedirect("");

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

}
