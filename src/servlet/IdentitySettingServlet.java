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

@WebServlet(name = "IdentitySettingServlet")
public class IdentitySettingServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        int userID= Integer.parseInt(String.valueOf(session.getAttribute("userID")));
        System.out.println(userDao.getUserInfo(userID)[4]);
        if(userDao.getUserInfo(userID)[4].equals("administrator")){
            int id = Integer.parseInt(request.getParameter("ID"));
            if(request.getParameter("ID")==null){
                out.print("<script language='javascript'>alert('user do not exist');window.history.go(-1);</script>");
            }else if(userDao.getUserInfo(id)[4].equals("administrator")){
                out.print("<script language='javascript'>alert('error!不能编辑管理员');window.history.go(-2);</script>");
            }else{
                String identity = request.getParameter("indentity");
                if (userDao.getUserInfo(id) != null) {
                    Object userInfo[] = userDao.getUserInfo(id);
                    session.setAttribute("testID", userInfo[0]);
                    session.setAttribute("testName", userInfo[1]);
                    session.setAttribute("testDep", userInfo[2]);
                    Object i = session.getAttribute("testID");
                    System.out.println(userInfo[1]);
                    System.out.println(i);
                    if (identity != null) {
                        userDao.updateIdentity(identity, id);
                        System.out.println("update"+identity);
                        out.print("<script language='javascript'>alert('成功');window.history.go(-1);</script>");
                    }
                    response.sendRedirect("pages-user-authority.jsp?id="+id);
                } else {
                    out.print("<script language='javascript'>alert('user do not exist');window.history.go(-1);</script>");
                }
            }
        }else{
            out.print("<script language='javascript'>alert('administrator!');window.history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
