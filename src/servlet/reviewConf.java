package servlet;

import dao.ConferenceDao;
import dao.UserDao;
import entity.Conference;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class reviewConf extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("caozuo"));
        int UserID = Integer.parseInt(req.getSession().getAttribute("userID").toString());
        UserDao userDao = new UserDao();
        if(userDao.getUserInfo(UserID)[4].equals("administrator")){
            if(req.getParameter("caozuo").equals("pass")){
                System.out.println("pass");
                String id = req.getParameter("id");
                ConferenceDao conferenceDao = new ConferenceDao();
                Conference conference = conferenceDao.getConfByID(id);
                conference.setConferenceStatus(1);
                conferenceDao.update(conference);
                resp.sendRedirect("ui-elements-portlets.jsp");
            }else if(req.getParameter("caozuo").equals("reject")){
                System.out.println("reject");
                String id = req.getParameter("id");
                ConferenceDao conferenceDao = new ConferenceDao();
                Conference conference = conferenceDao.getConfByID(id);
                conference.setConferenceStatus(2);
                conferenceDao.update(conference);
                resp.sendRedirect("ui-elements-portlets.jsp");
            }
        }else{
            PrintWriter out = resp.getWriter();
            out.print("<script language='javascript'>alert('administrator!');window.history.go(-1);</script>");
            out.flush();
            out.close();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
