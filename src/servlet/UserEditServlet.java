package servlet;

import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserEditServlet")
public class UserEditServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String id_str =String.valueOf(session.getAttribute("userID"));
        Object userInfo[] = userDao.getUserInfo(Integer.parseInt(id_str));
        request.setAttribute("userID",userInfo[0]);
        request.setAttribute("userName",userInfo[1]);
        request.setAttribute("userDepartment",userInfo[2]);
        request.setAttribute("userEmail",userInfo[3]);
        request.getRequestDispatcher("UserEdit.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
