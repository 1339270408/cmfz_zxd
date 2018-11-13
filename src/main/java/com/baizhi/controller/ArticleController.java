package com.baizhi.controller;

import com.baizhi.entrty.Article;
import com.baizhi.service.ArticleService;
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
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/findPage")
    public @ResponseBody  Map<String,Object> findPage(Integer page,Integer rows){
        Map<String,Object> maps=new HashMap<String, Object>();
        List<Article> page1 = articleService.findPage(page, rows);
        Long total = articleService.total();
        maps.put("rows",page1);
        maps.put("total",total);
        return maps;
    }

    @RequestMapping("/removeP")
    public @ResponseBody void removeP(String[] ids){
        for (int i = 0; i < ids.length; i++) {
            articleService.remove(ids[i]);
        }
    }

    @RequestMapping("/addArticle")
    public @ResponseBody Map<String,Object> addArticle(Article article,HttpSession session,MultipartFile file){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            String bannerImg = FileImg.file(session, file, "/back/bannerImg");
            article.setImgPath(bannerImg);
            articleService.add(article);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","添加失败");
        }
        return maps;
    }

    @RequestMapping("/motifyArticle")
    public @ResponseBody Map<String,Object> motifyArticle(Article article, HttpSession session, MultipartFile file){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            String bannerImg = FileImg.file(session, file, "/back/bannerImg");
            article.setImgPath(bannerImg);
            articleService.motify(article);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","更新失败");
        }
        return maps;
    }

    @RequestMapping("/findById")
    public @ResponseBody Article findById(String id){
        Article byId = articleService.findById(id);
        return byId;
    }

}
