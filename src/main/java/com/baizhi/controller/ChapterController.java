package com.baizhi.controller;

import com.baizhi.entrty.Chapter;
import com.baizhi.service.ChapterService;
import com.baizhi.util.FileImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/chapter")
public class ChapterController {

    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/addChapter")
    private @ResponseBody Map<String,Object> addChapter(Chapter chapter, HttpSession session, MultipartFile file){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            String file1 = FileImg.file(session, file, "back/bannerImg");
            chapter.setDownPath(file1);
            chapterService.add(chapter);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","添加失败");
        }
        return maps;
    }



}
