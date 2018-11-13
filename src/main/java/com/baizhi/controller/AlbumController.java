package com.baizhi.controller;

import com.baizhi.entrty.Album;
import com.baizhi.service.AlbumService;
import com.baizhi.service.ChapterService;
import com.baizhi.util.FileImg;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/album")
public class AlbumController {

    @Autowired
    private AlbumService albumService;
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/findPage")
    public @ResponseBody Map<String,Object> findPage(Integer page, Integer rows){
        Map<String,Object> maps=new HashMap<String, Object>();
        List<Album> page1 = albumService.findPage(page, rows);
        Long total = albumService.total();
        maps.put("rows",page1);
        maps.put("total",total);
        return maps;
    }

    @RequestMapping("/removeP")
    public @ResponseBody void removeP(String[] ids){
        for (int i = 0; i < ids.length; i++) {
            albumService.remove(ids[i]);
            chapterService.remove(ids[i]);
        }
    }

    @RequestMapping("/addAlbum")
    public @ResponseBody Map<String,Object> addAlbum(Album album,HttpSession session, MultipartFile file){
        Map<String,Object> maps=new HashMap<String, Object>();

        try {
            String bannerImg = FileImg.file(session, file, "back/bannerImg");
            album.setCoverImg(bannerImg);
            albumService.add(album);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","添加失败");
        }
        return maps;
    }

    @RequestMapping("/motifyAlbum")
    public  @ResponseBody Map<String,Object> motifyAlbum(Album album){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            albumService.motify(album);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","更新失败");
        }
        return maps;
    }

    @RequestMapping("/findById")
    public @ResponseBody Album findById(String id){
        Album byId = albumService.findById(id);
        return byId;
    }

    @RequestMapping("/findAll")
    public @ResponseBody List<Album> findAll(){
        List<Album> all = albumService.findAll();
        return all;
    }



    @RequestMapping("/download")
    public void download(String fileName, String openStyle, HttpServletRequest request, HttpServletResponse response) throws Exception {

        //1.根据接收的文件名去服务中指定目录读取文件
        String realPath = request.getSession().getServletContext().getRealPath("/back/bannerImg");
        System.out.println(realPath);
        String filenames[] = fileName.toString().split("/");
        String filename = filenames[filenames.length-1];
        //2.以文件输入流读取文件
        FileInputStream is = new FileInputStream(new File(realPath, filename));
        //2.1 设置响应头
        response.setHeader("content-disposition", openStyle+";fileName=" + URLEncoder.encode(fileName, "UTF-8"));
        //3.获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        //4.使用IOUtils工具类
        IOUtils.copy(is, os);
        //5.关流
        IOUtils.closeQuietly(is);//安静关流
        IOUtils.closeQuietly(os);
    }

}
