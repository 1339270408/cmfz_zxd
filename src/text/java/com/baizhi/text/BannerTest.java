package com.baizhi.text;

import com.baizhi.dao.BannerDAO;
import com.baizhi.entrty.Banner;
import com.baizhi.service.BannerService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class BannerTest extends Tests{

    @Autowired
    private BannerDAO bannerDAO;
    @Autowired
    private BannerService bannerService;

    @Test
    public void text1(){
        List<Banner> banners = bannerDAO.queryPage(0, 2);
        for (Banner banner : banners) {
            System.out.println(banner);
        }

    }

    @Test
    public void text2(){
        Banner banner=new Banner("ss","aa","ss","t");
        bannerService.add(banner);
    }

    @Test
    public void text3(){
        Banner banner=new Banner("20","ss","aa","ss","t",new Date());
        bannerDAO.insert(banner);
    }

    @Test
    public void text4(){
        bannerDAO.delete("44a7a07a-f020-4d16-8c7f-e59e3ecf6f67");
    }

    @Test
    public void text5(){
        Banner byId = bannerService.findById("2");
        System.out.println(byId);
    }
    @Test
    public void text6(){
        Banner banner = bannerDAO.queryByid("2");
        System.out.println(banner);
    }
}
