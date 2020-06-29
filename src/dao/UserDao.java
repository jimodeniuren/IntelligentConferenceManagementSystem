package dao;

import entity.User;
import utils.DBUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: IntelligentConferenceManagementSystem
 * @description: 在数据库中查询用户ID和密码是否匹配，将注册的用户记录到数据库
 * @create: 2020-06-22 20:12
 **/
public class UserDao extends DBUtils{

    public int passwordCheck(String email,String password){
        Object params[]={email,password};
        String sql = "select user_id from tbl_user where user_emailAddr = ? and user_pwd = ?";
        ResultSet rs = doQuery(sql,params);
        int count=0;
        try {
            if(rs.next())
                count=1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            getClose();
        }
        return count;
    }
    public int insert(User user){
        Object params[]={user.getUserEmail(),user.getUserPwd(),
                user.getUserName(),user.getUserDepartment()};
        String sql = "insert into tbl_user (user_emailAddr,user_pwd,user_name,user_department) value(?,?,?,?)";
        int count = doUpdate(sql, params);
        getClose();
        return count;
    }
    public int editUserInfo(String name,String department,int id){
        Object params[]={name,department,id};
        String sql = "update tbl_user set user_name = ?,user_department=? where user_id = ?";
        int count = doUpdate(sql,params);
        getClose();
        return count;
    }
    public int updateIdentity(User user){
        Object params[]={user.getUserIdentity(),user.getUserID()};
        String sql = "update tbl_user set user_identity=? where user_id = ?";
        int count  = doUpdate(sql,params);
        getClose();
        return count;
    }
    public int getUserID(String email){
        Object params[]={email};
        String sql = "select user_id from tbl_user where user_emailAddr = ?";
        ResultSet rs = doQuery(sql,params);
        try {
            if(rs.next())
                return rs.getInt("user_id");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            if(rs!=null) {
                try {
                    rs.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            getClose();
        }
        return 0;
    }
    public Object[] getUserInfo(int id){

        String sql = "select * from tbl_user where user_id = "+id;
        ResultSet rs = doQuery(sql,null);
        try {
            if(rs.next()){
                Object params[]={rs.getInt("user_id"),rs.getString("user_name"),
                        rs.getString("user_department"),rs.getString("user_emailAddr")};
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            if(rs!=null) {
                try {
                    rs.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            getClose();
        }
        return null;
    }

    public String getNameById(String id){

            String sql = "select * from tbl_user where user_id = " + id;

            ResultSet rs = doQuery(sql, null);

            List<User> list = new ArrayList<>();

            try {
                if (rs.next()) {
                    getClose();
                    return rs.getString(4);
                }

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            getClose();
            return "没有这个用户";
    }

}
