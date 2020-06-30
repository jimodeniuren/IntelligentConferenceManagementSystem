package entity;

/**
 * @program: IntelligentConferenceManagementSystem
 * @description: 封装User类
 * @create: 2020-06-22 20:11
 **/
public class User {
    private int userID;
    private String userPwd;
    private String userIdentity;
    private String userName;
    private String userDepartment;
    private String userEmail;

    public User(){}

    public User(int userID,String userPwd,String userIdentity,String userName,String userDepartment,String userEmail){
        this.userID=userID;
        this.userPwd=userPwd;
        this.userIdentity=userIdentity;
        this.userName=userName;
        this.userDepartment=userDepartment;
        this.userEmail=userEmail;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserIdentity() {
        return userIdentity;
    }

    public void setUserIdentity(String userIdentity) {
        this.userIdentity = userIdentity;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserDepartment() {
        return userDepartment;
    }

    public void setUserDepartment(String userDepartment) {
        this.userDepartment = userDepartment;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
