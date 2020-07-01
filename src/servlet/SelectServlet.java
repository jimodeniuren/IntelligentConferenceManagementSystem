package servlet;

import dao.AttendenceRecordDao;
import dao.ConferenceRoomDao;
import dao.UserDao;
import entity.AttendenceRecord;
import entity.User;

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

        String caozuo=request.getParameter("caozuo");
        UserDao dao = new UserDao();

        if ("search".equals(caozuo)) {
                List<User> ulist = dao.selectById(request.getParameter("insertid"));
                System.out.println("userName:");
                System.out.println(ulist.get(0).getUserName());
                request.getSession().setAttribute("list", ulist);
                response.sendRedirect("pages-search-results.jsp");

        } else {
            List<User> userList = dao.selectAll();
            request.getSession().setAttribute("list", userList);
            response.sendRedirect("pages-search-results.jsp");
        }
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
