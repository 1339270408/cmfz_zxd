package com.baizhi.text;

import com.baizhi.dao.AdminDAO;
import com.baizhi.entrty.Admin;
import com.baizhi.service.AdminService;
import org.aspectj.weaver.ast.Var;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

public class AdminTest extends Tests{

    @Autowired
    private AdminService adminService;
    @Autowired
    private AdminDAO adminDAO;


    @Test
    public void test1(){
        Admin admin = new Admin("zxd","asd");
        Admin namePwd = adminService.findNamePwd(admin);
        System.out.println(namePwd);
    }

    @Test
    public void test2(){
        Admin admin = new Admin("zxd","123");
        Admin admin1 = adminDAO.queryLogin(admin);
        System.out.println(admin1);
    }



}
