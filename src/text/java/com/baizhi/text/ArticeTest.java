package com.baizhi.text;

import com.baizhi.dao.ArticleDAO;
import com.baizhi.entrty.Article;
import com.baizhi.service.ArticleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class ArticeTest extends Tests {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleDAO articleDAO;

    @Test
    public void test1(){
        List<Article> page = articleService.findPage(1, 2);
        for (Article article : page) {
            System.out.println(article);
        }
    }

    @Test
    public void test2(){
        List<Article> articles = articleDAO.queryPage(0, 9);
        for (Article article : articles) {
            System.out.println(article);
        }
    }

    @Test
    public void test3(){
        Article article=new Article("89","xx","zz","zz",new Date(),"1");
       articleDAO.insert(article);
    }

    @Test
    public void test4(){
        Article article = new Article("544302a2-cfbf-4401-9507-c0048cb4109e","vv","vv","vv",new Date(),"1");
        articleDAO.update(article);
    }

    @Test
    public void test5(){
        Article article = articleDAO.queryByid("544302a2-cfbf-4401-9507-c0048cb4109e");
        System.out.println(article);
    }

    @Test
    public void test6(){
        Article byId = articleService.findById("544302a2-cfbf-4401-9507-c0048cb4109e");

        System.out.println(byId);
    }


}
