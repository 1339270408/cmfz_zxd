package com.baizhi.text;

import com.baizhi.dao.AlbumDAO;
import com.baizhi.entrty.Album;
import com.baizhi.service.AlbumService;
import org.aspectj.weaver.ast.Var;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class AlbumTest extends Tests{

    @Autowired
    private AlbumDAO albumDAO;
    @Autowired
    private AlbumService albumService;


    @Test
    public void test1(){
        List<Album> albums = albumDAO.queryPage(0, 2);
        for (Album album : albums) {
            System.out.println(album);
        }
    }
    @Test
    public void test10(){
        List<Album> page = albumService.findPage(1, 2);
        for (Album album : page) {
            System.out.println(album);
        }
    }

    @Test
    public void text2(){
        Album album=new Album("3","xx",new Date(),"44","/back/","22","萨达","撒旦","ss");
        albumDAO.insert(album);
    }

    @Test
    public void text3(){
        Album album=new Album("3","cc",new Date(),"44","/back/","22","萨达","撒旦","bb");
        albumDAO.update(album);
    }

    @Test
    public void text4(){
        albumDAO.delete("3");
    }

    @Test
    public void text5(){
        Album album = albumDAO.queryByid("1");
        System.out.println(album);
    }

    @Test
    public void text6(){
        List<Album> page = albumService.findPage(1, 2);
        for (Album album : page) {
            System.out.println(album);
        }
    }
    @Test
    public void text7(){
        Long total = albumService.total();
        System.out.println(total);
    }



}
