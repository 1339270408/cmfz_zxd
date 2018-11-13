package com.baizhi.service;

import com.baizhi.dao.ChapterDAO;
import com.baizhi.entrty.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImp implements ChapterService {

    @Autowired
    private ChapterDAO chapterDAO;

    @Override
    public void add(Chapter chapter) {
        chapter.setId(UUID.randomUUID().toString());
        chapter.setUploadTime(new Date());
        chapterDAO.insert(chapter);
    }

    @Override
    public void motify(Chapter chapter) {
        chapterDAO.update(chapter);
    }

    @Override
    public void remove(String id) {
        chapterDAO.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Chapter> findPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return chapterDAO.queryPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Chapter findById(String id) {
        return chapterDAO.queryByid(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long total() {
        return chapterDAO.total();
    }
}
