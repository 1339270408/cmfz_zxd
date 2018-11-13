package com.baizhi.service;

import com.baizhi.dao.AdminDAO;
import com.baizhi.entrty.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;

@Service
@Transactional
public class AdminServiceImp implements AdminService{

    @Autowired
    private AdminDAO adminDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Admin findNamePwd(Admin admin) {
        Admin admin1 = adminDAO.queryLogin(admin);
            return admin1;
    }

    @Override
    public void motifyPwd(Admin admin) {
        adminDAO.update(admin);
    }

/*    @Override
    public Admin findById(String id) {
        return adminDAO.queryByid(id);
    }*/
}
