package com.baizhi.entrty;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Banner {
    private String id;
    private String title;
    private String imgPath;
    private String desca;
    private String status;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date date;

    public Banner() {
    }

    public Banner(String id, String title, String imgPath, String desca, String status, Date date) {
        this.id = id;
        this.title = title;
        this.imgPath = imgPath;
        this.desca = desca;
        this.status = status;
        this.date = date;
    }

    public Banner(String title, String imgPath, String desca, String status) {
        this.title = title;
        this.imgPath = imgPath;
        this.desca = desca;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Banner{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", desca='" + desca + '\'' +
                ", status='" + status + '\'' +
                ", date=" + date +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getDesca() {
        return desca;
    }

    public void setDesca(String desca) {
        this.desca = desca;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
