package com.baizhi.service;

import com.baizhi.entrty.Admin;

public interface AdminService{

    Admin findNamePwd(Admin admin);
    void motifyPwd(Admin admin);
//    Admin findById(String id);
}