package com.baizhi.controller;

import com.baizhi.util.FileImg;
import com.baizhi.entrty.Banner;
import com.baizhi.service.BannerService;
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
@RequestMapping("/banner")
public class BannerController {

    @Autowired
    private BannerService bannerService;

    @RequestMapping("/findPage")
    public @ResponseBody Map<String ,Object> findPage(Integer page, Integer rows){
        Map<String ,Object> maps=new HashMap<String, Object>();
        List<Banner> page1 = bannerService.findPage(page, rows);
        Long total = bannerService.total();
        maps.put("rows",page1);
        maps.put("total",total);
        return maps;
    }

    @RequestMapping("/addBanner")
    public @ResponseBody Map<String,Object> addBanner(MultipartFile file, Banner banner, HttpSession session){
        Map<String,Object> maps=new HashMap<String, Object>();
        try {
            //获取图片的路径 和 上传文件
            String file1 = FileImg.file(session, file,"/back/bannerImg");
            banner.setImgPath(file1);
            bannerService.add(banner);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","添加失败");
        }
        return maps;
    }

    @RequestMapping("/removeBanner")
    public @ResponseBody void removeBanner(String id){
        bannerService.remove(id);
    }

    @RequestMapping("/removeP")
    public @ResponseBody void removeP(String[] ids){
        for (int i = 0; i < ids.length; i++) {
            bannerService.remove(ids[i]);
        }
    }

    @RequestMapping("/motifyBanner")
    public @ResponseBody Map<String,Object> motifyBanner(HttpSession session,MultipartFile file,Banner banner){
        Map<String,Object> maps=new HashMap<String, Object>();

        try {
            String file1 = FileImg.file(session, file,"/back/bannerImg");
            banner.setImgPath(file1);
            bannerService.motify(banner);
            maps.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("message","更新失败");
        }
        return maps;
    }

        @RequestMapping("/findById")
        public @ResponseBody Banner findById(String id){
            Banner byId = bannerService.findById(id);
            return byId;
        }

}
