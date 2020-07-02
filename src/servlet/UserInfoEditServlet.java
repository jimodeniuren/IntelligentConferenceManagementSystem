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
        String caozuo = request.getParameter("caozuo");
        int id = Integer.parseInt(request.getSession().getAttribute("userID").toString());
        if(caozuo.equals("dwd")){
            if(pwd.equals(pwd_confirm)){
                userDao.updatePwd(pwd,id);
                out.print("<script type='text/javascript' charset='UTF-8' language='javascript'>alert('success');window.location.href='pages-user-profile.jsp';</script>");
            }
        }else if(caozuo.equals("dep")){
            userDao.updateDep(dep,id);
            out.print("<script type='text/javascript' charset='UTF-8' language='javascript'>alert('部门更新成功');window.location.href='pages-user-profile.jsp';</script>");
        }else if(caozuo.equals("intro")){
            userDao.updateIntro(request.getParameter("introduction"),id);
            out.print("<script type='text/javascript' charset='UTF-8' language='javascript'>alert('introduction updated');window.location.href='pages-user-profile.jsp';</script>");
        }


        out.flush();
        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
