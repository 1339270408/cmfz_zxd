package com.baizhi.text;

import com.baizhi.dao.UserDAO;
import com.baizhi.entrty.User;
import com.baizhi.service.UserService;
import com.baizhi.util.MD5Util;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class TestUser extends Tests{

    @Autowired
    private UserService userService;
    @Autowired
    private UserDAO userDAO;

    @Test
    public void text1(){
        userService.addUser(new User("12345","zxd","hyz","22","北京","ss","男","2","1.jsp","t"));
    }

  /*  @Test
    public void text2(){
        User user = new User("zxd","hyz");
        User username = userService.findUsername(user);
        if(username!=null){
            String salt = username.getSalt();
            String md5 = MD5Util.MD5(user.getPassword() + salt);
            System.out.println(md5);
            user.setPassword(md5);
            User password = userService.findPassword(user);
            if(password!=null){
                System.out.println("登陆成功");
            }else {
                System.out.println("密码错误");
            }
        }else {
            System.out.println("用户名错误");
        }
    }*/

      @Test
      public void text(){
          User password = userService.findLogin(new User("zxd", "hyz"));
          System.out.println(password);
      }

        @Test
        public void text3(){
            User user=new User();
            user.setId("79188f04-b533-437d-b22a-e26845a93153");
            user.setPassword("aa");
            userService.motifyUser(user);
        }

}
