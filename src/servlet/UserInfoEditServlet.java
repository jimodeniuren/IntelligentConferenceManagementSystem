package servlet;

import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserInfoEditServlet")
public class UserInfoEditServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("post");
        System.out.println(request.getParameter("userDep")+request.getSession().getAttribute("userID"));
        userDao.editUserInfo(request.getParameter("userDep"),Integer.parseInt((String)request.getSession().getAttribute("userID")));
        PrintWriter out = response.getWriter();
        out.print("<script type='text/javascript' charset='UTF-8' language='javascript'>alert('修改成功');window.local.href('pages-user-profile.jsp');</script>");
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
