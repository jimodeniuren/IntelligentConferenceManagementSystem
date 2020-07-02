package dao;

import entity.Conference;
import utils.DBUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: IntelligentConferenceManagementSystem
 * @description: 封装操作数据库中的会议数据的各种方法。
 * @create: 2020-06-22 20:14
 **/
public class ConferenceDao extends DBUtils {
    public String insert(Conference conference) {

        ConferenceRoomDao dao =new ConferenceRoomDao();
        if (dao.getStatusById(String.valueOf(conference.getMrId())).equals("会议室不存在！")
                ||conference.getEndTime().compareTo(conference.getStartTime())<=0){
            return "预定失败！";
        }

        Object[] params
                = {conference.getConferenceName()
                , conference.getConferenceType(), conference.getMrId()
                , conference.getHostId(),conference.getHostDepartment()
                , conference.getStartTime(),conference.getEndTime()
                , conference.getConferenceStatus()};

        String sql = "insert into tbl_conference values(?,null,?,?,?,?,?,?,?)";

        int i = doUpdate(sql,params);

        getClose();
        return  i==1?"预定成功！":"预定失败！";
    }

    public String delete(Conference conference) {

        Object[] params = {conference.getConferenceId()};

        String sql = "delete from tbl_conference where conference_id=?";

        int i = doUpdate(sql, params);

        getClose();
        return i==1?"删除成功":"删除失败";
    }

    public int update(Conference conference) {

        Object[] params
                = {conference.getConferenceName()
                , conference.getConferenceType(), conference.getMrId()
                , conference.getHostId(),conference.getHostDepartment()
                , conference.getStartTime(),conference.getEndTime()
                , conference.getConferenceStatus(),conference.getConferenceId()};

        String sql = "update tbl_conference set conference_name=?,conference_type=?,mr_id=?,host_id=?,host_department=?,start_time=?,end_time=?,conference_status=? where conference_id=?";

        int i = doUpdate(sql, params);

        getClose();
        return i;
    }

    public List<Conference> selectByHostId(String id){
        String sql = "select * from tbl_conference where host_id = " + id;

        ResultSet rs = doQuery(sql, null);

        List<Conference> list = new ArrayList<>();

        try {
            while (rs.next()) {
                list.add(new Conference(rs.getString(1),rs.getInt(2),
                        rs.getInt(3),rs.getInt(4),rs.getInt(5),
                        rs.getString(6),rs.getDate(7),rs.getDate(8),
                        rs.getInt(9)));
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        getClose();
        return list;
    }

    public String getNameById(String id){
        String sql = "select * from tbl_conference where conference_id = " + id;

        ResultSet rs = doQuery(sql, null);

        String result = "";

        try {
            if (rs.next()) {
                result=  rs.getString(1);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        getClose();
        return result.equals("")?"会议不存在！":result;
    }
    public List<Conference> getConfByDep(String Dep){
        String sql = "select * from tbl_conference where end_time > NOW() and conference_status=1 and host_department = ?";
        Object params[]={Dep};
        ResultSet rs = doQuery(sql, params);

        List<Conference> list = new ArrayList<>();

        try {
            if (rs.next()) {
                list.add(new Conference(rs.getString(1),rs.getInt(2),
                        rs.getInt(3),rs.getInt(4),rs.getInt(5),
                        rs.getString(6),rs.getTimestamp(7),rs.getTimestamp(8),
                        rs.getInt(9)));
                System.out.println(rs.getString("conference_name"));
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        getClose();
        return list;
    }

    public List<Conference> getUnstartedConference(){
        String sql = "select * from tbl_conference where end_time > NOW()";

        ResultSet rs = doQuery(sql, null);

        List<Conference> list = new ArrayList<>();

        try {
            while (rs.next()) {
                list.add(new Conference(rs.getString(1),rs.getInt(2),
                        rs.getInt(3),rs.getInt(4),rs.getInt(5),
                        rs.getString(6),rs.getTimestamp(7),rs.getTimestamp(8),
                        rs.getInt(9)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        getClose();
        return list;
    }

    public List<Conference> getUnreviewedConference(){
        String sql = "select * from tbl_conference where end_time > NOW() and conference_status=0";
        ResultSet rs = doQuery(sql, null);
        List<Conference> list = new ArrayList<>();
        try {
            while (rs.next()) {
                list.add(new Conference(rs.getString(1),rs.getInt(2),
                        rs.getInt(3),rs.getInt(4),rs.getInt(5),
                        rs.getString(6),rs.getTimestamp(7),rs.getTimestamp(8),
                        rs.getInt(9)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        getClose();
        return list;
    }
    public Conference getConfByID(String id){
        String sql = "select * from tbl_conference where conference_id = " + id;

        ResultSet rs = doQuery(sql, null);

        try {
            if (rs.next()) {
                Conference conference = new Conference();
                conference.setConferenceId(rs.getInt("conference_id"));
                conference.setConferenceName(rs.getString("conference_name"));
                conference.setConferenceType(rs.getInt("conference_type"));
                conference.setMrId(rs.getInt("mr_id"));
                conference.setHostId(rs.getInt("host_id"));
                conference.setHostDepartment(rs.getString("host_department"));
                conference.setStartTime(rs.getDate("start_time"));
                conference.setEndTime(rs.getDate("end_time"));
                conference.setConferenceStatus(rs.getInt("conference_status"));
                return conference;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        getClose();
        return null;
    }
}
