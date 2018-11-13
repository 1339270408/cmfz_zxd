package com.baizhi.service;

import com.baizhi.dao.MenuDAO;
import com.baizhi.entrty.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MenuServiceImp implements MenuService {

    @Autowired
    private MenuDAO menuDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Menu> findAllMenu() {
        return menuDAO.queryAll();
    }
}
