package dao;

import entity.AttendenceRecord;
import utils.DBUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: IntelligentConferenceManagementSystem
 * @description: 查询数据
 * @create: 2020-06-22 20:17
 **/
public class AttendenceRecordDao extends DBUtils {
    public int insert(AttendenceRecord attendenceRecord) {

        Object[] params
                = {attendenceRecord.getConferenceId(),attendenceRecord.getConferenceName(),
                    attendenceRecord.getParticipantId(),attendenceRecord.getParticipantName()};

        String sql = "insert into tbl_mar values(?,?,?,?)";

        int i = doUpdate(sql,params);

        getClose();
        return  i;
    }

    public int update(AttendenceRecord attendenceRecord) {

        Object[] params
                =  {attendenceRecord.getConferenceId(),attendenceRecord.getConferenceName(),
                attendenceRecord.getParticipantId(),attendenceRecord.getParticipantName()};

        String sql = "update tbl_mar set conference_id=?,conference_name=?,participant_id=?,participant_name=?";

        int i = doUpdate(sql, params);

        getClose();
        return i;
    }

    public List<AttendenceRecord> selectById(String id,int mode){
        String sql = "";
        if (mode == 0){
            sql = "select * from tbl_mar where conference_id = " + id;
        }
        else{
            sql = "select * from tbl_mar where participant_id = " + id;
        }

        ResultSet rs = doQuery(sql, null);

        List<AttendenceRecord> list = new ArrayList<>();

        try {
            if (rs.next()) {
                list.add(new AttendenceRecord(rs.getInt(1), rs.getString(2),
                        rs.getInt(3), rs.getString(4)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        getClose();

        return list;
    }

}
