package servlet;

import dao.ConferenceRoomDao;
import entity.ConferenceRoom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserEditServlet")
public class UserEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        System.out.println("do post");
        String caozuo=request.getParameter("caozuo");
        if(caozuo.equals("del"))
        {
            System.out.println("delete");
            delConfRoom(request,response);
        }
        if(caozuo.equals("xiugai"))
        {
            System.out.println("xiugai");
            ChangeConfRoom(request,response);
        }
        if(caozuo.equals("test"))
        {
            System.out.println("test");

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("do get");
        doPost(request,response);
    }

    protected void delConfRoom(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String id=request.getParameter("id");
        System.out.println(id);
        ConferenceRoom conf=new ConferenceRoom();
        conf.setId(id!=null&&!id.equals("")?Integer.parseInt(id):0);
        ConferenceRoomDao dao=new ConferenceRoomDao();
        dao.delete(conf);
        response.sendRedirect("tables-editable.jsp");
    }
    protected void ChangeConfRoom(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        String id=request.getParameter("id");
        System.out.println(id);
        String cid=request.getParameter("cid");
        System.out.println(cid);
        String cmax=request.getParameter("cmax");
        System.out.println(cmax);
        String cstatus=request.getParameter("cstatus");
        String cadd=request.getParameter("cadd");
        String cres=request.getParameter("cres");
        ConferenceRoom conf=new ConferenceRoom();
        conf.setId(cid!=null&&!cid.equals("")?Integer.parseInt(cid):0);
        conf.setMax(cmax!=null&&!cmax.equals("")?Integer.parseInt(cmax):0);
        conf.setStatus(cstatus);
        conf.setAddress(cadd);
        conf.setResources(cres);
        ConferenceRoom conf1=new ConferenceRoom();
        conf1.setId(id!=null&&!id.equals("")?Integer.parseInt(id):0);
        ConferenceRoomDao dao=new ConferenceRoomDao();
        dao.delete(conf1);
        dao.insert(conf);
        response.sendRedirect("tables-editable.jsp");
    }
}
