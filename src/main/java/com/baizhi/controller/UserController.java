package com.baizhi.controller;

import com.baizhi.entrty.User;
import com.baizhi.service.UserService;
import com.baizhi.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/addUser")
    public String addUser(User user){
        userService.addUser(user);
        return "redirect:/back/user/login.jsp";
    }



       @RequestMapping("/findLogin")
       public String findLogin(User user,HttpServletRequest request){
           try {
               User login = userService.findLogin(user);
               request.setAttribute("user",login);
               return "redirect:/index.jsp";
           } catch (Exception e) {
               e.printStackTrace();
               String message = e.getMessage();
               request.setAttribute("message",message);
               return "/user/login";
           }

       }

       @RequestMapping("/motifyUser")
       public String motifyUser(User user){
           userService.motifyUser(user);
           return "redirect:/back/user/login.jsp";
       }



}
