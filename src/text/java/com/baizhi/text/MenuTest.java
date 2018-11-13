package com.baizhi.text;

import com.baizhi.dao.MenuDAO;
import com.baizhi.entrty.Menu;
import com.baizhi.service.MenuService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MenuTest extends Tests{

    @Autowired
    private MenuService menuService;
    @Autowired
    private MenuDAO menuDAO;

    @Test
    public void test1(){
        List<Menu> menus = menuDAO.queryAll();
        for (Menu menu1 : menus) {
            System.out.println(menu1);
        }
    }

    @Test
    public void test2(){
        List<Menu> menu = menuService.findAllMenu();
        for (Menu menu1 : menu) {
            System.out.println(menu1);
        }
    }

}
