package servlet;

import dao.ConferenceDao;
import entity.Conference;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class reviewConf extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("caozuo"));
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

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
