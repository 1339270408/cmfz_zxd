package com.baizhi.service;

import com.baizhi.dao.AlbumDAO;
import com.baizhi.dao.ArticleDAO;
import com.baizhi.entrty.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ArticleServiceImp implements ArticleService {

    @Autowired
    private ArticleDAO articleDAO;

    @Override
    public void add(Article article) {
        article.setId(UUID.randomUUID().toString());
        article.setPublishDate(new Date());
        articleDAO.insert(article);
    }

    @Override
    public void motify(Article article) {
        articleDAO.update(article);
    }

    @Override
    public void remove(String id) {
        articleDAO.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Article> findPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return articleDAO.queryPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Article findById(String id) {
        return articleDAO.queryByid(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long total() {
        return articleDAO.total();
    }
}
