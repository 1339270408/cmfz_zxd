package com.baizhi.service;

import com.baizhi.entrty.User;

public interface UserService {
    void addUser(User user);
    void motifyUser(User user);
    //User findLogin(User user);
    //User findUsername(User user);
    User findLogin(User user);

    User findById(String id);
}
