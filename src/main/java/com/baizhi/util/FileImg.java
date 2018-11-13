package com.baizhi.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class FileImg {

    public static String file(HttpSession session, MultipartFile file,String fileName){
        try {
            String realPath = session.getServletContext().getRealPath(fileName);
            file.transferTo(new File(realPath,file.getOriginalFilename()));
            return fileName+"/"+file.getOriginalFilename();
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

}
