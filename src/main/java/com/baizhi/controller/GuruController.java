package com.baizhi.controller;

import com.baizhi.util.FileImg;
import com.baizhi.entrty.Guru;
import com.baizhi.service.GuruService;
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
@RequestMapping("/guru")
public class GuruController {

    @Autowired
    private GuruService guruService;

    @RequestMapping("/findPage")
    public @ResponseBody Map<String,Object> findPage(Integer page, Integer rows){
        Map<String,Object> maps=new HashMap<String, Object>();
        List<Guru> page1 = guruService.findPage(page, rows);
        Long total = guruService.total();
        maps.put("rows",page1);
        maps.put("total",total);
        return maps;
    }

    @RequestMapping("/removeGuru")
    public @ResponseBody void removeGuru(String id){
        guruService.remove(id);
    }

    @RequestMapping("/removeP")
    public @ResponseBody Map<String,Object> removeP(String[] ids){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            for (int i = 0; i < ids.length; i++) {
                guruService.remove(ids[i]);
                maps.put("success",true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","批量删除失败");
        }
        return maps;
    }

    @RequestMapping("/addguru")
    public @ResponseBody Map<String,Object> addGuru(Guru guru, HttpSession session, MultipartFile file){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            String file1 = FileImg.file(session, file, "/back/bannerImg");
            guru.setHeadPic(file1);
            guruService.add(guru);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","添加失败");
        }
        return maps;
    }

    @RequestMapping("/motifyGuru")
    public @ResponseBody Map<String,Object> motifyGuru(Guru guru,HttpSession session,MultipartFile file){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            String bannerImg = FileImg.file(session, file, "/back/bannerImg");
            guru.setHeadPic(bannerImg);
            guruService.motify(guru);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","更新失败");
        }
        return maps;
    }

    @RequestMapping("/findById")
    public @ResponseBody Guru findById(String id){
        Guru byId = guruService.findById(id);
        return byId;
    }

    @RequestMapping("/findAll")
    public @ResponseBody List<Guru> findAll(){
        List<Guru> page = guruService.findAll();
        return page;
    }


}
