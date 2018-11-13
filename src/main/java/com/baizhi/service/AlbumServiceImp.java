package com.baizhi.service;

import com.baizhi.dao.AlbumDAO;
import com.baizhi.entrty.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImp implements AlbumService{

    @Autowired
    private AlbumDAO albumDAO;

    @Override
    public void add(Album album) {
        album.setId(UUID.randomUUID().toString());
        album.setPublishDate(new Date());
        albumDAO.insert(album);
    }

    @Override
    public void motify(Album album) {
        albumDAO.update(album);
    }

    @Override
    public void remove(String id) {
        albumDAO.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return albumDAO.queryPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Album findById(String id) {
        return albumDAO.queryByid(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long total() {
        return albumDAO.total();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAll() {
        return albumDAO.queryAll();
    }
}
