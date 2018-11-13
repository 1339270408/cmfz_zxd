package com.baizhi.service;

import com.baizhi.dao.CourseDAO;
import com.baizhi.entrty.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Controller
public class CourseServiceimp implements CourseService{

    @Autowired
    private CourseDAO courseDAO;

    @Override
    public void add(Course course) {
        course.setId(UUID.randomUUID().toString());
        course.setCreatTime(new Date());
        courseDAO.insert(course);
    }

    @Override
    public void motify(Course course) {
        courseDAO.update(course);
    }

    @Override
    public void remove(String id) {
        courseDAO.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Course> findPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return courseDAO.queryPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Course findById(String id) {
        return courseDAO.queryByid(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long total() {
        return courseDAO.total();
    }
}
