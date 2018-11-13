package com.baizhi.service;

import com.baizhi.dao.BannerDAO;
import com.baizhi.entrty.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImp implements BannerService{

    @Autowired
    private BannerDAO bannerDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Banner> findPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return bannerDAO.queryPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long total() {
        return bannerDAO.total();
    }

    @Override
    public void add(Banner banner) {
        banner.setId(UUID.randomUUID().toString());
        banner.setDate(new Date());
        bannerDAO.insert(banner);
    }

    @Override
    public void remove(String id) {
        bannerDAO.delete(id);
    }

    @Override
    public void motify(Banner banner) {
        bannerDAO.update(banner);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Banner findById(String id) {
        return bannerDAO.queryByid(id);
    }
}
