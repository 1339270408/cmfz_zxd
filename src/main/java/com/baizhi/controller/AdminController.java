package com.baizhi.controller;

import com.baizhi.entrty.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/adminLogin")
    public String adminLogin(HttpServletRequest request, Admin admin, HttpSession session, String enCode) {
        Admin namePwd = adminService.findNamePwd(admin);
        String vc = (String) session.getAttribute("validationCode");

            if (enCode.equals(vc)) {
               if (namePwd != null) {
                    session.setAttribute("admin", namePwd);
                    return "redirect:/back/main/main.jsp";
                } else {
                    return "admin/login";
                }
            } else {
                return "admin/login";
            }


    }

    @RequestMapping("/closeSession")
    public String closeSession(HttpSession session){
        session.invalidate();
        return "redirect:/back/admin/login.jsp";
    }

    @RequestMapping("/motifyPwd")

    public @ResponseBody Map<String,Object> motifyPwd(HttpSession session,Admin admin,String password2,String password3){
        Map<String,Object> maps=new HashMap<String,Object>();
        Admin admin1 = (Admin) session.getAttribute("admin");
        try {
            if(admin1.getPassword().equals(password2)){
                if(admin.getPassword().equals(password3)){
                    adminService.motifyPwd(admin);
                    session.removeAttribute("admin");
                    session.setAttribute("admin",admin);
                    maps.put("success",true);
                }else {
                    maps.put("success",false);
                    maps.put("message","两次密码不一致");
                }
            }else {
                maps.put("success",false);
                maps.put("message","旧密码错误");
            }
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","修改密码失败");
        }

        return maps;
    }

    /*@RequestMapping("/findById")
    public @ResponseBody Admin findById(String id){
        Admin byId = adminService.findById(id);
        return byId;
    }*/

}
