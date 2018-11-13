package com.baizhi.text;

import com.baizhi.dao.GuruDAO;
import com.baizhi.entrty.Guru;
import com.baizhi.service.GuruService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class GuruTest extends Tests {

    @Autowired
    private GuruDAO guruDAO;
    @Autowired
    private GuruService guruService;


    @Test
    public void text1(){
        List<Guru> gurus = guruDAO.queryPage(0, 2);
        System.out.println(gurus);
    }


    @Test
    public void text2(){
        Guru guru=new Guru("10","ss","aa","男");
        guruDAO.insert(guru);
    }

    @Test
    public void text3(){
        Guru guru = guruDAO.queryByid("1");
        System.out.println(guru);
    }
    @Test
    public void text4(){
        Guru byId = guruService.findById("1");
        System.out.println(byId);
    }

    @Test
    public void text5(){
        List<Guru> all = guruService.findAll();
        for (Guru guru : all) {
            System.out.println(guru);
        }
    }

}
