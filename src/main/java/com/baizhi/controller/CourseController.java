package com.baizhi.controller;

import com.baizhi.entrty.Article;
import com.baizhi.entrty.Course;
import com.baizhi.service.CourseService;
import com.baizhi.util.FileImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/findPage")
    public @ResponseBody
    Map<String,Object> findPage(Integer page, Integer rows){
        Map<String,Object> maps=new HashMap<String, Object>();
        List<Course> page1 = courseService.findPage(page, rows);
        Long total = courseService.total();
        maps.put("rows",page1);
        maps.put("total",total);
        return maps;
    }

    @RequestMapping("/removeP")
    public @ResponseBody void removeP(String[] ids){
        for (int i = 0; i < ids.length; i++) {
            courseService.remove(ids[i]);
        }
    }

    @RequestMapping("/addCourse")
    public @ResponseBody Map<String,Object> addArticle(Course course){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            courseService.add(course);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","添加失败");
        }
        return maps;
    }

    @RequestMapping("/motifyCourse")
    public @ResponseBody Map<String,Object> motifyArticle(Course course){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            courseService.motify(course);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","更新失败");
        }
        return maps;
    }

    @RequestMapping("/findById")
    public @ResponseBody Course findById(String id){
        Course byId = courseService.findById(id);
        return byId;
    }

}
