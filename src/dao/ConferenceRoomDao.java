package dao;

import entity.ConferenceRoom;
import utils.DBUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: IntelligentConferenceManagementSystem
 * @description: 查询数据
 * @create: 2020-06-22 20:16
 **/
public class ConferenceRoomDao extends DBUtils {

    public int insert(ConferenceRoom conferenceRoom) {

        Object[] params
                = {conferenceRoom.getId(), conferenceRoom.getAddress()
                , conferenceRoom.getMax(), conferenceRoom.getStatus()
                , conferenceRoom.getResources()};

        String sql = "insert into tbl_mr values(?,?,?,?,?)";

        int i = doUpdate(sql,params);

        getClose();
        return  i;
    }

    public int delete(ConferenceRoom conferenceRoom) {

        Object[] params = {conferenceRoom.getId()};

        String sql = "delete from tbl_mr where mr_id=?";

        int i = doUpdate(sql, params);

        getClose();
        return i;
    }

    public int update(ConferenceRoom conferenceRoom) {

        Object[] params
                = {conferenceRoom.getId(), conferenceRoom.getAddress()
                , conferenceRoom.getMax(), conferenceRoom.getStatus()
                , conferenceRoom.getResources()};

        String sql = "update tbl_mr set mr_addr=?,mr_max=?,mr_status=?,mr_resources=? where mr_id=?";

        int i = doUpdate(sql, params);

        getClose();
        return i;
    }

    public String getStatusById(String id){
        String sql = "select * from tbl_mr where mr_id = " + id;

        ResultSet rs = doQuery(sql, null);

        try {
            if (rs.next()) {
                getClose();
                return "会议室的状态为：" + rs.getString(4);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        getClose();
        return "会议室不存在！";
    }
}
