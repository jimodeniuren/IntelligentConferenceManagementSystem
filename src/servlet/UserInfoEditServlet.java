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
        PrintWriter out = response.getWriter();
        String dep = request.getParameter("department");
        String pwd=request.getParameter("pwd");
        String pwd_confirm = request.getParameter("pwd_confirm");
        System.out.println(dep+request.getSession().getAttribute("userID"));
        int id = Integer.parseInt(request.getSession().getAttribute("userID").toString());
        if(pwd!=null&&pwd_confirm!=null){
            if(pwd.equals(pwd_confirm)){
                userDao.updatePwd(pwd,id);
            }
        }
        if(!dep.equals(userDao.getUserInfo(id)[4])){
            userDao.updateDep(dep,id);
        }
        if(!request.getParameter("intro").equals(userDao.getUserInfo(id)[5])){
            userDao.updateIntro(request.getParameter("intro"),id);
        }
        out.print("<script type='text/javascript' charset='UTF-8' language='javascript'>alert('updated');window.location.href='pages-user-profile.jsp';</script>");
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
