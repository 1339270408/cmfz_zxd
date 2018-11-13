package com.baizhi.controller;

import com.baizhi.entrty.Menu;
import com.baizhi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("/findAllMenu")
    public @ResponseBody List<Menu> findAllMenu(){
        List<Menu> allMenu = menuService.findAllMenu();
        return allMenu;
    }

}
