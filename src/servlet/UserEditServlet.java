package servlet;

import dao.ConferenceRoomDao;
import entity.ConferenceRoom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import java.util.regex.Pattern;

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
        if(caozuo.equals("tianjia"))
        {
            System.out.println("tianjia");
            AddConfRoom(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("do get");
        doPost(request,response);
    }

    public static boolean isInteger(String str) {
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        return pattern.matcher(str).matches();
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
        int oldid, changeid;
        int flag = 0;
        String id = request.getParameter("id");
        System.out.println(id);
        String max = request.getParameter("max");
        System.out.println(max);
        String status = request.getParameter("status");
        String add = request.getParameter("add");
        String res = request.getParameter("res");
        String cid = request.getParameter("cid");
        System.out.println(cid);
        String cmax = request.getParameter("cmax");
        System.out.println(cmax);
        String cstatus = request.getParameter("cstatus");
        String cadd = request.getParameter("cadd");
        String cres = request.getParameter("cres");
        ConferenceRoom conf = new ConferenceRoom();
        if (!isInteger(cid)||!isInteger(cmax)||Integer.parseInt(cmax)<0) {
            System.out.println("change false");
            request.setAttribute("stri", "false");
            request.getRequestDispatcher("tables-change.jsp").forward(request, response);
        }
            else {
            conf.setId(cid != null && !cid.equals("") ? Integer.parseInt(cid) : 0);
            conf.setMax(cmax != null && !cmax.equals("") ? Integer.parseInt(cmax) : 0);
            conf.setStatus(cstatus);
            conf.setAddress(cadd);
            conf.setResources(cres);
            ConferenceRoom conf1 = new ConferenceRoom();
            conf1.setId(id != null && !id.equals("") ? Integer.parseInt(id) : 0);
            oldid = (id != null && !id.equals("") ? Integer.parseInt(id) : 0);
            changeid = (cid != null && !cid.equals("") ? Integer.parseInt(cid) : 0);
            if (oldid == changeid) {
                ConferenceRoomDao dao = new ConferenceRoomDao();
                dao.delete(conf1);
                dao.insert(conf);
                response.sendRedirect("tables-editable.jsp");
            } else {
                ConferenceRoomDao dao = new ConferenceRoomDao();
                List<ConferenceRoom> list = dao.getAllData();
                for (ConferenceRoom cl : list) {
                    oldid = cl.getId();
                    if (oldid == changeid) {
                        flag = 1;
                        break;
                    }
                }
                if (flag == 0) {
                    dao.delete(conf1);
                    dao.insert(conf);
                    response.sendRedirect("tables-editable.jsp");
                } else if (flag == 1) {
                    System.out.println("change false");
                    request.setAttribute("str", "false");
                    request.getRequestDispatcher("tables-change.jsp").forward(request, response);
                }

            }
        }
    }

    protected void AddConfRoom(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int flag=0;
        int oldid,addid=0;
        String aid=request.getParameter("aid");
        System.out.println(aid);
        String amax=request.getParameter("amax");
        System.out.println(amax);
        String astatus=request.getParameter("astatus");
        String aadd=request.getParameter("aadd");
        String ares=request.getParameter("ares");
        ConferenceRoom conf=new ConferenceRoom();
        conf.setId(aid!=null&&!aid.equals("")?Integer.parseInt(aid):0);
        conf.setMax(amax!=null&&!amax.equals("")?Integer.parseInt(amax):0);
        conf.setStatus(astatus);
        conf.setAddress(aadd);
        conf.setResources(ares);
        addid=(aid!=null&&!aid.equals("")?Integer.parseInt(aid):0);
        ConferenceRoomDao dao=new ConferenceRoomDao();
        List<ConferenceRoom> list =dao.getAllData();
        for(ConferenceRoom cl:list) {
              oldid=cl.getId();
              if(oldid==addid)
              {
                  flag=1;
                  break;
              }
        }
        if(flag==0) {
            dao.insert(conf);
            response.sendRedirect("tables-editable.jsp");
        }
        else if(flag==1)
        {
            System.out.println("add false");
            request.setAttribute("str", "false");
            request.getRequestDispatcher("tables-add.jsp").forward(request,response);
        }

    }


}
