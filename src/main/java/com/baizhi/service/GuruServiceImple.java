package com.baizhi.service;

import com.baizhi.dao.GuruDAO;
import com.baizhi.entrty.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.UUID;

@Service
@RequestMapping("/guru")
public class GuruServiceImple implements GuruService{

    @Autowired
    private GuruDAO guruDAO;

    @Override
    public void add(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDAO.insert(guru);
    }

    @Override
    public void motify(Guru guru) {
        guruDAO.update(guru);
    }

    @Override
    public void remove(String id) {
        guruDAO.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return guruDAO.queryPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Guru findById(String id) {
        return guruDAO.queryByid(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long total() {
        return guruDAO.total();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findAll() {
        return guruDAO.queryAll();
    }
}
