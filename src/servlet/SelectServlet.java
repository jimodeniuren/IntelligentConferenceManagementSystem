package servlet;

import dao.AttendenceRecordDao;
import dao.ConferenceRoomDao;
import entity.AttendenceRecord;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SelectServlet")
public class SelectServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    
    private void getStatusById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ConferenceRoomDao conferenceRoomDao = new ConferenceRoomDao();
        String id = request.getParameter("conference_id");
        request.getSession().setAttribute("select_result",conferenceRoomDao.getStatusById(id));
        response.sendRedirect("");
    }

    private void selectByConferenceId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        AttendenceRecordDao attendenceRecordDao = new AttendenceRecordDao();
        String id = request.getParameter("conference_id");
        request.getSession().setAttribute("select_result",attendenceRecordDao.selectById(id,0));
        response.sendRedirect("");
    }

    private void selectByParticipantId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        AttendenceRecordDao attendenceRecordDao = new AttendenceRecordDao();
        String id = request.getParameter("participant_id");
        request.getSession().setAttribute("select_result",attendenceRecordDao.selectById(id,1));
        response.sendRedirect("");
    }
}
