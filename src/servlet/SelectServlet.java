package servlet;

import dao.ConferenceRoomDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SelectServlet")
public class SelectServlet extends HttpServlet {
    private ConferenceRoomDao conferenceRoomDao = new ConferenceRoomDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void getStatusById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("conference_id");
        request.getSession().setAttribute("select_result",conferenceRoomDao.getStatusById(id));
        response.sendRedirect("");
    }
}
