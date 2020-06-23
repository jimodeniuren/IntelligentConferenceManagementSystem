package dao;

import entity.User;
import utils.DBUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @program: IntelligentConferenceManagementSystem
 * @description: 在数据库中查询用户ID和密码是否匹配，将注册的用户记录到数据库
 * @create: 2020-06-22 20:12
 **/
public class UserDao {
    public int passwordCheck(String email,String password){
        Object params[]={email,password};
        String sql = "select user_id from tbl_user where user_emailAddr = ? and user_pwd = ?";
        DBUtils dbUtils = new DBUtils();
        ResultSet rs = dbUtils.doQuery(sql,params);
        int count=0;
        try {
            if(rs.next())
                count=1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            dbUtils.getClose();
        }
        return count;
    }
    public int register(User user){
        Object params[]={user.getUserEmail(),user.getUserPwd(),user.getUserName(),user.getUserDepartment()};
        String sql = "insert into tbl_user (user_emailAddr,user_pwd,user_name,user_department) value(?,?,?,?)";
        DBUtils dbUtils = new DBUtils();
        int count = dbUtils.doUpdate(sql, params);
        dbUtils.getClose();
        return count;
    }
    public int editUserInfo(User user){
        int count =0;
        Object params[]={user.getUserEmail(),user.getUserName(),user.getUserDepartment()};
        String sql = "update set  tbl_user where user_emailAddr = ? and user_pwd = ?";
        DBUtils dbUtils = new DBUtils();
        ResultSet rs = dbUtils.doQuery(sql,params);
        dbUtils.getClose();
        return count;
    }
    public boolean isUserExist(String email){
        Object params[]={email};
        String sql = "select user_id from tbl_user where user_emailAddr = ?";
        DBUtils dbUtils = new DBUtils();
        ResultSet rs = dbUtils.doQuery(sql,params);
        try {
            if(rs.next())
                return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            dbUtils.getClose();
        }
        return false;
    }

}
