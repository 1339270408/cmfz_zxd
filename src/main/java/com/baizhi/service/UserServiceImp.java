package com.baizhi.service;

import com.baizhi.dao.UserDAO;
import com.baizhi.entrty.User;
import com.baizhi.util.MD5Util;
import com.baizhi.util.RandomStringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import sun.misc.Request;

import javax.servlet.ServletContext;
import java.util.Date;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImp implements UserService{



    @Autowired
    private UserDAO userDAO;

    @Override
    public void addUser(User user) {
        user.setId(UUID.randomUUID().toString());
        user.setUserDate(new Date());
        String randomString = RandomStringUtil.getRandomString(5);
        user.setSalt(randomString);
        String md5 = MD5Util.MD5(user.getPassword() + randomString);
        user.setPassword(md5);
        userDAO.insert(user);
    }


    @Override
    public User findLogin(User user) {
        User user1 = userDAO.queryUsername(user);
        if(user1!=null){
            String salt = user1.getSalt();
            String md5 = MD5Util.MD5(user.getPassword() + salt);
            user.setPassword(md5);
            User password = userDAO.queryPassword(user);
            if(password!=null){
                return user;
            }
            else {
                throw new RuntimeException("密码错误");
            }
        }else {
            throw new RuntimeException("用户名错误");
        }

    }

    @Override
    public void motifyUser(User user) {
        String randomString = RandomStringUtil.getRandomString(5);
        user.setSalt(randomString);
        String md5 = MD5Util.MD5(user.getPassword() + randomString);
        user.setPassword(md5);
        userDAO.update(user);
    }

    @Override
    public User findById(String id) {
        return userDAO.queryByid(id);
    }




}
