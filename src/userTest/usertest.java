package userTest;

import dao.UserDao;
import entity.User;

public class usertest {
    public static void main(String[] args) {
        UserDao userDao = new UserDao();
        if(userDao.passwordCheck("admin@admin.com","admin")==1){
            System.out.println("登陆成功");
        }else
            System.out.println("失败");
        User user_1 =new User();
        user_1.setUserName("lisi");
        user_1.setUserEmail("lisi@email.com");
        user_1.setUserDepartment("人事部");
        user_1.setUserPwd("ls1234");
        ;
        if(userDao.isUserExist(user_1.getUserEmail())) {
            System.out.println("用户已存在");
        }
        else{
            if (userDao.register(user_1) == 1)
                System.out.println("注册成功");
            else
                System.out.println("注册失败");
        }


    }
}
