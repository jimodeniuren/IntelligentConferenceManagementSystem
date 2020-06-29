package servlet;

import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserInfoEditServlet")
public class UserInfoEditServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("post");
        System.out.println(request.getParameter("profileName")+request.getParameter("profileID"));
        userDao.editUserInfo(request.getParameter("profileName"),request.getParameter("profiledepartment"),Integer.parseInt(request.getParameter("profileID")));
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String id_str =String.valueOf(session.getAttribute("userID"));
        Object userInfo[] = userDao.getUserInfo(Integer.parseInt(id_str));
        session.setAttribute("name",userInfo[1]);
        session.setAttribute("department",userInfo[2]);
        session.setAttribute("email",userInfo[3]);

        response.sendRedirect("pages-user-profile.jsp");
    }
}
