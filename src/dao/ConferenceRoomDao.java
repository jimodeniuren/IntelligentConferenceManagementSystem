package dao;

import entity.ConferenceRoom;
import utils.DBUtils;

import java.sql.*;
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
    public static List getAllData()
    {
        List<ConferenceRoom> list = new ArrayList<ConferenceRoom>();
        Connection con=null;
        PreparedStatement psmt=null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        try {
            String url = "jdbc:mysql://localhost:3306/words?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
            String user = "root";
            String password = "";
            con = DriverManager.getConnection(url, user, password);
            String sql = "select * from mr";
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("mr_id");
                String add = rs.getString("mr_addr");
                int max = rs.getInt("mr_max");
                String status = rs.getString("mr_status");
                String resources = rs.getString("mr_resources");
                ConferenceRoom c1 = new ConferenceRoom(id, add, max, status, resources);
                list.add(c1);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if(rs!=null)
                {
                    rs.close();
                }
                if(psmt!=null)
                {
                    psmt.close();
                }
                if(con!=null)
                {
                    con.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return list;
    }
    public static void main(String args[])
    {
        List<ConferenceRoom> list =getAllData();
        for(ConferenceRoom tl:list)
        {
            System.out.println(tl.getId());
            System.out.println(tl.getMax());
            System.out.println(tl.getStatus());
            System.out.println(tl.getAddress());
            System.out.println(tl.getResources());
        }
    }
}
