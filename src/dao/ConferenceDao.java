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
    public int insert(Conference conference) {

        Object[] params
                = {conference.getConferenceName(), conference.getConferenceId()
                , conference.getConferenceType(), conference.getMrId()
                , conference.getHostId(),conference.getHostDepartment()
                , conference.getStartTime(),conference.getEndTime()
                , conference.getConferenceStatus()};

        String sql = "insert into tbl_conference values(?,?,?,?,?,?,?,?,?)";

        int i = doUpdate(sql,params);

        getClose();
        return  i;
    }

    public int delete(Conference conference) {

        Object[] params = {conference.getConferenceId()};

        String sql = "delete from tbl_conference where mr_id=?";

        int i = doUpdate(sql, params);

        getClose();
        return i;
    }

    public int update(Conference conference) {

        Object[] params
                = {conference.getConferenceName()
                , conference.getConferenceType(), conference.getMrId()
                , conference.getHostId(),conference.getHostDepartment()
                , conference.getStartTime(),conference.getEndTime()
                , conference.getConferenceStatus()};

        String sql = "update tbl_conference set conference_name=?,conference_type=?,mr_id=?,host_id=?,host_department=?,start_time=?,end_time=?,conference_status? where conference_id=?";

        int i = doUpdate(sql, params);

        getClose();
        return i;
    }

    public List selectByHostId(String id){
        String sql = "select * from tbl_conference where host_id = " + id;

        ResultSet rs = doQuery(sql, null);

        List<Conference> list = new ArrayList<>();

        try {
            if (rs.next()) {
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
}
